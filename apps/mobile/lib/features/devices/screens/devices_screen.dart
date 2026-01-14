import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/theme/app_theme.dart';
import '../providers/devices_provider.dart';
import '../../../core/models/models.dart';
import '../../../core/storage/secure_storage.dart';

class DevicesScreen extends ConsumerStatefulWidget {
  const DevicesScreen({super.key});

  @override
  ConsumerState<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends ConsumerState<DevicesScreen> {
  String? _currentDeviceId;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      ref.read(devicesProvider.notifier).loadDevices();
      final deviceId = await ref.read(secureStorageProvider).getDeviceId();
      if (mounted) {
        setState(() {
          _currentDeviceId = deviceId;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(devicesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Linked Devices'),
        actions: [
          if (state.devices.length > 1)
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'revoke_all') {
                  _showRevokeAllDialog();
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'revoke_all',
                  child: Text('Logout all other devices'),
                ),
              ],
            ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error loading devices',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          ref.read(devicesProvider.notifier).loadDevices();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: state.devices.length,
                  itemBuilder: (context, index) {
                    final device = state.devices[index];
                    return _DeviceTile(
                      device: device,
                      isCurrentDevice: device.id == _currentDeviceId,
                      onRevoke: () => _revokeDevice(device),
                    );
                  },
                ),
    );
  }

  Future<void> _revokeDevice(Device device) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Revoke Device'),
        content: Text(
          'Are you sure you want to logout "${device.deviceName}"? '
          'You will need to login again on that device.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Revoke'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      final success =
          await ref.read(devicesProvider.notifier).revokeDevice(device.id);
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Device revoked')),
        );
      }
    }
  }

  Future<void> _showRevokeAllDialog() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout All Other Devices'),
        content: const Text(
          'This will logout all devices except the current one. '
          'You will need to login again on those devices.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Logout All'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      final count =
          await ref.read(devicesProvider.notifier).revokeAllDevices();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$count devices logged out')),
        );
      }
    }
  }
}

class _DeviceTile extends StatelessWidget {
  final Device device;
  final bool isCurrentDevice;
  final VoidCallback onRevoke;

  const _DeviceTile({
    required this.device,
    required this.isCurrentDevice,
    required this.onRevoke,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        child: Icon(
          _getDeviceIcon(device.deviceName),
          color: AppColors.primary,
        ),
      ),
      title: Text(device.deviceName),
      subtitle: Text(
        'Last active: ${_formatDate(device.lastActiveAt)}',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: isCurrentDevice
          ? Chip(
              label: const Text('This device'),
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            )
          : IconButton(
              icon: const Icon(Icons.logout, color: Colors.red),
              onPressed: onRevoke,
              tooltip: 'Revoke device',
            ),
    );
  }

  IconData _getDeviceIcon(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('iphone') || lower.contains('ios')) {
      return Icons.phone_iphone;
    } else if (lower.contains('android')) {
      return Icons.phone_android;
    } else if (lower.contains('mac') || lower.contains('desktop')) {
      return Icons.desktop_mac;
    } else if (lower.contains('windows')) {
      return Icons.desktop_windows;
    } else if (lower.contains('web') || lower.contains('browser')) {
      return Icons.web;
    }
    return Icons.devices;
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';

    return '${date.day}/${date.month}/${date.year}';
  }
}
