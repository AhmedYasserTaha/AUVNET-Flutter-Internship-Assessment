import 'dart:io';

import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/widget/bset_order_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widget/get_code_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widget/popular_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widget/services_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widget/shortcuts_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class HomePageBody extends StatefulWidget {
  final String? userName;
  final String? avatarUrl;

  const HomePageBody({super.key, this.userName, this.avatarUrl});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late String? _currentAvatarUrl;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _currentAvatarUrl = widget.avatarUrl;
  }

  Future<void> _pickAndUploadAvatar() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageFile = File(image.path);
      context.read<AuthBloc>().add(AvatarUpdateRequested(image: imageFile));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          final newUrl = state.user?.userMetadata?['avatar_url'];
          if (newUrl != null && newUrl != _currentAvatarUrl) {
            setState(() {
              _currentAvatarUrl = newUrl;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile picture updated!")),
            );
          }
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔶 Header
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryButtonColor,
                      AppColors.orangeColor,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 🔸 User Info
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Delivering to", style: AppFonts.font12Bold),
                            Text(
                              "Al Satwa, 81A Street",
                              style: AppFonts.font16Bold,
                            ),
                            Text(
                              "👋 ${widget.userName ?? "Guest"}",
                              style: AppFonts.font30Bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // 🔸 Profile Image
                      GestureDetector(
                        onTap: _pickAndUploadAvatar,
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return const CircleAvatar(
                                radius: 35,
                                child: CircularProgressIndicator(),
                              );
                            }

                            return CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  (_currentAvatarUrl != null
                                          ? NetworkImage(_currentAvatarUrl!)
                                          : const AssetImage(
                                            "assets/image/photo.png",
                                          ))
                                      as ImageProvider,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(12),

              // 🔶 Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Services:', style: AppFonts.font20Bold),
              ),

              const Gap(20),

              // 🔶 Services Widget (List from Supabase)
              const ServicesWidget(),

              const Gap(30),

              GetCodeWidget(),
              const Gap(15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Shortcuts:', style: AppFonts.font20Bold),
              ),
              const Gap(20),

              ShortcutsGrid(),
              const Gap(30),

              BestOrderWidget(),
              const Gap(30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Popular restaurants nearby:',
                  style: AppFonts.font16Bold,
                ),
              ),
              const Gap(15),

              PopularWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
