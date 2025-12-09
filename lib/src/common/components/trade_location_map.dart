import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'place_name_popup.dart';

class TradeLocationMap extends StatefulWidget {
  const TradeLocationMap({super.key});

  @override
  State<TradeLocationMap> createState() => _TradeLocationMapState();
}

class _TradeLocationMapState extends State<TradeLocationMap> {
  final MapController _mapController = MapController();
  LatLng? myLocation; // 사용자의 현재 위치
  LatLng _selectedLocation = const LatLng(37.5512, 126.8495); // 화곡동 좌표
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  /// 위치 권한 체크 및 사용자 현재 위치 가져오기
  Future<void> _determinePosition() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 1. 위치 서비스 활성화 여부 체크
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _isLoading = false;
        });
        _showLocationServiceDialog();
        return;
      }

      // 2. 위치 권한 체크
      LocationPermission permission = await Geolocator.checkPermission();
      
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _isLoading = false;
          });
          _showPermissionDeniedDialog();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _isLoading = false;
        });
        _showPermissionDeniedForeverDialog();
        return;
      }

      // 3. 권한이 있으면 현재 위치 가져오기
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        // myLocation에 현재 위치 저장
        myLocation = LatLng(position.latitude, position.longitude);
        _selectedLocation = myLocation!;
        _isLoading = false;
      });

      // 지도를 현재 위치로 이동
      _mapController.move(_selectedLocation, 15.0);
    } catch (e) {
      print('위치 가져오기 오류: $e');
      setState(() {
        _isLoading = false;
      });
      Get.snackbar(
        '오류',
        '위치를 가져오는 중 문제가 발생했습니다.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  /// 위치 서비스 비활성화 다이얼로그
  void _showLocationServiceDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xff2c2c2e),
        title: const Text(
          '위치 서비스 사용 불가',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          '위치 서비스가 비활성화되어 있습니다.\n기기의 설정에서 위치 서비스를 활성화해주세요.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              '확인',
              style: TextStyle(color: Color(0xffed7738)),
            ),
          ),
        ],
      ),
    );
  }

  /// 위치 권한 거부 다이얼로그
  void _showPermissionDeniedDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xff2c2c2e),
        title: const Text(
          '위치 권한 필요',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          '현재 위치를 표시하려면 위치 권한이 필요합니다.\n다시 시도하시겠습니까?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              _determinePosition();
            },
            child: const Text(
              '다시 시도',
              style: TextStyle(color: Color(0xffed7738)),
            ),
          ),
        ],
      ),
    );
  }

  /// 위치 권한 영구 거부 다이얼로그
  void _showPermissionDeniedForeverDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xff2c2c2e),
        title: const Text(
          '위치 권한 필요',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          '위치 권한이 영구적으로 거부되었습니다.\n설정에서 권한을 허용해주세요.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          TextButton(
            onPressed: () async {
              Get.back();
              await Geolocator.openAppSettings();
            },
            child: const Text(
              '설정 열기',
              style: TextStyle(color: Color(0xffed7738)),
            ),
          ),
        ],
      ),
    );
  }

  /// 거래 희망 장소 입력 다이얼로그
  Future<void> _showLocationConfirmDialog() async {
    final result = await PlaceNamePopup.show(
      selectedLocation: _selectedLocation,
    );

    if (result != null) {
      Get.back(result: result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212123),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff212123),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          '거래 장소 선택',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _showLocationConfirmDialog();
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 안내 텍스트
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  '이웃과 만나서 거래할 장소를 선택해주세요.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '만나서 거래할 때는 누구나 찾기 쉬운 공공장소가 좋아요.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          // 지도 영역
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _selectedLocation,
                    initialZoom: 15.0,
                    minZoom: 5.0,
                    maxZoom: 18.0,
                    // 드래그 기능 활성화 (기본값: true)
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.all, // 드래그, 핀치줌 등 모든 인터랙션 활성화
                    ),
                    onTap: (tapPosition, point) {
                      setState(() {
                        _selectedLocation = point;
                      });
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.sua.cloneapp.carrot_market_clone_app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _selectedLocation,
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.location_on,
                            color: Color(0xffed7738),
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // 지도 중앙에 고정된 위젯 (nonRotatedChildren 대신 Stack 사용)
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.location_on, color: Color(0xffed7738), size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '지도를 움직여 위치를 선택하세요',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100), // 마커 위치 조정
                    ],
                  ),
                ),
                // 현재 위치 버튼
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: FloatingActionButton(
                    onPressed: _isLoading ? null : _determinePosition,
                    backgroundColor: Colors.white,
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xff212123),
                            ),
                          )
                        : const Icon(
                            Icons.my_location,
                            color: Color(0xff212123),
                          ),
                  ),
                ),
              ],
            ),
          ),
          // 하단 선택된 위치 정보
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xff2c2c2e),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '선택된 위치',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '위도: ${_selectedLocation.latitude.toStringAsFixed(4)}, 경도: ${_selectedLocation.longitude.toStringAsFixed(4)}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 13,
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
