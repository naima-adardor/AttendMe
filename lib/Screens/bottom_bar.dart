import 'package:attend_me/Screens/generated_qrCode.dart';
import 'package:attend_me/Screens/history_page.dart';
import 'package:attend_me/Screens/home_page.dart';
import 'package:attend_me/Screens/profile_page.dart';
import 'package:attend_me/Screens/scan_page.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:attend_me/Screens/change_password2.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, this.initialIndex});

  final int? initialIndex;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    if (widget.initialIndex != null) {
      _selectedIndex = widget.initialIndex!;
    }
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const QrCodeGeneratedPage(),
    const ScanPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 20,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xFF6096B4),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF6096B4),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_checkmark_circle_regular),
            activeIcon:
                Icon(FluentSystemIcons.ic_fluent_checkmark_circle_filled),
            label: "QrCode",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: 20),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                FluentSystemIcons.ic_fluent_text_bullet_list_square_regular),
            activeIcon: Icon(
                FluentSystemIcons.ic_fluent_text_bullet_list_square_filled),
            label: "history",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            label: "Profile",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const ScanPage(),
            ),
          );
        },
        child: Icon(Icons.qr_code_scanner),
        backgroundColor: const Color(0xFF6096B4),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
