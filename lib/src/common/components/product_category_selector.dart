import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../product/write/controller/product_write_controller.dart';
import '../enum/market_enum.dart';

class ProductCategorySelector extends GetView<ProductWriteController> {
  const ProductCategorySelector({super.key});

  // 카테고리 목록 (enum 기반)
  static const Map<ProductCategoryType, IconData> categoryIcons = {
    ProductCategoryType.digital: Icons.phone_android,
    ProductCategoryType.householdAppliances: Icons.tv,
    ProductCategoryType.furniture: Icons.chair,
    ProductCategoryType.life: Icons.kitchen,
    ProductCategoryType.children: Icons.child_care,
    ProductCategoryType.childrenBooks: Icons.book,
    ProductCategoryType.womenClothing: Icons.checkroom,
    ProductCategoryType.womenAccessories: Icons.watch,
    ProductCategoryType.menFashion: Icons.shopping_bag,
    ProductCategoryType.beauty: Icons.face,
    ProductCategoryType.sports: Icons.sports_soccer,
    ProductCategoryType.hobby: Icons.videogame_asset,
    ProductCategoryType.books: Icons.menu_book,
    ProductCategoryType.ticket: Icons.confirmation_number,
    ProductCategoryType.processedFood: Icons.fastfood,
    ProductCategoryType.petSupplies: Icons.pets,
  };

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
                child: Obx(() {
                  // GetX 오류 방지: .value를 한 번만 추출
                  final selectedCategoryValue = controller.selectedCategory.value;
                  
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoryIcons.length,
                    itemBuilder: (context, index) {
                      final category = categoryIcons.keys.elementAt(index);
                      final icon = categoryIcons[category]!;
                      final isSelected = selectedCategoryValue == category.label;
                      
                      return ListTile(
                        leading: Icon(
                          icon,
                          color: isSelected 
                              ? const Color(0xffed7738)
                              : Colors.white.withOpacity(0.6),
                          size: 24,
                        ),
                        title: Text(
                          category.label,
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
                          controller.selectCategory(category.label);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }),
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
            Obx(() {
              final category = controller.selectedCategory.value;
              return Text(
                category.isEmpty ? '카테고리 선택' : category,
                style: TextStyle(
                  color: category.isEmpty
                      ? Colors.white.withOpacity(0.4)
                      : Colors.white,
                  fontSize: 16,
                ),
              );
            }),
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
