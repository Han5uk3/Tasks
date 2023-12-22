
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class payment extends StatefulWidget {
  const payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  late FocusNode fn = FocusNode();
  bool isfn = false;
  @override
  void initState() {
    super.initState();
    fn.addListener(_onFocusChange);
  }
  void _onFocusChange() {
    setState(() {
      isfn = fn.hasFocus;
    });
  }
  final FilteringTextInputFormatter inputFormat = FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));
  TextEditingController amt = TextEditingController(text: "0.0");
  int dropdownvalue = 0;
  int index = 0;
  List sign = [
    {0: "\u{20B9}"},
    {1: "\u{0024}"},
    {2: "\u{00A5}"},
    {3: "\u{20AC}"},
    {4: "\u{00A5}"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Enter Amount",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Wrap(
          children: [ Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 7),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Xypress",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Macedonia, Europe",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter Amount",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: isfn? Colors.blue : Colors.white)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Amount",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(inputFormatters: [inputFormat],
                              focusNode: fn,
                              cursorColor: Colors.blue,
                              style: const TextStyle(color: Colors.white, fontSize: 30),
                              controller: amt,
                              keyboardType:
                                  const TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(
                                  prefix: Text(
                                    "${sign[index][dropdownvalue]}",
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  // DropdownMenu(textStyle: TextStyle(color: Colors.white),initialSelection: 0,dropdownMenuEntries: [
                                  //   DropdownMenuEntry(value: 1, label: "IND"),
                                  //   DropdownMenuEntry(value: 2, label: "USD"),
                                  //   DropdownMenuEntry(value: 3, label: "CAD"),
                                  //   DropdownMenuEntry(value: 4, label: "SAR"),
                                  //   DropdownMenuEntry(value: 5, label: "AED"),
                                  // ]),
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            margin: const EdgeInsets.only(bottom: 10,right: 21),
                            height: 27,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue),
                            width: 55,
                            child: DropdownButton(
                              autofocus: true,
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              iconSize: 14,
                              dropdownColor: Colors.black,
                              style: const TextStyle(color: Colors.white),
                              value: dropdownvalue,
                              items: const [
                                DropdownMenuItem(
                                  value: 0,
                                  child: Text("IND ",style: TextStyle(fontSize: 14),),
                                ),
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text("USD ",style: TextStyle(fontSize: 14),),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text("CNY ",style: TextStyle(fontSize: 14),),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text("EUR ",style: TextStyle(fontSize: 14),),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text("JPY ",style: TextStyle(fontSize: 14),),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  dropdownvalue = value!;
                                  index = dropdownvalue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Payment Method",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 40),
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white)),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      leading: Image(
                        image: AssetImage("assets/images/images.png"),
                        fit: BoxFit.fitWidth,
                      ),
                      title: Text(
                        "Corporate Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("**** **** **** 0001"),
                      ),
                      trailing: Text(
                        "Change",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TextButton(style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),backgroundColor: const MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {
                      final scaffoldMessenger = ScaffoldMessenger.of(context);
                      scaffoldMessenger.showSnackBar(
                        SnackBar(behavior: SnackBarBehavior.floating,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          content: Text('An amount of ${sign[index][dropdownvalue]}${amt.text} paid.',style: const TextStyle(fontSize: 17,color: Colors.white),),
                          duration: const Duration(seconds: 5),
                          showCloseIcon: true,
                          dismissDirection: DismissDirection.horizontal,
                        ),
                      );

                    },
                    child: SizedBox(width: MediaQuery.of(context).size.width, height: 40,
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ]
        ),
      ),
    );
  }
}
