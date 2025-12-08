import 'package:flutter/material.dart';
import '../../../common/components/checkbox.dart';
import '../../../common/components/text_field.dart';

class ProductWritePage extends StatelessWidget {
  const ProductWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '내 물건 팔기',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: const Color(0xff212123),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // 완료 동작
            },
            child: const Text(
              '완료',
              style: TextStyle(
                color: Color(0xffed7738),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 스크롤 가능한 입력 영역
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  // 이미지 추가 영역
                  const _ImageSection(),
                  const Divider(color: Colors.white10, thickness: 1),
                  // 제목 입력
                  const _TitleInput(),
                  const Divider(color: Colors.white10, thickness: 1),
                  // 카테고리 선택
                  const _CategorySelect(),
                  const Divider(color: Colors.white10, thickness: 1),
                  // 가격 입력 + 나눔하기 (같은 줄)
                  const _PriceAndShareRow(),
                  const Divider(color: Colors.white10, thickness: 1),
                  // 설명 입력
                  const _DescriptionInput(),
                  const Divider(color: Colors.white10, thickness: 1),
                  // 거래 장소 설정
                  const _LocationInput(),
                  const Divider(color: Colors.white10, thickness: 1),
                ],
              ),
            ),
          ),
          // 하단 툴박스
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff212123),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // 여기에 하단 툴 버튼들 추가 가능
                Text(
                  '하단 툴박스',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection();

  // 이미지 선택 아이콘 버튼
  Widget _photoSelectIcon(int selectedCount) {
    return GestureDetector(
      onTap: () {
        // 이미지 선택 동작
        print('이미지 선택');
      },
      child: Container(
        width: 88,
        height: 88,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white30, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white54,
              size: 32,
            ),
            const SizedBox(height: 4),
            Text(
              '$selectedCount/10',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 선택된 이미지 리스트 (스크롤 가능)
  Widget _selectedImageList(List<String> images) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // 이미지
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  images[index],
                  width: 88,
                  height: 88,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.image,
                        color: Colors.white30,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
              // 삭제 버튼 (우상단)
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () {
                    print('이미지 삭제: $index');
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      shape: BoxShape.circle,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 임시로 선택된 이미지 개수 (나중에 컨트롤러에서 관리)
    final List<String> selectedImages = [
      'https://picsum.photos/200/200?random=1',
      'https://picsum.photos/200/200?random=2',
      'https://picsum.photos/200/200?random=3',
    ];

    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // 이미지 추가 버튼 (고정)
          _photoSelectIcon(selectedImages.length),
          const SizedBox(width: 12),
          // 이미지 리스트 영역 (스크롤 가능)
          _selectedImageList(selectedImages),
        ],
      ),
    );
  }
}

// 제목 입력 위젯
class _TitleInput extends StatelessWidget {
  const _TitleInput();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: CustomTextField(
        hintText: '글 제목',
        maxLines: 1,
      ),
    );
  }
}

// 카테고리 선택 위젯
class _CategorySelect extends StatelessWidget {
  const _CategorySelect();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 카테고리 선택 바텀시트 열기
        print('카테고리 선택');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '카테고리 선택',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 16,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.4),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

// 가격 입력 + 나눔하기 (같은 줄)
class _PriceAndShareRow extends StatefulWidget {
  const _PriceAndShareRow();

  @override
  State<_PriceAndShareRow> createState() => _PriceAndShareRowState();
}

class _PriceAndShareRowState extends State<_PriceAndShareRow> {
  bool _isShare = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // 가격 입력 (서쪽)
          const Expanded(
            child: CustomTextField(
              hintText: '₩ 가격 (선택사항)',
              keyboardType: TextInputType.number,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 16),
          // 나눔하기 체크박스 (동쪽)
          CustomCheckbox(
            value: _isShare,
            onChanged: (value) {
              setState(() {
                _isShare = value;
              });
            },
            label: '나눔하기',
          ),
        ],
      ),
    );
  }
}

// 설명 입력 위젯
class _DescriptionInput extends StatelessWidget {
  const _DescriptionInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '상품 상세 설명',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          const CustomTextField(
            hintText: '올릴 게시글 내용을 작성해주세요.\n(가품 및 판매금지품목은 게시가 제한될 수 있어요.)',
            maxLines: 10,
            minLines: 5,
          ),
        ],
      ),
    );
  }
}

// 거래 장소 입력 위젯
class _LocationInput extends StatelessWidget {
  const _LocationInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '희망하는 거래 장소',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              // 장소 선택 화면 열기
              print('장소 선택');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '화곡동',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.gps_fixed,
                    color: Colors.white.withOpacity(0.5),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
