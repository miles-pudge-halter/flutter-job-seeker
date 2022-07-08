import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_seeker/Constants.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1657038976086-15f6fe70afae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Anastasia',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Bangkok, Thailand',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildProfileDetails('Applied', '203'),
                    _buildProfileDetails('Reviewed', '193'),
                    _buildProfileDetails('Contacted', '186'),
                  ],
                ),
                const SizedBox(height: 30),
                _buildAboutSection(context),
                const SizedBox(height: 40),
                _buildSkillsSection(context),
                const SizedBox(height: 40),
                _buildMenuItems(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 10),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Colors.grey.shade500,
              ),
        ),
      ],
    );
  }

  _buildSkillsSection(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My skills',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 2,
            children: [
              _buildSkillChip('Web Design'),
              _buildSkillChip('Android'),
              _buildSkillChip('Kotlin'),
              _buildSkillChip('iOS'),
              _buildSkillChip('Swift'),
              _buildSkillChip('Flutter'),
              _buildSkillChip('Dart'),
            ],
          )
        ],
      ),
    );
  }

  _buildSkillChip(String title) {
    return Chip(
      label: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: ThemeColor().blue,
    );
  }

  signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/entry');
  }

  _buildMenuItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Settings', style: Theme.of(context).textTheme.headline3),
        const SizedBox(height: 20),
        _buildMenuItem('Applied Jobs', () {}),
        const SizedBox(height: 10),
        _buildMenuItem('Edit your profile', () {}),
        const SizedBox(height: 10),
        _buildMenuItem('Notifications', () {}),
        const SizedBox(height: 10),
        _buildMenuItem('Post a Project', () {}),
        const SizedBox(height: 20),
        Text('Account Settings', style: Theme.of(context).textTheme.headline3),
        const SizedBox(height: 20),
        _buildMenuItem('Membership', () {}),
        const SizedBox(height: 10),
        _buildMenuItem('Payment', () {}),
        const SizedBox(height: 10),
        _buildMenuItem('Sign Out', signOut),
      ],
    );
  }

  _buildMenuItem(String title, void Function() onClick) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: Colors.grey.shade300,
      ),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildProfileDetails(String title, String body) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
        ),
        const SizedBox(height: 4),
        Text(
          body,
          style: TextStyle(
            fontSize: 14,
            color: ThemeColor().black,
          ),
        )
      ],
    );
  }
}
