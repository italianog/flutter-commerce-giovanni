import 'package:ecommerce/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/themes.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings-screen';

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impostazioni'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            SwitchListTile(
              title: const Text('Modalità tema scuro'),
              value: theme == AppThemes.lightTheme ? false : true,
              onChanged: (value) {
                if (value == true) {
                  ref.read(themeProvider.notifier).selectDarkTheme();
                } else {
                  ref.read(themeProvider.notifier).selectLightTheme();
                }
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
