import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/theme/app_theme.dart';

class ContactsScreen extends ConsumerWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Replace with real contacts
    final contacts = [
      _Contact(id: '1', name: 'Alice', handle: 'alice'),
      _Contact(id: '2', name: 'Bob', handle: 'bob'),
      _Contact(id: '3', name: 'Charlie', handle: 'charlie'),
      _Contact(id: '4', name: 'Diana', handle: 'diana'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_outlined),
            onPressed: () {
              _showAddContactDialog(context);
            },
          ),
        ],
      ),
      body: contacts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.contacts_outlined,
                    size: 64,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No contacts yet',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add contacts to start messaging',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => _showAddContactDialog(context),
                    icon: const Icon(Icons.person_add),
                    label: const Text('Add Contact'),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return _ContactTile(contact: contact);
              },
            ),
    );
  }

  void _showAddContactDialog(BuildContext context) {
    final handleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Contact'),
        content: TextField(
          controller: handleController,
          decoration: const InputDecoration(
            labelText: 'Handle',
            hintText: 'user@server.com',
            prefixIcon: Icon(Icons.alternate_email),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Add contact
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class _Contact {
  final String id;
  final String name;
  final String handle;

  _Contact({
    required this.id,
    required this.name,
    required this.handle,
  });
}

class _ContactTile extends StatelessWidget {
  final _Contact contact;

  const _ContactTile({required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        child: Text(
          contact.name[0].toUpperCase(),
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      title: Text(contact.name),
      subtitle: Text('@${contact.handle}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.chat_outlined, color: AppColors.primary),
            onPressed: () {
              // TODO: Open chat
            },
          ),
          IconButton(
            icon: Icon(Icons.call_outlined, color: AppColors.primary),
            onPressed: () {
              // TODO: Call
            },
          ),
        ],
      ),
    );
  }
}
