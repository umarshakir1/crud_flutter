import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FirebaseDataAdd extends StatefulWidget {
  const FirebaseDataAdd({super.key});

  @override
  State<FirebaseDataAdd> createState() => _FirebaseDataAddState();
}

class _FirebaseDataAddState extends State<FirebaseDataAdd> {

  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();

  void addUser()async{

    String userID = Uuid().v1();

    Map<String,dynamic> userDetails = {
      "User-ID": userID,
      "User-Name": userName.text.toString(),
      "User-Email": userEmail.text.toString()
    };

    await FirebaseFirestore.instance.collection("userData").doc(userID).set(userDetails);

    Navigator.pop(context);
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
              addUser();
            }, child: Text("Insert"))
          ],
        ),
      ),
    );
  }
}
