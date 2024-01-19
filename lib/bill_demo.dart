import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: bill(),
  ));
}

class bill extends StatefulWidget {
  const bill({super.key});

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {
  List check = [false, false, false, false];
  List item = ["Computer", "Mouse", "Printer", "Laptop"];
  List rate = [1000, 750, 500, 250];
  List rate1 = [];
  List qty = [1, 1, 1, 1];
  List qty1 = [];
  List l = [];
  List amt = [];
  dynamic total = 0;
  List<DropdownMenuItem> qty_list = [
    DropdownMenuItem(value: 0, child: Text("Qty")),
    DropdownMenuItem(value: 1, child: Text("1")),
    DropdownMenuItem(value: 2, child: Text("2")),
    DropdownMenuItem(value: 3, child: Text("3")),
    DropdownMenuItem(value: 4, child: Text("4")),
    DropdownMenuItem(value: 5, child: Text("5")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("purchese Bill")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Select", style: TextStyle(fontSize: 15)),
              Text("Item", style: TextStyle(fontSize: 15)),
              Text("Rate", style: TextStyle(fontSize: 15)),
              Text("Qty", style: TextStyle(fontSize: 15)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      Checkbox(
                        value: check[index],
                        onChanged: (value) {
                          check[index] = value;
                          total = 0;
                          if (check[index] == true) {
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
                          } else if (check[index] == false) {
                            for (int i = 0; i < rate1.length; i++) {
                              if (rate1[i] == rate[index]) {
                                amt.removeAt(i);
                              }
                            }
                            l.remove(item[index]);
                            rate1.remove(rate[index]);
                            qty1.remove(qty[index]);
                            for (int i = 0; i < rate1.length; i++) {
                              total = total + amt[i];
                            }
                          }
                          setState(() {});
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text("${item[index]}",
                            style: TextStyle(fontSize: 15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text("${rate[index]}",
                            style: TextStyle(fontSize: 15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: DropdownButton(
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
                        ),
                      ),
                      // Padding(padding: const EdgeInsets.only(top: 15), child: Text("${item[index]}",style: TextStyle(fontSize: 15)),),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(
            thickness: 5,
            color: Colors.black,
          ),
          Text(
            "Purchase Menu",
            style: TextStyle(fontSize: 25),
          ),
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
                "Qty",
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
                return ListTile(
                  title: Wrap(alignment: WrapAlignment.spaceEvenly, children: [
                    Text(
                      "${l[index]}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "${rate1[index]}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "${qty1[index]}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "${amt[index]}",
                      style: TextStyle(fontSize: 25),
                    ),
                  ]),
                );
              },
            ),
          ),
          Text(
            "Total : $total",
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
