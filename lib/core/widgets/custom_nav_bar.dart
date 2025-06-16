import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,

      selectedItemColor: null,
      unselectedItemColor: null,

      showSelectedLabels: true,
      showUnselectedLabels: true,

      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFF484C52),
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        color: Color(0xFF484C52),
      ),

      items: [
        _imageItem("assets/icon/home.png", "Home"),
        _svgItem("assets/icon/category.svg", "Category"),
        _svgItem("assets/icon/delivary.svg", "Delivery"),
        _svgItem("assets/icon/cart.svg", "Cart"),
        _svgItem("assets/icon/profile.svg", "Profile"),
      ],
    );
  }

  BottomNavigationBarItem _svgItem(String assetPath, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(assetPath, width: 24, height: 24),
      label: label,
    );
  }

  BottomNavigationBarItem _imageItem(String assetPath, String label) {
    return BottomNavigationBarItem(
      icon: Image.asset(assetPath, width: 24, height: 24),
      label: label,
    );
  }
}
