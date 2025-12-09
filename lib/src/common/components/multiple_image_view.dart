import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:typed_data';

class MultipleImageView extends StatefulWidget {
  final List<String> selectedImages;
  final int maxImages;

  const MultipleImageView({
    super.key,
    required this.selectedImages,
    this.maxImages = 10,
  });

  @override
  State<MultipleImageView> createState() => _MultipleImageViewState();
}

class _MultipleImageViewState extends State<MultipleImageView> {
  final RxList<String> _selectedImages = <String>[].obs;
  List<AssetEntity> _assets = [];
  List<AssetPathEntity> _albums = [];
  AssetPathEntity? _currentAlbum;
  bool _isLoading = false;
  bool _showPhotoPicker = false; // 사진 선택 화면 표시 여부

  @override
  void initState() {
    super.initState();
    _selectedImages.value = List.from(widget.selectedImages);
    // 페이지 열릴 때 바로 사진첩 로드
    _requestPermissionAndLoadPhotos();
  }

  // 권한 요청 및 사진첩 접근
  Future<void> _requestPermissionAndLoadPhotos() async {
    // 권한 요청
    final PermissionState permission = await PhotoManager.requestPermissionExtend();
    
    if (permission.isAuth) {
      // 권한 허가됨 - 사진첩 로드
      await _loadPhotos();
    } else if (permission.hasAccess) {
      // 제한적 접근 허용 (iOS 14+)
      await _loadPhotos();
    } else {
      // 권한 거부됨
      _showPermissionDeniedDialog();
    }
  }

  // 사진첩 로드
  Future<void> _loadPhotos() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 모든 앨범 가져오기
      final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        hasAll: true,
      );

      if (albums.isNotEmpty) {
        _albums = albums;
        _currentAlbum = albums.first; // 최근 항목 앨범

        // 첫 번째 앨범의 사진들 가져오기
        final List<AssetEntity> assets = await _currentAlbum!.getAssetListPaged(
          page: 0,
          size: 100,
        );

        setState(() {
          _assets = assets;
          _isLoading = false;
          _showPhotoPicker = true; // 사진 선택 화면 표시
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('사진첩 로드 실패: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 권한 거부 다이얼로그
  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xff2c2c2e),
        title: const Text(
          '권한 필요',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          '사진을 선택하려면 사진첩 접근 권한이 필요합니다.\n설정에서 권한을 허용해주세요.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              PhotoManager.openSetting();
            },
            child: const Text(
              '설정으로 이동',
              style: TextStyle(color: Color(0xffed7738)),
            ),
          ),
        ],
      ),
    );
  }

  // 사진 선택 화면 닫기
  void _closePhotoPicker() {
    setState(() {
      _showPhotoPicker = false;
      _assets = [];
    });
  }

  // 사진 선택
  Future<void> _selectPhoto(AssetEntity asset) async {
    if (_selectedImages.length < widget.maxImages) {
      final file = await asset.file;
      if (file != null) {
        setState(() {
          _selectedImages.add(file.path);
          _showPhotoPicker = false; // 선택 후 사진 선택 화면 닫기
          _assets = [];
        });
      }
    }
  }

  // 사진 선택 그리드 위젯
  Widget _buildPhotoPickerGrid() {
    return Container(
      color: const Color(0xff212123),
      child: Column(
        children: [
          // 헤더
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '사진 선택',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: _closePhotoPicker,
                ),
              ],
            ),
          ),
          // 사진 그리드
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: _assets.length,
              itemBuilder: (context, index) {
                final asset = _assets[index];
                return GestureDetector(
                  onTap: () => _selectPhoto(asset),
                  child: FutureBuilder<Uint8List?>(
                    future: asset.thumbnailDataWithSize(const ThumbnailSize.square(200)),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        );
                      }
                      return Container(
                        color: Colors.grey[800],
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffed7738),
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 이미지 선택 (갤러리/카메라)
  Future<void> _pickImages() async {
    // 권한 요청 및 사진첩 접근
    await _requestPermissionAndLoadPhotos();
  }

  // 이미지 삭제
  void _removeImage(int index) {
    if (index >= 0 && index < _selectedImages.length) {
      _selectedImages.removeAt(index);
    }
  }

  // 완료 버튼 - 선택된 이미지 리스트 반환
  void _onComplete() {
    Get.back(result: _selectedImages.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          '사진 선택 (${_selectedImages.length}/${widget.maxImages})',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )),
        backgroundColor: const Color(0xff212123),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Obx(() => TextButton(
            onPressed: _selectedImages.isEmpty ? null : _onComplete,
            child: Text(
              '완료',
              style: TextStyle(
                color: _selectedImages.isEmpty
                    ? Colors.grey
                    : const Color(0xffed7738),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        ],
      ),
      body: Stack(
        children: [
          // 기본 화면 (선택된 이미지 목록)
          Obx(() => Column(
            children: [
              // 선택된 이미지 그리드
              Expanded(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xffed7738),
                        ),
                      )
                    : _selectedImages.isEmpty
                        ? _buildEmptyState()
                        : _buildImageGrid(),
              ),
              // 하단 버튼 영역
              _buildBottomButtons(),
            ],
          )),
          // 사진 선택 화면 (스택으로 오버레이)
          if (_showPhotoPicker)
            Positioned.fill(
              child: _buildPhotoPickerGrid(),
            ),
        ],
      ),
    );
  }

  // 빈 상태 UI
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: 80,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            '사진을 선택해주세요',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // 이미지 그리드
  Widget _buildImageGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _selectedImages.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            // 이미지
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[800],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _selectedImages[index].startsWith('http')
                    ? Image.network(
                        _selectedImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : Image.file(
                        File(_selectedImages[index]),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
              ),
            ),
            // 순서 번호
            Positioned(
              top: 4,
              left: 4,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xffed7738),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // 삭제 버튼
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => _removeImage(index),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // 하단 버튼 영역
  Widget _buildBottomButtons() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff212123),
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // 갤러리에서 선택 버튼
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _selectedImages.length < widget.maxImages
                  ? _pickImages
                  : null,
              icon: const Icon(Icons.photo_library, size: 20),
              label: const Text('갤러리'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2c2c2e),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // 카메라로 촬영 버튼
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _selectedImages.length < widget.maxImages
                  ? _pickImages
                  : null,
              icon: const Icon(Icons.camera_alt, size: 20),
              label: const Text('카메라'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2c2c2e),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
