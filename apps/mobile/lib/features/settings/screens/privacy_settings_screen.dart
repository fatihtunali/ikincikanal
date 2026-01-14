import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../user/providers/privacy_provider.dart';

class PrivacySettingsScreen extends ConsumerStatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  ConsumerState<PrivacySettingsScreen> createState() =>
      _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends ConsumerState<PrivacySettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final privacyState = ref.watch(privacyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy & Security'),
      ),
      body: ListView(
        children: [
          const _SectionHeader('Data'),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Export My Data'),
            subtitle: const Text('Download all your data (GDPR)'),
            trailing: privacyState.isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.chevron_right),
            onTap: privacyState.isLoading ? null : _exportData,
          ),
          const Divider(),
          const _SectionHeader('Danger Zone'),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.orange),
            title: const Text('Delete Account'),
            subtitle: const Text('Permanently delete your account'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showDeleteAccountDialog(),
          ),
          ListTile(
            leading: const Icon(Icons.warning, color: Colors.red),
            title: const Text('Nuke Everything'),
            subtitle: const Text('Emergency deletion - 30 second countdown'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showNukeDialog(),
          ),
        ],
      ),
    );
  }

  Future<void> _exportData() async {
    final export = await ref.read(privacyProvider.notifier).exportData();
    if (export != null && mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Data Export'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Exported at: ${export.exportedAt}'),
              const SizedBox(height: 8),
              Text('Handle: ${export.user.fullHandle}'),
              Text('Devices: ${export.devices.length}'),
              Text('Pending messages: ${export.messageCount}'),
              const SizedBox(height: 16),
              const Text(
                'Note: Message content is end-to-end encrypted '
                'and cannot be exported by the server.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _showDeleteAccountDialog() async {
    final passwordController = TextEditingController();

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'This action is PERMANENT. All your data will be deleted.',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Enter your password to confirm',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete Account'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      final success = await ref
          .read(privacyProvider.notifier)
          .deleteAccount(passwordController.text);
      if (success && mounted) {
        context.go('/auth/login');
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ref.read(privacyProvider).error ?? 'Failed to delete account',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    passwordController.dispose();
  }

  Future<void> _showNukeDialog() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: Colors.red),
            SizedBox(width: 8),
            Text('Nuclear Option'),
          ],
        ),
        content: const Text(
          'This will DELETE EVERYTHING:\n\n'
          '- All your messages\n'
          '- All your devices\n'
          '- All your keys\n'
          '- Your entire account\n\n'
          'You will have 30 seconds to cancel after initiating.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Initiate Nuke'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      final success = await ref.read(privacyProvider.notifier).initiateNuke();
      if (success && mounted) {
        _showNukeCountdownDialog();
      }
    }
  }

  void _showNukeCountdownDialog() {
    final state = ref.read(privacyProvider);
    if (state.nukeResponse == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _NukeCountdownDialog(
        nukeToken: state.nukeResponse!.nukeToken,
        expiresAt: state.nukeResponse!.expiresAt,
        onConfirm: () async {
          final success = await ref
              .read(privacyProvider.notifier)
              .confirmNuke(state.nukeResponse!.nukeToken);
          if (success) {
            if (!context.mounted) return;
            Navigator.of(context).pop();
            if (!context.mounted) return;
            context.go('/auth/login');
          }
        },
        onCancel: () {
          ref.read(privacyProvider.notifier).clearNukeResponse();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class _NukeCountdownDialog extends StatefulWidget {
  final String nukeToken;
  final DateTime expiresAt;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const _NukeCountdownDialog({
    required this.nukeToken,
    required this.expiresAt,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  State<_NukeCountdownDialog> createState() => _NukeCountdownDialogState();
}

class _NukeCountdownDialogState extends State<_NukeCountdownDialog> {
  late int _secondsRemaining;

  @override
  void initState() {
    super.initState();
    _updateCountdown();
    _startCountdown();
  }

  void _updateCountdown() {
    final remaining = widget.expiresAt.difference(DateTime.now()).inSeconds;
    setState(() {
      _secondsRemaining = remaining > 0 ? remaining : 0;
    });
  }

  void _startCountdown() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      _updateCountdown();
      return _secondsRemaining > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nuke Countdown'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$_secondsRemaining',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const Text('seconds remaining'),
          const SizedBox(height: 16),
          const Text(
            'Click "Confirm Nuke" to proceed or "Cancel" to abort.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: widget.onCancel,
          child: const Text('Cancel'),
        ),
        if (_secondsRemaining > 0)
          TextButton(
            onPressed: widget.onConfirm,
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Confirm Nuke'),
          ),
      ],
    );
  }
}
