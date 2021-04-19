import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final male = TextEditingController();
  final female = TextEditingController();
  var random = new Random();

  void press(BuildContext ctx)
  {
    final text1 = male.text;
    final text2 = female.text;

    if(text1 != "" || text2 != "")
      {
        final snackbar =SnackBar(content: Text("                         Cupid say's ${random.nextInt(100)}",style: TextStyle(color: Colors.black,fontSize: 18),),duration: Duration(seconds: 3),backgroundColor: Color(0xffE9B4B4),);
        // ignore: deprecated_member_use
        Scaffold.of(ctx).showSnackBar(snackbar);
      }
    else{
      final snackbar =SnackBar(content: Text("                         Cupid needs Name",style: TextStyle(color: Colors.black,fontSize: 18),),duration: Duration(seconds: 3),backgroundColor: Color(0xffE9B4B4),);
      // ignore: deprecated_member_use
      Scaffold.of(ctx).showSnackBar(snackbar);
    }
    reset();
  }

  void reset()
  {
    setState(() {
      male.text = "";
      female.text = "";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder:(ctx)=> Stack(
          children: [
            Container(
              child: Image.network("https://images.unsplash.com/photo-1612490566690-77fa11511031?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTU5fHxsb3ZlfGVufDB8MXwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
              height: double.infinity,
              fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150,),
                Container(
                  margin: EdgeInsets.only(left: 100,right: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xffEAB5B5)
                  ),
                  child: TextField(
                    controller: male,
                    decoration: InputDecoration(
                      hintText: "His name",
                      prefixIcon: Icon(FontAwesomeIcons.male),
                      contentPadding: EdgeInsets.only(left: 10,top:12),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.black45,fontSize: 18,fontStyle: FontStyle.italic)
                    ),
                  ),
                ),
                SizedBox(height: 35,),
                Container(
                  margin: EdgeInsets.only(left: 100,right: 100),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xffEAB5B5)
                  ),
                  child: TextField(
                    controller: female,
                    decoration: InputDecoration(
                        hintText: "Her name",
                        prefixIcon: Icon(FontAwesomeIcons.female),
                        contentPadding: EdgeInsets.only(left: 10,top:12),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black45,fontSize: 18,fontStyle: FontStyle.italic)
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                InkWell(
                  onTap: () => press(ctx),
                  child: Container(
                    height: 35,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xffEC7575)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 23,top: 7),
                      child: Text("Let's Ask cupid",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800
                      ),),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

