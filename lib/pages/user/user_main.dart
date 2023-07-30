import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:rgd_app/pages/login.dart';
import 'package:rgd_app/pages/user/user_details.dart';
import 'package:rgd_app/pages/user/dashboard.dart';
import 'package:rgd_app/pages/user/profile.dart';
import 'package:rgd_app/utils/backgound_service.dart';

class UserMain extends StatefulWidget {
  const UserMain({Key? key}) : super(key: key);

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  @override
  void initState() {
    super.initState();
    initService();
  }

  void initService() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await BackgroundService.initializeService();
    }
  }

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Dashboard(),
    const Profile(),
    const UserList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To RGD"),
        actions: [
          ElevatedButton(
            onPressed: () async {
              FlutterBackgroundService().invoke("stopService");
              await FirebaseAuth.instance.signOut();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
                    (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue[400],
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 3,
              shadowColor: Colors.blue.withOpacity(0.4),
            ),
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Center(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Muhammad Jamshed"),
                accountEmail: Text("jamshed2019@namal.edu.pk"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/jimi.jpg"),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Dashboard'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.event_note_outlined),
                title: const Text('User Details'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: const Text('Order Service'),
                onTap: () {
                  _showOrderServiceForm(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_phone),
                title: const Text('Contact'),
                onTap: () {
                  _showContactDetails(context);
                },
              ),
            ],
          ),
        ),
      ),

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 9,
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final service = FlutterBackgroundService();
                    print(await service.isRunning());
                    service.invoke("stopService");
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Stop Alarm'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final service = FlutterBackgroundService();
                    print(await service.isRunning());
                    initService();
                    service.invoke("setAsForeground");
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Start Alarm'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            label: 'User Details',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  void _showOrderServiceForm(BuildContext context) {
    // ... i will do code later for service form
  }

  void _showContactDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Contact Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildContactItem('Jamshed', '03029015909'),
              _buildContactItem('Nida', '03029015909'),
              _buildContactItem('Muthara', '03029015909'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactItem(String name, String contactNumber) {
    return ListTile(
      title: Text(name),
      subtitle: Text(contactNumber),
    );
  }
}