import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/providers/notifications_provider.dart';
import 'package:ecommerce/ui/screens/change_password.dart';
import 'package:ecommerce/ui/screens/edit_profile.dart';
import 'package:ecommerce/ui/screens/favorites_screen.dart';
import 'package:ecommerce/ui/screens/notifications_screen.dart';
import 'package:ecommerce/ui/screens/orders_screen.dart';
import 'package:ecommerce/ui/screens/privacy_policy_screen.dart';
import 'package:ecommerce/ui/screens/settings_screen.dart';
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
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(NotificationsScreen.routeName);
                },
                icon: const Icon(Icons.notifications_none_outlined),
              ),
              Positioned(
                right: 3,
                top: 4,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black54),
                  child: Text(
                    ref
                        .watch(notificationsProvider)
                        .where((element) => element.read == false)
                        .toList()
                        .length
                        .toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 16,
          ),
        ],
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
                  Navigator.of(context).pushNamed(SignInScreen.routeName);
                },
              )
            else
              ProfileItem(
                icon: Icons.messenger_outline,
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
                icon: Icons.credit_card,
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
              icon: Icons.shield_moon,
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
            ProfileItem(
                icon: Icons.settings,
                label: 'Impostazioni',
                onTap: () {
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                }),
            if (user != null)
              ProfileItem(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Sei sicuro di voler effettuare il logout?',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primaryColor)),
                                    onPressed: () {
                                      ref.read(authProvider.notifier).logout();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Logout'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Annulla',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            const SizedBox(
              height: 80,
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
        margin: const EdgeInsets.only(bottom: 12),
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
                backgroundColor: Colors.black,
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
