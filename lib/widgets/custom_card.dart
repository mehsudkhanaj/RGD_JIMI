import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String content;
  final bool isProfile;
  const CustomCard(
      {required this.title,
      required this.content,
      this.isProfile = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              // textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const Divider(
              thickness: 1,
              color: Colors.orange,
            ),
            isProfile
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: content.split('\n').length,
                    itemBuilder: (context, index) {
                      final name = content.split('\n')[index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 40.0,
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/image$index.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                name,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    })
                : Text(
                    content,
                  ),
          ],
        ),
      ),
    );
  }
}
