import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

/// 거래 희망 장소 이름 입력 팝업
class PlaceNamePopup extends StatelessWidget {
  final LatLng selectedLocation;
  final TextEditingController controller;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const PlaceNamePopup({
    super.key,
    required this.selectedLocation,
    required this.controller,
    required this.onConfirm,
    required this.onCancel,
  });

  /// 팝업 표시 (static 메서드)
  static Future<Map<String, dynamic>?> show({
    required LatLng selectedLocation,
  }) async {
    final TextEditingController locationNameController = TextEditingController();

    final result = await Get.dialog<Map<String, dynamic>?>(
      PlaceNamePopup(
        selectedLocation: selectedLocation,
        controller: locationNameController,
        onConfirm: () {
          final data = {
            'location': selectedLocation,
            'name': locationNameController.text.trim(),
          };
          Get.back(result: data);
        },
        onCancel: () {
          Get.back(result: null);
        },
      ),
      barrierDismissible: true, // 뒷배경 터치시 팝업 닫기
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xff2c2c2e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 제목
            const Text(
              '거래 희망 장소',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // 선택된 위치 정보
            _buildLocationInfo(),
            
            const SizedBox(height: 16),
            
            // 장소 이름 입력 필드
            _buildLocationNameField(),
            
            const SizedBox(height: 20),
            
            // 버튼
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  /// 선택된 위치 정보 위젯
  Widget _buildLocationInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff212123),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Color(0xffed7738),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                '선택된 위치',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '위도: ${selectedLocation.latitude.toStringAsFixed(6)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          Text(
            '경도: ${selectedLocation.longitude.toStringAsFixed(6)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  /// 장소 이름 입력 필드
  Widget _buildLocationNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '장소 이름 (선택사항)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: '예) 화곡역 1번 출구',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            filled: true,
            fillColor: const Color(0xff212123),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  /// 취소/완료 버튼
  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onCancel,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: const Color(0xff212123),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              '취소',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextButton(
            onPressed: onConfirm,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: const Color(0xffed7738),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              '선택 완료',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
