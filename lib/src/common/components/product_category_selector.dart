import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategorySelector extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const ProductCategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  // 카테고리 목록
  static const List<Map<String, dynamic>> categories = [
    {'name': '디지털기기', 'icon': Icons.phone_android},
    {'name': '생활가전', 'icon': Icons.tv},
    {'name': '가구/인테리어', 'icon': Icons.chair},
    {'name': '생활/주방', 'icon': Icons.kitchen},
    {'name': '유아동', 'icon': Icons.child_care},
    {'name': '유아도서', 'icon': Icons.book},
    {'name': '여성의류', 'icon': Icons.checkroom},
    {'name': '남성의류', 'icon': Icons.shopping_bag},
    {'name': '여성잡화', 'icon': Icons.watch},
    {'name': '남성잡화', 'icon': Icons.backpack},
    {'name': '뷰티/미용', 'icon': Icons.face},
    {'name': '스포츠/레저', 'icon': Icons.sports_soccer},
    {'name': '취미/게임/음반', 'icon': Icons.videogame_asset},
    {'name': '도서', 'icon': Icons.menu_book},
    {'name': '티켓/교환권', 'icon': Icons.confirmation_number},
    {'name': '가공식품', 'icon': Icons.fastfood},
    {'name': '반려동물용품', 'icon': Icons.pets},
    {'name': '식물', 'icon': Icons.local_florist},
    {'name': '기타 중고물품', 'icon': Icons.category},
    {'name': '삽니다', 'icon': Icons.shopping_cart},
  ];

  void _showCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff212123),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 헤더
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '카테고리 선택',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white10, thickness: 1),
              // 카테고리 리스트
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategory == category['name'];
                    
                    return ListTile(
                      leading: Icon(
                        category['icon'] as IconData,
                        color: isSelected 
                            ? const Color(0xffed7738)
                            : Colors.white.withOpacity(0.6),
                        size: 24,
                      ),
                      title: Text(
                        category['name'] as String,
                        style: TextStyle(
                          color: isSelected 
                              ? const Color(0xffed7738)
                              : Colors.white,
                          fontSize: 16,
                          fontWeight: isSelected 
                              ? FontWeight.bold 
                              : FontWeight.normal,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Color(0xffed7738),
                            )
                          : null,
                      onTap: () {
                        onCategorySelected(category['name'] as String);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCategoryBottomSheet(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedCategory.isEmpty ? '카테고리 선택' : selectedCategory,
              style: TextStyle(
                color: selectedCategory.isEmpty
                    ? Colors.white.withOpacity(0.4)
                    : Colors.white,
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
