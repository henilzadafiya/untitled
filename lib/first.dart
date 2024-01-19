import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  List item = ["Computer", "Mouse", "Key-Board", "Pendrive"];
  List ischek = [false, false, false, false];
  List rate = [1000, 250, 300, 500];
  List rate1 = [];
  List qty = [1, 1, 1, 1];
  List qty1 = [];
  List l = [];
  List amt = [];
  dynamic total = 0;
  List<DropdownMenuItem> qty_list = [
    DropdownMenuItem(child: Text("Qty"), value: 0,),
    DropdownMenuItem(child: Text("1"), value: 1,),
    DropdownMenuItem(child: Text("2"), value: 2,),
    DropdownMenuItem(child: Text("3"), value: 3,),
    DropdownMenuItem(child: Text("4"), value: 4,),
    DropdownMenuItem(child: Text("5"), value: 5,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("demo")),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Select", style: TextStyle(fontSize: 25)),
            Text("Item", style: TextStyle(fontSize: 25)),
            Text("Rate", style: TextStyle(fontSize: 25)),
            Text("Qty", style: TextStyle(fontSize: 25)),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Wrap(alignment: WrapAlignment.spaceEvenly, children: [
                  Checkbox(
                    value: ischek[index],
                    onChanged: (value) {
                      ischek[index] = value;
                      total = 0;
                      if (ischek[index] == true) {
                        l.add(item[index]);
                        rate1.add(rate[index]);
                        qty1.add(qty[index]);

                        for (int i = 0; i < rate1.length; i++) {
                          if (rate1[i] == rate[index]) {
                            amt.add(rate1[i] * qty1[i]);
                          }
                        }
                        for (int i = 0; i < rate1.length; i++) {
                          total = total + amt[i];
                        }
                      } else if (ischek[index] == false) {
                        for (int i = 0; i < rate1.length; i++) {
                          if (rate1[i] == rate[index]) {
                            amt.removeAt(i);
                          }
                        }
                        l.remove(item[index]);
                        rate1.remove(rate[index]);
                        qty1.remove(qty[index]);
                        for (int i = 0; i < rate1.length; i++) {
                          total += amt[i];
                        }
                      }
                      setState(() {});
                    },
                  ),
                  Text(
                    "${item[index]}",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "${rate[index]}",
                    style: TextStyle(fontSize: 25),
                  ),
                  DropdownButton(
                    value: qty[index],
                    items: qty_list,
                    onChanged: (value) {
                      total = 0;
                      qty[index] = value;
                      for (int i = 0; i < l.length; i++) {
                        if (l[i] == item[index]) {
                          qty1[i] = value;
                        }
                      }
                      for (int i = 0; i < rate1.length; i++) {
                        amt[i] = rate1[i] * qty1[i];
                        total = total + amt[i];
                      }
                      setState(() {});
                    },
                  )
                ]),
              );
            },
          ),
        ),
        Divider(
          thickness: 5,
          color: Colors.brown,
        ),
        Text("purchase menu",style: TextStyle(fontSize: 25)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Item",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Rate",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Oty",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Amount",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: l.length,
            itemBuilder: (context, index) {
              amt[index] = rate1[index] * qty1[index];
              // total = total + amt[index];
              return ListTile(
                title: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    Text("${l[index]}",style: TextStyle(fontSize: 25)),
                    Text("${rate1[index]}",style: TextStyle(fontSize: 25)),
                    Text("${qty1[index]}",style: TextStyle(fontSize: 25)),
                    Text("${amt[index]}",style: TextStyle(fontSize: 25)),
                  ],
                ),
              );
            },
          ),
        ),
        Text(
          "Total : $total",
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 150,
        ),
      ]),
    );
  }
}
