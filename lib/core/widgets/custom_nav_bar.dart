import 'package:e_commerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Custom widget for the Bottom Navigation Bar
class CustomNavBar extends StatefulWidget {
  // Callback function invoked when an item in the bar is tapped, passing the index of the tapped item
  final Function(int) onTap;
  // The current index of the active item in the bar
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
  // Default color for inactive icons and text
  final Color iconColor = const Color(0xFF484C52);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // Remove the default shadow of the bar
      elevation: 0,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: null,
      unselectedItemColor: null,
      // Show labels for active and inactive items
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        // Use a custom color for the active text (can be modified if desired)
        fontWeight: FontWeight.w500,
        color: iconColor,
      ),
      unselectedLabelStyle: TextStyle(fontSize: 12, color: iconColor),
      items: [
        _imageItem("assets/icon/home.png", "Home", 0),
        _svgItem("assets/icon/category.svg", "Category", 1),
        // Note: The filename "delivary.svg" might be a typo, should be "delivery.svg" if intended
        _svgItem("assets/icon/delivary.svg", "Delivery", 2),
        _svgItem("assets/icon/cart.svg", "Cart", 3),
        _svgItem("assets/icon/profile.svg", "Profile", 4),
      ],
    );
  }

  // Function to create a BottomNavigationBarItem using an SVG image
  BottomNavigationBarItem _svgItem(String assetPath, String label, int index) {
    // Check if this item is currently active
    final isSelected = widget.currentIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // If the item is active, display a colored bar above the icon
          if (isSelected)
            Container(
              width: 50,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.primaryButtonColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
            )
          else
            // If not active, display an empty space to maintain layout
            const SizedBox(height: 4),
          const SizedBox(height: 4),
          // Display SVG image
          SvgPicture.asset(assetPath, width: 24, height: 24),
        ],
      ),
      label: label,
    );
  }

  // Function to create a BottomNavigationBarItem using a regular image (like PNG)
  BottomNavigationBarItem _imageItem(
    String assetPath,
    String label,
    int index,
  ) {
    // Check if this item is currently active
    final isSelected = widget.currentIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // If the item is active, display a colored bar above the icon
          if (isSelected)
            Container(
              width: 50,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.primaryButtonColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
            )
          else
            // If not active, display an empty space to maintain layout
            const SizedBox(height: 5),
          const SizedBox(height: 5),
          // Display the image
          Image.asset(assetPath, width: 24, height: 24),
        ],
      ),
      label: label,
    );
  }
}
