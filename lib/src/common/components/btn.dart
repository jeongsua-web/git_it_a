import 'package:flutter/material.dart';
import 'package:carrot_market_clone_app/src/common/components/app_font.dart';

class Btn extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const Btn({
    super.key,
    required this.child,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect( // 모서리 둥글게 - Container decoration 
        borderRadius: BorderRadius.circular(7),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          color: const Color(0xffed7738),
          child: const Center(
            child: AppFont(
              '시작하기',
              align: TextAlign.center,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}