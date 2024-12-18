import 'package:eprogrammingappflutter/Admin/Upload_Link.dart';
import 'package:eprogrammingappflutter/Auth/login_screen.dart';
import 'package:eprogrammingappflutter/widget/Appcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
class Admin_Dashboard extends StatefulWidget {
  const Admin_Dashboard({Key? key}) : super(key: key);

  @override
  State<Admin_Dashboard> createState() => _Admin_DashboardState();
}

class _Admin_DashboardState extends State<Admin_Dashboard> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.aBackground,
      appBar: AppBar(
        backgroundColor:AppColors.Appbacground,
        elevation: 0,
        title: Text("Admin Screen"),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 18),
      ),
      drawer: Container(
        color: Colors.white,
        width: 255,
        child: ListView(
          children: [
            Container(
              color: AppColors.Appbacground,
              height: 150.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130,
                      height: 130,
                      //child: Lottie.asset('assets/images/bus.json'),
                      child: Image.asset('assets/images/book.png'),
                    )
                  ],
                ),
              ),
            ),
            Divider(height: 1,color: AppColors.gerytext,thickness: 1,),
            SizedBox(height: 12.0,),
            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile",style: TextStyle(fontSize: 15),),
              ),
            ),
            GestureDetector(
              onTap: (){
                // FirebaseAuth.instance.signOut();
                firebaseAuth.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>  LogInScreen()),
                        (route) => false);
                //Navigator.pushNamedAndRemoveUntil(context, login.idScreen, (route) => false);
              },
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout",style: TextStyle(fontSize: 15),),
              ),
            ),


          ],
        ),
      ),
      body: Stack(
        children: <Widget>
        [
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.Appbacground,
                  AppColors.Buttoncolor,
                ],
              ),
              /*image: DecorationImage(
                      image: AssetImage('assets/images/Dashboard/gradient.png'),
                      fit: BoxFit.cover)*/

            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Lottie.asset('assets/images/anim.json'),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: size.height * .33,
                    width: 10,
                  ),
                  Container(
                    height: size.height * .60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      color: AppColors.dashbackDOWN,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          //Image.asset('assets/images/Dashboard/dashmid.png'),
                          //SvgPicture.asset("assets/images/icon/daytext.svg"),
                          //SizedBox(height: 1,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GridView.count(
                                crossAxisCount: 1,
                                childAspectRatio: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children: <Widget>[
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MaterialButton(onPressed: () {
                                      Get.to(Upload_Link());
                                      //Get.to(SubDashBoard(name: 'Flutter', categoryid: 1,));
                                    },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            Image.asset("assets/images/add.png"),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text("Add Course",
                                                    style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Text(" Advance Paid Courses",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),

    );
  }
}
