import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/ui/screens/change_password.dart';
import 'package:ecommerce/ui/screens/edit_profile.dart';
import 'package:ecommerce/ui/screens/favorites_screen.dart';
import 'package:ecommerce/ui/screens/notifications_screen.dart';
import 'package:ecommerce/ui/screens/orders_screen.dart';
import 'package:ecommerce/ui/screens/privacy_policy_screen.dart';
import 'package:ecommerce/ui/screens/signin_screen.dart';
import 'package:ecommerce/ui/screens/terms_and_conditions_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/app_colors.dart';
import 'addresses_screen.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        title: const Text('Profilo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            if (user != null) const UserData(),
            if (user != null)
              ProfileItem(
                icon: Icons.person,
                label: 'Modifica profilo',
                onTap: () {
                  Navigator.of(context).pushNamed(EditProfile.routeName);
                },
              ),
            if (user != null)
              ProfileItem(
                icon: Icons.password,
                label: 'Cambia password',
                onTap: () {
                  Navigator.of(context).pushNamed(ChangePassword.routeName);
                },
              ),
            if (user == null)
              ProfileItem(
                icon: FontAwesomeIcons.arrowRightFromBracket,
                label: 'Accedi',
                onTap: () {
                  // ref.read(authProvider.notifier).login();
                  Navigator.of(context).pushNamed(SignInScreen.routeName);
                },
              )
            else
              ProfileItem(
                icon: FontAwesomeIcons.message,
                label: 'Notifiche',
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(NotificationsScreen.routeName);
                },
              ),
            if (user != null)
              ProfileItem(
                icon: FontAwesomeIcons.addressBook,
                label: 'Gestione indirizzi',
                onTap: () {
                  Navigator.of(context).pushNamed(AddressesScreen.routeName);
                },
              ),
            if (user != null)
              ProfileItem(
                icon: FontAwesomeIcons.dollarSign,
                label: 'Gestione ordini',
                onTap: () {
                  Navigator.of(context).pushNamed(OrdersScreen.routeName);
                },
              ),
            if (user != null)
              ProfileItem(
                icon: Icons.favorite,
                label: 'I tuoi preferiti',
                onTap: () {
                  Navigator.of(context).pushNamed(FavoritesScreen.routeName);
                },
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
            if (user != null)
              ProfileItem(
                icon: FontAwesomeIcons.arrowRightFromBracket,
                label: 'Logout',
                onTap: () {
                  ref.read(authProvider.notifier).logout();
                },
              ),
            const SizedBox(
              height: 250,
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

class UserData extends ConsumerWidget {
  const UserData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.read(authProvider);
    return Column(
      children: [
        if (user != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 12,
              ),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://imgv3.fotor.com/images/blog-richtext-image/10-profile-picture-ideas-to-make-you-stand-out.jpg'),
                radius: 50,
              ),
              const SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                    text: 'Bentornato ',
                    style: const TextStyle(color: Colors.black87, fontSize: 20),
                    children: [
                      TextSpan(
                        text: user.email,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
