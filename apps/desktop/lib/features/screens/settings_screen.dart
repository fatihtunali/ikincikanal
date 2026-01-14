import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Account Section
            _SettingsSection(
              title: 'Account',
              children: [
                _SettingsTile(
                  icon: Icons.person_outline,
                  title: 'Profile',
                  subtitle: 'Manage your profile information',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.devices_outlined,
                  title: 'Devices',
                  subtitle: 'Manage linked devices',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.key_outlined,
                  title: 'Keys',
                  subtitle: 'Manage encryption keys',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Privacy Section
            _SettingsSection(
              title: 'Privacy',
              children: [
                _SettingsTile(
                  icon: Icons.lock_outline,
                  title: 'Privacy Settings',
                  subtitle: 'Control who can contact you',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.visibility_off_outlined,
                  title: 'Sealed Sender',
                  subtitle: 'Hide your identity from the server',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.timer_outlined,
                  title: 'Disappearing Messages',
                  subtitle: 'Set default timer for messages',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Appearance Section
            _SettingsSection(
              title: 'Appearance',
              children: [
                _SettingsTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Theme',
                  subtitle: 'Choose light, dark, or system theme',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  subtitle: 'Configure notification settings',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Danger Zone
            _SettingsSection(
              title: 'Danger Zone',
              titleColor: theme.colorScheme.error,
              children: [
                _SettingsTile(
                  icon: Icons.logout,
                  title: 'Sign Out',
                  subtitle: 'Sign out from this device',
                  onTap: () {},
                  iconColor: theme.colorScheme.error,
                ),
                _SettingsTile(
                  icon: Icons.delete_forever_outlined,
                  title: 'Delete Account',
                  subtitle: 'Permanently delete your account',
                  onTap: () {},
                  iconColor: theme.colorScheme.error,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Version info
            Center(
              child: Text(
                'IKINCI KANAL Desktop v1.0.0',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    this.titleColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              color: titleColor ?? theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Card(
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? iconColor;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? theme.iconTheme.color,
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: theme.textTheme.bodySmall?.color,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
