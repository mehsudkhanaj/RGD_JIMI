//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
//
// class MyTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('All Users')),
//         backgroundColor: Colors.orangeAccent,
//         elevation: 0, // set the elevation to 0 to remove the default shadow
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey[200],
//         ),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: DataTable(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//             ),
//             columns: [
//               DataColumn(label: Text('Name')),
//               DataColumn(label: Text('Email')),
//               DataColumn(label: Text('Phone')),
//               DataColumn(label: Text('Gas Sensor')),
//               DataColumn(label: Text('Location')),
//             ],
//             rows: [
//               DataRow(cells: [
//                 DataCell(Text('Jamshed')),
//                 DataCell(Text('Jamshed2019@namal.edu.pk')),
//                 DataCell(Text('03029015909')),
//                 DataCell(Text('1259')),
//                 DataCell(Text('30 Km Mianwali - Talagang Rd, Mianwali, Punjab 42250')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('Tariq Shehzad')),
//                 DataCell(Text('Tariq2019@namal.edu.pk')),
//                 DataCell(Text('03081200012')),
//                 DataCell(Text('1250')),
//                 DataCell(Text('Arif Wala Zilah Bahawal Pur')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('Moiz Sheikh')),
//                 DataCell(Text('Moiz2019@namal.edu.pk')),
//                 DataCell(Text('03451345678')),
//                 DataCell(Text('1350')),
//                 DataCell(Text('Pearl One, 94-B/I, MM Alam Road,. Gulberg III, Lahore, Pakistan. 0800-ZAMEEN ')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('Kashif Haider')),
//                 DataCell(Text('Kashif2019@namal.edu.pk')),
//                 DataCell(Text('03009090123')),
//                 DataCell(Text('1660')),
//                 DataCell(Text('Paharpur Dikhan near Rangpur road 30km ')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('Jamshed')),
//                 DataCell(Text('Jamshed2019@namal.edu.pk')),
//                 DataCell(Text('03029015909')),
//                 DataCell(Text('1259')),
//                 DataCell(Text('30 Km Mianwali - Talagang Rd, Mianwali, Punjab 42250')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('Tariq Shehzad')),
//                 DataCell(Text('Tariq2019@namal.edu.pk')),
//                 DataCell(Text('03081200012')),
//                 DataCell(Text('1250')),
//                 DataCell(Text('Arif Wala Zilah Bahawal Pur')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('Moiz Sheikh')),
//                 DataCell(Text('Moiz2019@namal.edu.pk')),
//                 DataCell(Text('03451345678')),
//                 DataCell(Text('1350')),
//                 DataCell(Text('Pearl One, 94-B/I, MM Alam Road,. Gulberg III, Lahore, Pakistan. 0800-ZAMEEN ')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('Kashif Haider')),
//                 DataCell(Text('Kashif2019@namal.edu.pk')),
//                 DataCell(Text('03009090123')),
//                 DataCell(Text('1660')),
//                 DataCell(Text('Paharpur Dikhan near Rangpur road 30km ')),
//               ]),
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
// }
//

//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All User Data',
      home: UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({Key? key});

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _usersCollectionRef = FirebaseFirestore.instance
      .collection('Users')
      .where('email',
      isEqualTo: FirebaseAuth.instance.currentUser?.email.toString());

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser?.email);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<QuerySnapshot>(
          future: _usersCollectionRef.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Error: ${snapshot.error}',
                      style:
                      const TextStyle(fontSize: 18.0, color: Colors.red)));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(
                    child: Text('Error: ${snapshot.error}',
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.red)));
              }

              print('itemBuilder');
              print(snapshot.data!.docs.length);
              return AnimatedList(
                initialItemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index, animation) {
                  final doc = snapshot.data!.docs[index];

                  final String name = doc['name'];
                  final String email = doc['email'];
                  final String phoneNo = doc['phoneNo'];
                  final String location = doc['location'];

                  return SlideTransition(
                    position: animation.drive(Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    )),
                    child: Card(
                      elevation: 9.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: ListTile(
                          title: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8,),
                              Text(
                                'Email: $email',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8,),

                              Text(
                                'Phone: $phoneNo',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8,),

                              Text(
                                'Location: $location',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
