import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:por2/features/admin_request/presentation/screens/admin_request_success_screen.dart';
import 'package:por2/features/profile/presentation/cubit/profile_states.dart';
import 'package:por2/features/profile/presentation/cubit/profile_view_model.dart';
import 'package:por2/domain/entities/response/user.dart';
import 'package:por2/Home_Screen.dart';
import 'package:por2/setting.dart';
import 'package:por2/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:por2/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:por2/features/admin_request/presentation/screens/admin_request_screen.dart';
import 'package:por2/Booking.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:por2/shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<ProfileViewModel>()..getProfile(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'الملف الشخصي',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<ProfileViewModel, ProfileStates>(
            builder: (context, state) {
              if (state is ProfileLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileErrorState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message, style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context.read<ProfileViewModel>().getProfile(),
                        child: const Text('إعادة المحاولة'),
                      ),
                    ],
                  ),
                );
              } else if (state is ProfileSuccessState) {
                return _buildProfileContent(context, state.user);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, User user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── User Info Section ──────────────────────────────────────────
          _UserInfoCard(
            userName: user.name ?? 'Mohamed Nasr EL-Deen',
            userEmail: user.email ?? 'mohammed.nasr@email.com',
            userAvatar: user.profilePic ?? 'https://i.pravatar.cc/300',
          ),

          const SizedBox(height: 30),

          // ── Activity Section ───────────────────────────────────────────
          const _SectionHeader(title: 'النشاط'),
          const SizedBox(height: 10),
          _MenuCard(
            items: [
              _MenuItem(
                label: 'حجوزاتي',
                icon: Icons.calendar_today_outlined,
                iconColor: Colors.blue.shade300,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BookingsPage()),
                  );
                },
              ),
              _MenuItem(
                label: 'المفضلات',
                icon: Icons.favorite_border,
                iconColor: Colors.pink.shade300,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FavoritesScreen()),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 25),

          // ── Admin Section ──────────────────────────────────────────────
          const _SectionHeader(title: 'اضافه شاطئ'),
          const SizedBox(height: 10),
          _MenuCard(
            items: [
              _MenuItem(
                label: 'تقديم طلب ادمن شاطئ',
                icon: Icons.assignment_outlined,
                iconColor: Colors.blue.shade300,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminRequestScreen()),
                  );
                },
              ),
              _MenuItem(
                label: 'تابع الطلب',
                icon: Icons.assignment_outlined,
                iconColor: Colors.blue.shade300,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminRequestSuccessScreen()),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 40),

          // ── Logout Button ──────────────────────────────────────────────
          const _LogoutButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ── User Info Card ────────────────────────────────────────────────────────────
class _UserInfoCard extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userAvatar;

  const _UserInfoCard({
    required this.userName,
    required this.userEmail,
    required this.userAvatar,
  });

  @override
  State<_UserInfoCard> createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<_UserInfoCard> {
  String? _imageBase64;

  @override
  void initState() {
    super.initState();
    _loadLocalImage();
  }

  Future<void> _loadLocalImage() async {
    final prefs = await SharedPreferencesUtils.getPreferences();
    if (mounted) {
      setState(() {
        _imageBase64 = prefs.getString('imageBase64');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
              if (result == true && context.mounted) {
                context.read<ProfileViewModel>().getProfile();
              }
              // Refresh local image even if network data isn't reloaded
              _loadLocalImage();
            },
            icon: const Icon(Icons.edit_outlined, color: Colors.blue),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  widget.userEmail,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: ClipOval(
              child: _imageBase64 != null
                  ? Image.memory(
                      base64Decode(_imageBase64!),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 40, color: Colors.grey),
                    )
                  : Image.network(
                      widget.userAvatar,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section Header ─────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Menu Card ──────────────────────────────────────────────────────────────────
class _MenuCard extends StatelessWidget {
  final List<_MenuItem> items;
  const _MenuCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              InkWell(
                onTap: item.onTap,
                borderRadius: BorderRadius.vertical(
                  top: index == 0 ? const Radius.circular(16) : Radius.zero,
                  bottom: index == items.length - 1 ? const Radius.circular(16) : Radius.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios, size: 14, color: Colors.grey),
                      const Spacer(),
                      Text(
                        item.label,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(item.icon, color: item.iconColor, size: 20),
                      ),
                    ],
                  ),
                ),
              ),
              if (index < items.length - 1)
                const Divider(height: 1, indent: 20, endIndent: 20),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _MenuItem {
  final String label;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const _MenuItem({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });
}

// ── Logout Button ─────────────────────────────────────────────────────────────
class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF4FC3F7), Color(0xFF29B6F6)],
        ),
      ),
      child: ElevatedButton(
        onPressed: () async {
          await context.read<ProfileViewModel>().logout();
          if (context.mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تسجيل الخروج',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.logout, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
