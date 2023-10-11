import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jot/firebase_add.dart';
import 'package:jot/firebase_update.dart';

class FirebaseWork extends StatefulWidget {
  const FirebaseWork({super.key});

  @override
  State<FirebaseWork> createState() => _FirebaseWorkState();
}

class _FirebaseWorkState extends State<FirebaseWork> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          StreamBuilder(
                stream: FirebaseFirestore.instance.collection("userData").snapshots(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator(),);
                  }

                  if (snapshot.hasError) {
                    return Center(child: Icon(Icons.error,size: 24,color: Colors.red,),);
                  }

                  if (snapshot.hasData) {

                    var dataLength = snapshot.data!.docs.length;
                    return ListView.builder(
                      itemCount: dataLength,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        String username = snapshot.data!.docs[index]['User-Name'];
                        String useremail = snapshot.data!.docs[index]['User-Email'];
                        String userId = snapshot.data!.docs[index].id;
                        print(username + useremail);
                        return GestureDetector(
                          onDoubleTap: ()async{
                            FirebaseFirestore.instance.collection("userData").doc(userId).delete();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Deleted")));
                          },
                          onTap: (){
                            Navigator.push(context,  MaterialPageRoute(builder: (context) => FirebaseDataUpdate(ID:userId,Email: useremail,Name: username,),));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 90.0,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Movie Details
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(username),
                                    Text(useremail),
                                  ],
                                )

                              ],
                            ),
                          ),
                        );
                      },);
                  }

                  return Container();
                }),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FirebaseDataAdd(),));
          }, child: Text("Add Data")),
        ],
      ));
  }
}
