import 'package:flutter/material.dart';
import 'package:news_app/features/profile/views/widgets/ai_image.dart';
// import 'package:news_app/features/profile/views/widgets/ai_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'), 
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AiImage(imagePath: 'assets/images/ahmed_ai.jpeg'),
              const AiImage(imagePath: 'assets/images/ahmed_ai2.jpeg'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AiImage(imagePath: 'assets/images/ahmed_ai3.jpeg'),
              const AiImage(imagePath: 'assets/images/ahmed_ai4.jpeg'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AiImage(imagePath: 'assets/images/ahmed_ai5.jpeg'),
            ],
          ),
          const SizedBox(height: 20),

        ],
      ),
      // body: Column(
      //   children: [
      //     CustomCarouselSliderImage(
      //       images: const [
      //         'assets/images/ahmed_ai.jpeg',
      //         'assets/images/ahmed_ai2.jpeg',
      //         'assets/images/ahmed_ai3.jpeg',
      //         'assets/images/ahmed_ai4.jpeg',
      //         'assets/images/ahmed_ai5.jpeg',
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
