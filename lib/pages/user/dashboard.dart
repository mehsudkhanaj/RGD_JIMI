import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rgd_app/models/user_model.dart';
import '../../models/sensor_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  final email = FirebaseAuth.instance.currentUser!.email;
  final _usersCollectionRef = FirebaseFirestore.instance
      .collection('Users')
      .where('email',
          isEqualTo: FirebaseAuth.instance.currentUser?.email.toString());
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: getStreamSensorDataByEmail(email as String),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<SensorData> sensorDataList = snapshot.data!.docs
                  .map((doc) => SensorData.fromFirestore(doc))
                  .toList();
              Future.delayed(
                const Duration(seconds: 5),
                () {
                  if (int.parse(sensorDataList.first.sensorValue) >= 1900) {
                    Get.snackbar('Gas Alert', 'High Gas Alert Please Check',
                        backgroundColor: Colors.red, colorText: Colors.white);
                    //Stop Sensor
                  }
                },
              );

              return ListView.builder(
                itemCount: sensorDataList.length,
                itemBuilder: (context, index) {
                  SensorData sensorData = sensorDataList[index];
                  return Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                sensorData.sensorValue,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'PPM',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(sensorData.sensorName),
                          const SizedBox(
                            height: 16,
                          ),
                          name.isEmpty
                              ? FutureBuilder<QuerySnapshot>(
                                  future: _usersCollectionRef.get(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data != null) {
                                      final doc = snapshot.data!.docs.first;
                                      name = doc['name'];
                                      final String email = doc['email'];
                                      final String phoneNo = doc['phoneNo'];
                                      final String location = doc['location'];

                                      return Column(
                                        children: [
                                          Text(name),
                                        ],
                                      );
                                    } else {
                                      return const Text('');
                                    }
                                  })
                              : Text(name),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              // Data is not yet available, display a loading indicator
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
