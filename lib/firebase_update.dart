import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseDataUpdate extends StatefulWidget {

  String ID;
  String Name;
  String Email;


  FirebaseDataUpdate({required this.ID, required this.Name, required this.Email});

  @override
  State<FirebaseDataUpdate> createState() => _FirebaseDataUpdateState(ID: ID,Name: Name,Email: Email);
}

class _FirebaseDataUpdateState extends State<FirebaseDataUpdate> {

  String ID;
  String Name;
  String Email;

  _FirebaseDataUpdateState({required this.ID, required this.Name, required this.Email});

  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();

  void dataUpdate()async{
    FirebaseFirestore.instance.collection("userData").doc(ID).update({
      "User-ID": ID,
      "User-Name": userName.text.toString(),
      "User-Email": userEmail.text.toString()
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    userName.text = widget.Name;
    userEmail.text = widget.Email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  label: Text("Enter Your Name")
              ),
              controller: userName,
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  label: Text("Enter Your Email")
              ),
              controller: userEmail,
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              dataUpdate();
            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
