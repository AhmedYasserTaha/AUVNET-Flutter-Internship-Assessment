import 'dart:io';

import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/core/di/injection.dart';
import 'package:e_commerce_app/features/auth/domain/usecases/get_current_user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameController = TextEditingController();
  String? _avatarUrl;
  File? _newAvatarFile;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _loadUserProfile() async {
    setState(() => _isLoading = true);
    try {
      final user = sl<GetCurrentUserUseCase>()();
      if (user != null && mounted) {
        _nameController.text = user.userMetadata?['display_name'] ?? '';
        setState(() {
          _avatarUrl = user.userMetadata?['avatar_url'];
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load profile: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      setState(() {
        _newAvatarFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _updateProfile() async {
    setState(() => _isLoading = true);

    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('You are not logged in.')));
      setState(() => _isLoading = false);
      return;
    }

    try {
      String? newAvatarUrl;
      // 1. رفع الصورة الجديدة إذا تم اختيارها
      if (_newAvatarFile != null) {
        final fileName =
            '${user.id}/${DateTime.now().millisecondsSinceEpoch}.png';
        await supabase.storage
            .from('avatars')
            .upload(fileName, _newAvatarFile!);
        newAvatarUrl = supabase.storage.from('avatars').getPublicUrl(fileName);
      }

      // 2. تحديث بيانات المستخدم
      final updates = {
        'display_name': _nameController.text.trim(),
        if (newAvatarUrl != null) 'avatar_url': newAvatarUrl,
      };

      await supabase.auth.updateUser(UserAttributes(data: updates));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
        setState(() {
          if (newAvatarUrl != null) {
            _avatarUrl = newAvatarUrl;
            _newAvatarFile = null;
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _signOut() async {
    setState(() => _isLoading = true);
    try {
      await Supabase.instance.client.auth.signOut();
      if (mounted) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(AppRoutes.splashRoute, (route) => false);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign out: ${e.toString()}')),
        );
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    _buildAvatar(),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _pickImage,
                      child: const Text('Change Profile Picture'),
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _updateProfile,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Save Changes'),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _signOut,
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text('Sign Out'),
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildAvatar() {
    Widget image;
    if (_newAvatarFile != null) {
      image = Image.file(
        _newAvatarFile!,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      );
    } else if (_avatarUrl != null && _avatarUrl!.isNotEmpty) {
      image = Image.network(
        _avatarUrl!,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _defaultAvatar(),
      );
    } else {
      image = _defaultAvatar();
    }
    return ClipOval(child: image);
  }

  Widget _defaultAvatar() {
    return Container(
      width: 120,
      height: 120,
      color: Colors.grey.shade300,
      child: Icon(Icons.person, size: 80, color: Colors.grey.shade600),
    );
  }
}
