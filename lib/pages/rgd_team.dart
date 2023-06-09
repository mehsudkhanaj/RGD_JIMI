import 'package:flutter/material.dart';
import 'package:rgd_app/widgets/custom_card.dart';

class RGDTeam extends StatefulWidget {
  const RGDTeam({super.key});

  @override
  State<RGDTeam> createState() => _RGDTeamState();
}

class _RGDTeamState extends State<RGDTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('RGD Team')),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomCard(

              title:
                  'Reliable Support for Any Emergency: Contact Our Team for Device Malfunctions Gas Leaks',


              content: 'Muhammad jamshed\nNida Khan\nMutahara ghulam',


              isProfile: true,
            ),
            Card(
              child: ListTile(
                title: Text("Name: Muhammad Jamshed"),


                subtitle: Text("Contact: +923029015909\nEmail: jamshed2019@namal.edu.pk"),

              ),
            ),

            Card(
              child: ListTile(
                title: Text("Name: Nida Khan"),

                subtitle: Text("Contact: +923175279508\nEmail: nidakhan2019@namal.edu.pk"),

              ),
            ),
            Card(
              child: ListTile(
                title: Text("Name: Mutahara Ghulam"),

                subtitle: Text("Contact: ++923044195638\nEmail: mutahara2019@namal.edu.pk"),

              ),
            ),
            Card(
              child: ListTile(
                title: Center(child: Text("Your Safety Is Our Main Priority")),
                textColor: Colors.purple,
                tileColor: Colors.yellow,


              ),
            ),

          ],
        ),
      ),
    );
  }
}
