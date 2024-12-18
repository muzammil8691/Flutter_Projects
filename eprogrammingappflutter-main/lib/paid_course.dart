import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eprogrammingappflutter/paidweb_view.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Paid_Course extends StatefulWidget {
  String name;

  Paid_Course({required this.name});

  @override
  State<Paid_Course> createState() => _Paid_CourseState();
}

class _Paid_CourseState extends State<Paid_Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.Appbacground,
        title: Text('Paid Screen'),
      ),
      body: StreamBuilder (
        //stream: FirebaseFirestore.instance.collection('products').doc("38kennB15scWQ7yxBauxo74BkOA3").collection('items').snapshots(),
        stream: FirebaseFirestore.instance.collection('users')
            .doc("WerEOPg4AqQtvR1cPhmA78aWrwS2")
            .collection('courselink')
            .where('category', isEqualTo: widget.name)
            .snapshots(),
        // stream: FirebaseFirestore.instance.collection('users').doc(widget.id).collection('bookitems').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                return SizedBox(
                  height: 150,
                  child: GestureDetector(
                    onTap:() {

                    },
                    child: Card(
                      elevation: 5.0,
                      margin: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          SizedBox(height: 5.0,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/social.png',width: 80,height: 80,),
                          ),
                          SizedBox(height:20,),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 5.0,),
                                    Text(" Course name:",
                                      textAlign: TextAlign.center,
                                      style:
                                      const TextStyle(fontSize: 15.0,color: Colors.black),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Text(documentSnapshot['category'],
                                      textAlign: TextAlign.center,
                                      style:
                                      const TextStyle(fontSize: 15.0,color: Colors.black),),
                                  ],
                                ),




                              ],
                            ),
                          ),




                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

