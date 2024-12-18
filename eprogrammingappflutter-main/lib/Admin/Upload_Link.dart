import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eprogrammingappflutter/widget/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum SelectCategory {
  Flutter,
  Java,
  HTML,
  CSS,
  Cplus,
  Python
}
class Upload_Link extends StatefulWidget {
  const Upload_Link({Key? key}) : super(key: key);

  @override
  State<Upload_Link> createState() => _Upload_LinkState();
}

class _Upload_LinkState extends State<Upload_Link> {
  // Initial Selected Value
  String dropdownvalue = 'Flutter';
  // List of items in our dropdown menu
  var course = [
    'flutter',
    'java',
    'html',
    'css',
    'C++',
    'Python',
  ];
  final _auth = FirebaseAuth.instance;
  final  TextEditingController _linkController = TextEditingController();
  final CollectionReference _link = FirebaseFirestore.instance.collection('users');
  String id=FirebaseAuth.instance.currentUser!.uid;
  SelectCategory? _category = SelectCategory.Flutter;
  bool _loading =false;
  void _validate(){
    if(_linkController.text.isEmpty){
      Fluttertoast.showToast(msg: 'please add Link');
    }

    else{
      setState(() {
        _loading=true;
      });
      postDetailsToFirestore();

    }

  }
  postDetailsToFirestore() async {
    String category = _category.toString().split('.').last;
    final String link = _linkController.text;
    if (link != null) {
      Map<String, dynamic> data = <String, dynamic>{
        "id":id,
        "link": link,
        "category": category,
      };
      await _link.doc(id).collection('courselink').doc()
          .set(data)
          .whenComplete(() => print("Note item added to the database"))
          .catchError((e) => print(e));
      _linkController.text = '';


      Navigator.of(context).pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _linkController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Course Link',
                  ),
                ),
              ),
              SizedBox(height: 16.0,),
              ListTile(
                title: const Text('Flutter'),
                leading: Radio<SelectCategory>(
                  value: SelectCategory.Flutter,
                  groupValue: _category,
                  onChanged: (SelectCategory? value) {
                    setState(() {
                      _category = value;
                    });
                  },
                ),
              ),
               ListTile(
                        title: const Text('Java'),
                        leading: Radio<SelectCategory>(
                          value: SelectCategory.Java,
                          groupValue: _category,
                          onChanged: (SelectCategory? value) {
                            setState(() {
                              _category = value;
                            });
                          },
                        ),
                      ),
               ListTile(
                        title: const Text('HTML'),
                        leading: Radio<SelectCategory>(
                          value: SelectCategory.HTML,
                          groupValue: _category,
                          onChanged: (SelectCategory? value) {
                            setState(() {
                              _category = value;
                            });
                          },
                        ),
                      ),
               ListTile(
                        title: const Text('CSS'),
                        leading: Radio<SelectCategory>(
                          value: SelectCategory.CSS,
                          groupValue: _category,
                          onChanged: (SelectCategory? value) {
                            setState(() {
                              _category = value;
                            });
                          },
                        ),
                      ),
               ListTile(
                        title: const Text('C++'),
                        leading: Radio<SelectCategory>(
                          value: SelectCategory.Cplus,
                          groupValue: _category,
                          onChanged: (SelectCategory? value) {
                            setState(() {
                              _category = value;
                            });
                          },
                        ),
                      ),
               ListTile(
                        title: const Text('Python'),
                        leading: Radio<SelectCategory>(
                          value: SelectCategory.Python,
                          groupValue: _category,
                          onChanged: (SelectCategory? value) {
                            setState(() {
                              _category = value;
                            });
                          },
                        ),
                      ),
              Material(
                elevation:  5,
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  // style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () async {
                    _validate();
                    setState(() {
                      _loading = false;
                    });
                  },
                  child: (_loading)
                      ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        strokeWidth: 1.5,
                      ))
                      : const Text('Submit', style: TextStyle(
                      fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
