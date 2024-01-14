import 'package:flutter/material.dart';
import 'package:maid/main.dart';
import 'package:provider/provider.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Theme (Light/Dark)'),
            value: Provider.of<MainProvider>(context, listen: false).isDarkMode,
            onChanged: (value) {
              Provider.of<MainProvider>(context, listen: false).toggleTheme();
            },
          ),
          Divider(
            height: 20,
            indent: 10,
            endIndent: 10,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
