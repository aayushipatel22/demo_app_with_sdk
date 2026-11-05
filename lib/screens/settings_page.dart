import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [

        const Center(
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 30),

        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Notifications'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

        const Divider(),

        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Security'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

        const Divider(),

        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Language'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

        const Divider(),

        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About Application'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

      ],
    );
  }
}