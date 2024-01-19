import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/data.dart';
import 'package:untitled/main1.dart';


import 'gameplay.dart';

class game extends StatefulWidget {
  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  List status = [];
  int p=0;

  @override
  void initState() {
    super.initState();

    status = List.filled(data.que.length, '');
    p=logo.prefes!.getInt('s')??0;
    for (int i = 0; i < status.length; i++) {
      status[i] = logo.prefes!.getString("le_st$i") ?? "";
      setState(() {});
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Points = ${p}   Level 1"),
          ),
        ),
        body: GridView.builder(
          itemCount: data.que.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return gameplay(index,status);
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: (index < status.length)
                    ? (status[index] == 'yes')
                        ? Opacity(
                            opacity: 0.2,
                            child: Image(
                                image: AssetImage('img/${data.que[index]}')))
                        : Image(image: AssetImage('img/${data.que[index]}'))
                    : null,
                decoration: BoxDecoration(
                  image: (index < status.length)
                      ? (status[index] == "yes")
                          ? DecorationImage(
                              scale: 5,
                              alignment: Alignment.bottomLeft,
                              image: AssetImage("img/level_guessed_badge.png"))
                          : null
                      : DecorationImage(
                          image: AssetImage("img/${data.que[index]}'")),
                ),
              ),
            );
          },
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
                        return logo();
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
