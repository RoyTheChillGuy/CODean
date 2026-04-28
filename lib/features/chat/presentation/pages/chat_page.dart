import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chatItems = [
      {
        'name': 'Sinar Jaya mutiara',
        'message': 'Yes, Ready sir',
        'avatar': 'images/avatars/avatar1.png',
      },
      {
        'name': 'Cahaya indah',
        'message': 'Sold out',
        'avatar': 'images/avatars/avatar2.png',
      },
      {
        'name': 'Rizky Jawa',
        'message': 'yes, readi',
        'avatar': 'https://ui-avatars.com/api/?name=Rizky+Jawa&background=26A69A&color=fff',
      },
      {
        'name': 'Adnin Jaya',
        'message': 'You can see my prodack',
        'avatar': 'https://ui-avatars.com/api/?name=Adnin+Jaya&background=5C6BC0&color=fff',
      },
      {
        'name': 'CINTA nirwana',
        'message': 'Yes Ready',
        'avatar': 'https://ui-avatars.com/api/?name=Cinta+Nirwana&background=EC407A&color=fff',
      },
      {
        'name': 'Putri Ayu',
        'message': 'Sold out',
        'avatar': 'images/avatars/avatar3.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFC7C7FF),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.chevron_left, color: Colors.white, size: 30),
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  }
                },
              ),
            ),
          ),
        ),
        title: const Text(
          'Chat',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: chatItems.length,
        separatorBuilder: (context, index) => const Divider(
          indent: 20,
          endIndent: 20,
          height: 1,
          color: Color(0xFFEEEEEE),
        ),
        itemBuilder: (context, index) {
          final item = chatItems[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: item['avatar']!.startsWith('http') 
                  ? NetworkImage(item['avatar']!) as ImageProvider
                  : AssetImage(item['avatar']!),
              backgroundColor: Colors.grey.shade200,
            ),
            title: Text(
              item['name']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.textPrimary,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                item['message']!,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                ),
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: AppColors.textPrimary,
              size: 30,
            ),
            onTap: () {
              context.push('/chat/detail', extra: item);
            },
          );
        },
      ),
    );
  }
}
