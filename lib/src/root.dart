import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/controller/bottom_nav_controller.dart';
import 'home/page/home_page.dart';

class RootPage extends GetView<BottomNavController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: TabBarView(
        controller: controller.tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          CommunityPage(),
          NearbyPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.menuIndex.value,
        onTap: controller.changeMenu,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff212123),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        enableFeedback: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article),
            label: '동네생활',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: '내 근처',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: '나의 당근',
          ),
        ],
      ),
    ));
  }
}

// 동네생활 페이지
class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동네생활', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff212123),
      ),
      body: const Center(
        child: Text(
          '동네생활',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

// 내 근처 페이지
class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 근처', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff212123),
      ),
      body: const Center(
        child: Text(
          '내 근처',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

// 나의 당근 페이지
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 당근', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff212123),
      ),
      body: const Center(
        child: Text(
          '나의 당근',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
