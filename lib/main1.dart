import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/data.dart';

import 'game.dart';

void main() {
  runApp(MaterialApp(
    home: logo(),
    debugShowCheckedModeBanner: false,
  ));
}

class logo extends StatefulWidget {

  static SharedPreferences?  prefes;

  @override
  State<logo> createState() => _logoState();
}


class _logoState extends State<logo> {

  List status=[];


  @override
  void initState() {
    super.initState();
    getper();
    setState(() {});
  }

  getper()
  async {
     logo.prefes = await SharedPreferences.getInstance();

     status=List.filled(data.que.length,'');

     for(int i=0;i<status.length;i++)
     {
         status[i]=logo.prefes!.getString("le_st$i")??"";
         setState(() {});
     }
     setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(flex: 1,
                                child: Container(child: Text("LOGO GHAME",style: TextStyle(fontSize: 20,color: Colors.black)),)),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(fit: BoxFit.fill,
                                            image: AssetImage(
                                                'img/main_background_top_logos.png'))))),
                          ],
                        )
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return game();
                            },
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(color: Colors.blueGrey,shape: BoxShape.circle),
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            child: Text(
                              "PLAY",
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'img/main_button_ranking.png'))))),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'img/main_button_stats.png'))))),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'img/main_button_achievements.png'))))),
                      ],
                    )),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'img/main_background_bottom_logos.png')))),
                  ),
                ],
              )),
        ),
      ),
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are You Exit"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("CANCLE"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return exit(0);
                      },
                    ));
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        return true;
      },
    );
  }
}
