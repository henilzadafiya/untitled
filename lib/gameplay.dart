import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/data.dart';
import 'package:untitled/game.dart';
import 'package:untitled/main1.dart';

class gameplay extends StatefulWidget {
  int index;
  List status;

  gameplay(this.index, this.status);

  @override
  State<gameplay> createState() => _gameplayState();
}

class _gameplayState extends State<gameplay> {
  PageController? controller;
  bool skip = false;
  List ans = [
    "ADIDAS",
    "AMAZON",
    "APPLE",
    "FACEBOOK",
    "HONDA",
    "LACOSTE",
    "MCDONALDS",
    "MERCEDES",
    "NIKE",
    "PIZZAHUT",
    "SHELL",
    "STARBUCKS",
    "TOYOTA",
    "VISA",
    "VOLKSWAGEN",
    "WIKIPEDIA",
  ];
  List random_op = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List temp = [];
  List abc = [];
  List nain_abc = [];
  List abc1 = [];
  List temp1 = [];
  List t = [];
  List user_ans = [];
  List option = [];
  int p = 0;
  List status = [];

  @override
  void initState() {
    p = logo.prefes!.getInt('s') ?? 0;
    super.initState();

    controller = PageController(initialPage: widget.index);
    status = List.filled(data.que.length, '');
    fun();
    setState(() {});
  }

  win() {
    String str = user_ans.join('');
    if (str == ans[widget.index]) {
      if (skip == false) {
        p += 30;
      }
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Prefect!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            backgroundColor: Colors.green,
            actions: [
              TextButton(
                  onPressed: () {
                    logo.prefes!.setString('le_st${widget.index}', "yes");
                    logo.prefes!.setInt('s', p);
                    if (widget.index < data.que.length - 1) {
                      widget.index++;
                    }
                    skip = false;
                    controller!.animateToPage(widget.index,
                        duration: Duration(seconds: 1), curve: Curves.linear);
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Text(
                    "Next",
                  )))
            ],
          );
        },
      );
      setState(() {});
    } else {
      if (str.length == temp.length) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                  child: Text(
                "Incorret",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
              backgroundColor: Colors.black87,
              icon: Center(
                child: Container(
                    height: 50,
                    width: 50,
                    child:
                        Image(image: AssetImage('img/n_delete_all_red.png'))),
              ),
              content: Text("Remove some letters and try again",
                  style: TextStyle(color: Colors.grey, fontSize: 15)),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                        child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    )))
              ],
            );
          },
        );
      }

      setState(() {});
    }
  }

  fun() {
    user_ans = List.filled(ans[widget.index].toString().length, "");
    random_op.shuffle();
    abc = List.filled(user_ans.length, "");
    abc1 = List.filled(user_ans.length, "");
    option = List.filled(14, '');
    temp = List.filled(user_ans.length, '');
    temp1 = List.filled(user_ans.length, '');
    t = List.filled(user_ans.length, '');

    for (int i = 0; i < user_ans.length; i++) {
      option[i] = ans[widget.index][i];
    }
    for (int i = user_ans.length; i < 14; i++) {
      option[i] = random_op[i];
    }
    option.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "${widget.index + 1}/${data.que.length}         Point = ${p}",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: PageView.builder(
                      onPageChanged: (value) {
                        widget.index = value;
                        fun();
                        setState(() {});
                      },
                      controller: controller,
                      itemCount: ans.length,
                      itemBuilder: (context, index) {
                        String test =
                            logo.prefes!.getString('le_st$index') ?? "";
                        return Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        if (widget.index > 0) {
                                          widget.index--;
                                        }
                                        controller?.jumpToPage(widget.index);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                          Icons.arrow_back_ios_new_outlined)),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'img/${data.que[widget.index]}'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        if (widget.index <
                                            data.que.length - 1) {
                                          widget.index++;
                                        }
                                        controller?.jumpToPage(widget.index);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                          Icons.arrow_forward_ios_outlined)),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  child: Row(
                                children: [
                                  Expanded(
                                      child: (test != 'yes')
                                          ? Wrap(
                                              alignment: WrapAlignment.center,
                                              children: List.generate(
                                                user_ans.length, (index) => (user_ans[index] != "")
                                                  ? InkWell(onTap: () {
                                                          if (temp1[index] == false) {
                                                            option[temp[index]] = user_ans[index];
                                                            user_ans[index] = "";
                                                          }
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 50,
                                                            width: 50,
                                                            color:
                                                                (temp1[index] ==
                                                                        true)
                                                                    ? Colors
                                                                        .black12
                                                                    : Colors
                                                                        .black54,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    3),
                                                            child: Text(
                                                              "${user_ans[index]}",
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                      )
                                                    : Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 50,
                                                        width: 50,
                                                        color: Colors.black38,
                                                        margin:
                                                            EdgeInsets.all(3),
                                                        child: Text(
                                                          "${user_ans[index]}",
                                                          style: TextStyle(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                        )),
                                              ),
                                            )
                                          : Center(
                                              child: Text(
                                              "${ans[widget.index]}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ))),
                                ],
                              )),
                            ),
                            Expanded(
                              flex: 1,
                              child: (test != 'yes')
                                  ? Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Expanded(
                                                                    child: InkWell(
                                                                        onTap: () {
                                                                          if (p >= 10) {
                                                                            int r = Random().nextInt(user_ans.length);
                                                                            skip = true;
                                                                            if (p > 0) {
                                                                              p -= 10;}
                                                                            logo.prefes!.setInt('s', p);
                                                                            for (int i = 0;i < ans[widget.index].length; i++) {
                                                                              abc[i] = ans[widget.index][i];
                                                                            }
                                                                            user_ans[r] = abc[r];
                                                                            for (int i = 0; i < option.length; i++) {
                                                                              if (abc[r] == option[i]) {
                                                                                temp[r] = i;
                                                                                temp1[r] = true;
                                                                                option[i] = "";
                                                                                break;
                                                                              }}win();}
                                                                          Navigator.pop(context);
                                                                          setState(() {});
                                                                        },
                                                                        child: Container(
                                                                            margin: EdgeInsets.only(bottom: 50, top: 50, right: 20, left: 20),
                                                                            alignment: Alignment.center,
                                                                            width: double.infinity,
                                                                            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                            child: Text(
                                                                              "Random 1 Letter",
                                                                              style: TextStyle(color: Colors.white),
                                                                            )))),
                                                                Expanded(
                                                                    child: InkWell(
                                                                        onTap: () {
                                                                          if (p >= 20) {
                                                                            int r = Random().nextInt(user_ans.length);
                                                                            int r1 = Random().nextInt(user_ans.length);
                                                                            skip = true;
                                                                            if (p > 0) {
                                                                              p -= 20;
                                                                            }
                                                                            logo.prefes!.setInt('s', p);
                                                                            for (int i = 0;i < ans[widget.index].length; i++) {
                                                                              abc[i] = ans[widget.index][i];
                                                                            }
                                                                            for (int i = 0;i < ans[widget.index].length; i++) {
                                                                              abc1[i] = ans[widget.index][i];
                                                                            }
                                                                            user_ans[r] =abc[r];
                                                                            for (int i = 0;i < option.length; i++) {
                                                                              if (abc[r] == option[i]) {
                                                                                temp[r] = i;
                                                                                temp1[r] = true;
                                                                                option[i] = "";
                                                                                break;
                                                                              }
                                                                            }
                                                                            user_ans[r1] = abc[r1];
                                                                            for (int j = 0;j < option.length; j++) {
                                                                              if (abc1[r] == option[j]) {
                                                                                temp[r1] = j;
                                                                                temp1[r] = true;
                                                                                option[j] = "";
                                                                                break;
                                                                              }
                                                                            }
                                                                            nain_abc = abc + abc1;
                                                                            win();
                                                                          }
                                                                          Navigator.pop(context);
                                                                          setState(() {});
                                                                        },
                                                                        child: Container(
                                                                            margin: EdgeInsets.only(bottom: 50, top: 50, right: 20, left: 20),
                                                                            alignment: Alignment.center,
                                                                            width: double.infinity,
                                                                            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                            child: Text(
                                                                              "Random 2 Letter",
                                                                              style: TextStyle(color: Colors.white),
                                                                            )))),
                                                                Expanded(
                                                                    child: InkWell(
                                                                        onTap: () {
                                                                          if (p >= 30) {
                                                                            if (p > 0) {
                                                                              skip = true;
                                                                              p -= 30;
                                                                            }
                                                                            logo.prefes!.setInt('s',p);
                                                                            for (int i = 0; i < option.length; i++) {
                                                                              option[i] = "";
                                                                            }
                                                                            for (int i = 0; i < user_ans.length; i++) {
                                                                              option[i] = ans[widget.index][i];
                                                                            }
                                                                            option.shuffle();
                                                                            win();
                                                                          }
                                                                          Navigator.pop(context);
                                                                          setState(() {});
                                                                        },
                                                                        child: Container(
                                                                            margin: EdgeInsets.only(bottom: 50, top: 50, right: 20, left: 20),
                                                                            alignment: Alignment.center,
                                                                            width: double.infinity,
                                                                            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                            child: Text(
                                                                              "Remove Extra Letters",
                                                                              style: TextStyle(color: Colors.white),
                                                                            )))),
                                                              ]),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text("Use hints",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white)),
                                                  margin: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              'img/game_button_use_hints_clicked.png'))),
                                                ),
                                              )),
                                          Expanded(
                                              child: InkWell(
                                            onTap: () {
                                              for (int i = 0;
                                                  i < user_ans.length;
                                                  i++) {
                                                if (temp1[i] != true) {
                                                  if (user_ans[i] != "") {
                                                    option[temp[i]] =
                                                        user_ans[i];
                                                    user_ans[i] = "";
                                                  }
                                                }
                                              }
                                              setState(() {});
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 5, left: 5),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          'img/n_delete_all_red.png'))),
                                            ),
                                          )),
                                          Expanded(
                                              child: InkWell(
                                            onTap: () {
                                              for (int i = temp.length - 1;
                                                  i >= 0;
                                                  i--) {
                                                if (temp1[i] != true) {
                                                  if (temp[i] != '') {
                                                    option[temp[i]] =
                                                        user_ans[i];
                                                    temp[i] = "";
                                                    user_ans[i] = "";
                                                    break;
                                                  }
                                                }
                                              }
                                              setState(() {});
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'img/n_delete_one_red.png')),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(1))),
                                              alignment: Alignment.center,
                                            ),
                                          )),
                                        ],
                                      ),
                                    )
                                  : Row(),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                  child: Row(
                                children: [
                                  Expanded(
                                      child: (test != 'yes')
                                          ? GridView.builder(
                                              itemCount: 14,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 7),
                                              itemBuilder: (context, index) {
                                                return (option[index] != "")
                                                    ? InkWell(
                                                        onTap: () {
                                                          for (int i = 0; i < user_ans.length; i++) {
                                                            if (user_ans[i] == "") {
                                                              user_ans[i] = option[index];
                                                              temp[i] = index;
                                                              temp1[i] = false;
                                                              option[index] = "";
                                                              win();
                                                              break;
                                                            }
                                                          }
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height:
                                                              double.infinity,
                                                          child: Text(
                                                              "${option[index]}",
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  color: Colors
                                                                      .black)),
                                                          margin:
                                                              EdgeInsets.all(3),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      )
                                                    : Text("");
                                              },
                                            )
                                          : Container(
                                              alignment: Alignment.topCenter,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Prefect!",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            if (widget.index <
                                                                data.que.length -
                                                                    1) {
                                                              widget.index++;
                                                            }
                                                            controller
                                                                ?.jumpToPage(
                                                                    widget
                                                                        .index);
                                                            setState(() {});
                                                          },
                                                          child: Text("Next")),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              margin: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: Colors.green),
                                            )),
                                ],
                              )),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            )),
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
                        return game();
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
