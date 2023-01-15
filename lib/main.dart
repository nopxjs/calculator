import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<String> buttons = [
  "AC",
  "/",
  "%",
  "^",
  "7",
  "8",
  "9",
  "X",
  "4",
  "5",
  "6",
  "-",
  "1",
  "2",
  "3",
  "+",
  "0",
  "=",
];
var value = "3 662 x 2=";
var finalValue = 7234;
var first = 0;
var second = 0;
var play = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 29, 29),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(40)),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 320,
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      finalValue.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) - 350,
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    return myb(buttons[index]);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container myb(textt) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.grey[750]),
      child: InkWell(
        onTap: () {
          var textt2;

          print(textt);
          if (textt != "1" &&
              textt != "2" &&
              textt != "3" &&
              textt != "4" &&
              textt != "5" &&
              textt != "6" &&
              textt != "7" &&
              textt != "8" &&
              textt != "9") {
            setState(() {
              textt2 = textt;
              value = "${first} ${textt2}";
              play = 1;
            });
          } else {
            setState(() {
              value = "${first}";
              var ttext = textt.toString();
            });
          }
          if (play == 1 &&
              textt != "AC" &&
              textt != "/" &&
              textt != "%" &&
              textt != "^" &&
              textt != "+" &&
              textt != "-" &&
              textt != "X") {
            setState(() {
              second = textt.toInt();
              value = "${first} ${textt2}, ${second}";
              finalValue = (first.toInt()) + (second.toInt());
            });
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          color: Color.fromARGB(255, 29, 29, 29),
          child: Text(
            textt.toString(),
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
