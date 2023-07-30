import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rgd_app/widgets/custom_card.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('About')),

      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            CustomCard(
                title: 'Introduction',
                content:
                    'In a world where safety and security are paramount, innovative technologies continue to play a crucial role in protecting lives. Our latest project combines the power of IoT, web development, and Android applications to create a life-saving solution that aims to prevent incidents caused by gas leakages. Our cutting-edge devices not only detect gas leaks in real time but also proactively alert users through multiple channels, ensuring their safety even when they are away from home. Additionally, our system incorporates an automatic shutdown valve that acts swiftly to prevent further damage in the event of a leak. Let\'s delve into the details of our revolutionary product and explore how it can make a significant impact on people\'s lives.'),
            SizedBox(height: 10),
            CustomCard(
                title: 'Real-Time Gas Leak Detection',
                content:
                    'Gas leaks pose a serious threat to both life and property. To address this issue, our product employs advanced gas sensors strategically placed in various locations within a premises. These sensors continuously monitor the air quality for the presence of harmful gases, providing real-time updates. In the event of a gas leakage, the sensors instantly detect the abnormality and trigger a series of actions to mitigate the risks.'),
            SizedBox(height: 10),
            CustomCard(
                title: 'Multi-Channel Alerts',
                content:
                    'Our system goes beyond mere detection by ensuring that users are promptly notified, regardless of their location. Upon detecting a gas leak, our devices generate immediate alerts through various channels, such as email, SMS, and push notifications on the associated Android application. This multi-channel approach ensures that users receive critical information in real time, enabling them to take appropriate action swiftly.'),
            SizedBox(height: 10),
            CustomCard(
                title: 'Automatic Shutdown Valve',

                content:
                    'In conjunction with the alert system, our life-saving product incorporates an automatic shutdown valve. This valve is installed in the gas pipeline system and is designed to respond swiftly to a gas leak detection. Once a leak is detected, the valve is automatically triggered, effectively cutting off the flow of gas in the pipelines and other cylinders. By instantly isolating the source of the leakage, the valve prevents the escalation of the situation and mitigates the risks of explosions or fires, providing valuable time for users to evacuate the premises safely.'),
            SizedBox(height: 10),
            CustomCard(
                title: 'User-Friendly Interface and Control',
                content:
                    'We understand the importance of user-friendliness when it comes to ensuring the widespread adoption and usability of any technological solution. That\'s why our product features an intuitive web interface and a dedicated Android application. The web interface allows users to monitor the gas levels in their premises, view historical data, and manage system settings from any device with internet access. Meanwhile, the Android application provides a convenient way to receive real-time alerts, control the system remotely, and access additional features like emergency contacts and emergency shutdown.'),
            SizedBox(height: 10),
            CustomCard(
                title: 'Conclusion',
                content:
                    'The convergence of IoT, web development, and Android applications has paved the way for transformative solutions that prioritize the safety and well-being of individuals. Our life-saving product, designed to detect gas leakages in real time, serves as a vital safeguard against potential disasters. By employing advanced sensors, multi-channel alerts, and an automatic shutdown valve, our system ensures that users are promptly notified and that the gas flow is halted, thereby preventing potential hazards. With our intuitive interface and user-friendly control options, we aim to make this innovative solution accessible to a wide range of users, empowering them to protect their lives and properties effectively. Together, let us embrace technology to save lives and create a safer world for everyone.'),

          ],
        ),
      ),
    );
  }
}
