import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/popular_bloc/popular_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// Widget to display the list of Popular Items
class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Use BlocBuilder to listen to PopularBloc changes and rebuild the UI
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        // If loading, display a circular progress indicator
        if (state is PopularLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PopularLoaded) {
          // If items are loaded successfully
          final items = state.items;
          return SizedBox(
            height: 130, // Specific height for the horizontal list
            child: ListView.separated(
              // Horizontal scrolling for items
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: items.length,
              // `separatorBuilder` to add space between each item
              separatorBuilder: (_, __) => const Gap(10),
              itemBuilder: (context, index) {
                final item = items[index];
                return Column(
                  children: [
                    Container(
                      // Container to display the item's image
                      height: 70,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // Add a border around the image
                        border: Border.all(color: Colors.black12, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          // Display the network image
                          child: CachedNetworkImage(
                            imageUrl: item.imageUrl,
                            fit: BoxFit.fill,
                            placeholder:
                                (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                  ),
                                ),
                            errorWidget:
                                (context, url, error) => const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(5),
                    Text(
                      // Display item name
                      textAlign: TextAlign.center,
                      item.name,
                      style: AppFonts.font12MediumblackColor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        // Time icon
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.grey[600],
                          size: 12,
                        ),
                        Text(
                          // Display item time (assumed to be a string)
                          item.time,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        } else if (state is PopularError) {
          // If an error occurs while loading items, display the error message
          return Center(
            child: Text('Error loading popular items: ${state.message}'),
          );
        } else {
          // In other cases (like initial state), display an empty SizedBox
          return const SizedBox.shrink();
        }
      },
    );
  }
}
