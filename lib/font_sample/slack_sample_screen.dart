import 'package:flutter/material.dart';

class SlackSampleScreen extends StatelessWidget {
  const SlackSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.purple,
              child: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: const Text(
          'Slack Sample Group',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.purple,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ジャンプまたは検索',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                _buildCard(Icons.mail, 'キャッチアップ', '新規 16 件'),
                _buildCard(Icons.chat, 'スレッド', '新規 8 件'),
                _buildCard(Icons.headset, 'ハドルミーティ', '0 件のライブ'),
              ],
            ),
            const Divider(),
            _buildSectionTitle('メンション'),
            _buildChannel('general', '3'),
            _buildChannel('dev-all', '1'),
            const Divider(),
            _buildSectionTitle('未読'),
            _buildChannel('design'),
            _buildChannel('dev-flutter'),
            _buildChannel('random'),
            _buildChannel('times-slack'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String subtitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.purple),
            Text(title, textAlign: TextAlign.center),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannel(String name, [String? count]) {
    return ListTile(
      title: Text(
        '# $name',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: count != null
          ? CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 12,
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            )
          : null,
    );
  }
}
