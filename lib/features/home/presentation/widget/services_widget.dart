import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/services_order_bloc/services_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/services_order_bloc/services_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Use BlocBuilder to listen to changes in ServicesBloc and rebuild the UI
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        // Display a circular progress indicator while data is loading
        if (state is ServicesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ServicesLoaded) {
          // If services are loaded successfully but the list is empty
          if (state.services.isEmpty) {
            return const Center(
              child: Text('No services available at the moment.'),
            );
          }

          // Display services in a GridView
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              physics:
                  const NeverScrollableScrollPhysics(), // To prevent scrolling within GridView if it's inside a SingleChildScrollView
              shrinkWrap: true,
              itemCount: state.services.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75, // Width to height ratio for each item
              ),
              itemBuilder: (context, index) {
                // Get the current service from the list
                final service = state.services[index];
                return Column(
                  children: [
                    Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        // Use CachedNetworkImage to load and display images from the internet with caching
                        child: CachedNetworkImage(
                          imageUrl: service.imageUrl,
                          placeholder:
                              (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          // Display an error icon if image loading fails
                          errorWidget:
                              (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const Gap(4),
                    Container(
                      // Display the discount percentage
                      height: 17,
                      width: 65,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primaryButtonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        service.discount,
                        style: AppFonts.font12Medium,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      // Display the service name
                      service.name,
                      style: AppFonts.font14Mediumblack33Color,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          );
        } else if (state is ServicesError) {
          // Display an error message if loading services fails
          return Center(child: Text('An error occurred: ${state.error}'));
        }

        // Display a default message while waiting for the initial state from the Bloc
        return const Center(child: Text('Please wait...'));
      },
    );
  }
}
