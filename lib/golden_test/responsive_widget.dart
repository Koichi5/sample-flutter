import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    const searchItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth * 0.65,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Input Text',
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: screenWidth * 0.25,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Search'),
                ),
              ),
            ],
          ),
          ...searchItems.map(
            (item) => ListTile(
              title: Text(item),
            ),
          ),
        ],
      ),
    );
  }
}
