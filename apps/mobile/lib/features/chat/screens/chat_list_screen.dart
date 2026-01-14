import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/theme/app_theme.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Replace with real chat data
    final chats = [
      _ChatPreview(
        id: '1',
        name: 'Alice',
        lastMessage: 'Hey, how are you?',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
        unreadCount: 2,
        isOnline: true,
      ),
      _ChatPreview(
        id: '2',
        name: 'Bob',
        lastMessage: 'See you tomorrow!',
        time: DateTime.now().subtract(const Duration(hours: 1)),
        unreadCount: 0,
        isOnline: false,
      ),
      _ChatPreview(
        id: '3',
        name: 'Charlie',
        lastMessage: 'The meeting is at 3pm',
        time: DateTime.now().subtract(const Duration(days: 1)),
        unreadCount: 0,
        isOnline: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: chats.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 64,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No conversations yet',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start a new chat to begin messaging',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return _ChatListTile(
                  chat: chat,
                  onTap: () => context.go('/chats/${chat.id}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to new chat screen
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class _ChatPreview {
  final String id;
  final String name;
  final String lastMessage;
  final DateTime time;
  final int unreadCount;
  final bool isOnline;

  _ChatPreview({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.isOnline,
  });
}

class _ChatListTile extends StatelessWidget {
  final _ChatPreview chat;
  final VoidCallback onTap;

  const _ChatListTile({
    required this.chat,
    required this.onTap,
  });

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}d';
    } else {
      return '${time.day}/${time.month}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Text(
              chat.name[0].toUpperCase(),
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (chat.isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              chat.name,
              style: TextStyle(
                fontWeight: chat.unreadCount > 0
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ),
          ),
          Text(
            _formatTime(chat.time),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: chat.unreadCount > 0
                      ? AppColors.primary
                      : AppColors.textTertiary,
                ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              chat.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: chat.unreadCount > 0
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
            ),
          ),
          if (chat.unreadCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                chat.unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
