import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rgd_app/pages/about_us.dart';
import 'package:rgd_app/pages/rgd_team.dart';
import '../services_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final email = FirebaseAuth.instance.currentUser!.email;
  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      print('Verification Email has been sent');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Verification Email has been sent',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(
          //         "https://live.staticflickr.com/1919/31771305328_4d5a05bcf2_b.jpg",
          //       ),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   child:
          Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutUsScreen(),
                        ),
                      );
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.contact_page, color: Colors.white),
                          SizedBox(height: 8.0),
                          Text('About', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ServicesScreen(),
                        ),
                      );
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.help, color: Colors.white),
                          SizedBox(height: 8.0),
                          Text('Services Form',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RGDTeam(),
                        ),
                      );
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.people, color: Colors.white),
                          SizedBox(height: 8.0),
                          Text('RDG Team',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Text(
              //   'Email: $email',
              //   style: const TextStyle(fontSize: 20.0, color: Colors.white),
              // ),
              // user!.emailVerified
              //     ? const Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 15.0,
              //   ),
              //   child: Text(
              //     'Verified',
              //     style: TextStyle(
              //       fontSize: 18.0,
              //       color: Colors.blueGrey,
              //     ),
              //   ),
              // )
              //     : Center(
              //   child: ElevatedButton(
              //     onPressed: () => {verifyEmail()},
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.red,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 30,
              //         vertical: 15,
              //       ),
              //     ),
              //     child: const Text(
              //       'Verify Email',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 21,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Container(
              //   width: 350,
              //   height: 400,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     image: const DecorationImage(
              //       image: NetworkImage(
              //         'https://live.staticflickr.com/1919/31771305328_4d5a05bcf2_b.jpg',
              //       ),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
