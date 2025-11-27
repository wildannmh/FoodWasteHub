import 'package:flutter/material.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'name': 'Pak Budi (Pengolah)',
        'msg': 'Halo, apakah limbah sayurnya masih ada?',
        'time': '10:30',
        'count': '2',
      },
      {
        'name': 'CV Pupuk Organik',
        'msg': 'Saya siap jemput jam 2 siang ya.',
        'time': '09:15',
        'count': '0',
      },
      {
        'name': 'Bu Siti (Warung)',
        'msg': 'Harga bisa kurang sedikit gan?',
        'time': 'Kemarin',
        'count': '0',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (c, i) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[200],
              child: Text(
                chat['name']![0],
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              chat['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              chat['msg']!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: chat['count'] != '0' ? Colors.black87 : Colors.grey,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat['time']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                if (chat['count'] != '0') ...[
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF4CAF50),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat['count']!,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              ],
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
