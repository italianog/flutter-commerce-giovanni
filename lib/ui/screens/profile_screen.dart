import 'package:ecommerce/ui/screens/notifications_screen.dart';
import 'package:ecommerce/ui/screens/privacy_policy_screen.dart';
import 'package:ecommerce/ui/screens/signin_screen.dart';
import 'package:ecommerce/ui/screens/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.backgroundGrey,
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            ProfileItem(
              icon: FontAwesomeIcons.arrowRightFromBracket,
              label: 'Accedi',
              onTap: () {
                Navigator.of(context).pushNamed(SignInScreen.routeName);
              },
            ),
            ProfileItem(
              icon: FontAwesomeIcons.message,
              label: 'Notifiche',
              onTap: () {
                Navigator.of(context).pushNamed(NotificationsScreen.routeName);
              },
            ),
            const SizedBox(
              height: 32,
            ),
            ProfileItem(
              icon: FontAwesomeIcons.shield,
              label: 'Termini e condizioni',
              onTap: () {
                Navigator.of(context)
                    .pushNamed(TermsAndConditionsScreen.routeName);
              },
            ),
            ProfileItem(
              icon: FontAwesomeIcons.lock,
              label: 'Privacy Policy',
              onTap: () {
                Navigator.of(context).pushNamed(PrivacyPolicyScreen.routeName);
              },
            ),
            const SizedBox(
              height: 1000,
            )
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 8),
        color: Colors.white,
        child: Row(
          children: [
            FaIcon(icon),
            const SizedBox(
              width: 16,
            ),
            Text(label),
            const Spacer(),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
