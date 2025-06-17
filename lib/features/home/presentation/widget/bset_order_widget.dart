import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_event.dart';
import 'package:e_commerce_app/features/home/presentation/bloc/best_order_bloc/best_order_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BestOrderWidget extends StatefulWidget {
  const BestOrderWidget({super.key});

  @override
  State<BestOrderWidget> createState() => _BestOrderWidgetState();
}

class _BestOrderWidgetState extends State<BestOrderWidget> {
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    context.read<BestOrderBloc>().add(LoadBestOrdersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestOrderBloc, BestOrderState>(
      builder: (context, state) {
        if (state is BestOrderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BestOrderLoaded) {
          final images = state.images;

          return Column(
            children: [
              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(images[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: _controller,
                count: images.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: AppColors.primaryButtonColor,
                ),
              ),
            ],
          );
        } else if (state is BestOrderError) {
          return Center(child: Text('خطأ: ${state.message}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
