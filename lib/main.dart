//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gorevler/screens/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selected = '';
  List<String> category = ["All", "Work", "Date", "+"];
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}

//The argument type 'Color' can't be assigned to the parameter type 'MaterialStateProperty<Color?>?'.
void matris() {
  List<List<int>> matrix = []; // Boş bir matris oluştur

  int rows = 3; // Satır sayısı
  int cols = 3; // Sütun sayısı

// Matrisi oluştur ve elemanlarını eklemek için döngüyü başlat
  for (int i = 0; i < rows; i++) {
    List<int> row = []; // Boş bir satır oluştur
    for (int j = 0; j < cols; j++) {
      // Satırın her bir elemanını belirle
      int element = i * cols + j + 1; // Örnek bir eleman
      row.add(element); // Satıra elemanı ekle
    }
    matrix.add(row); // Oluşturulan satırı matrise ekle
  }
}

String date() {
  DateTime now = DateTime.now();

  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  String day =
  now.day.toString(); // 'toString()' kullanarak günü dizeye dönüştür
  String month = months[now.month - 1]; // Ay ismini al

  return '$month $day'; // Dizeyi birleştirerek geri döndür
}

/*

ListView.builder(itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Text("data");
                  })

Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 10, bottom: 10, top: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selected = 'all';
                              });
                            },
                            child:Text(
                              'All',
                              style: GoogleFonts.acme(
                                fontSize: 20,
                                // Ensure text color always contrasts with button background
                                color: selected == 'all' ? Colors.white : Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              // Explicitly set foreground color for clarity and consistency
                              foregroundColor: selected == 'all' ? HexColor(secondaryColor) : Colors.white,
                              backgroundColor: selected == 'all' ? HexColor(secondaryColor) : Colors.white,
                              // Ensure text style reflects desired size and font family
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontFamily: GoogleFonts.acme().fontFamily,
                              ),
                            ),
                          ),
                        ),

                      FloatingActionButton(onPressed: (){}, child: Icon(Icons.add, color: Colors.grey.shade900),
                        backgroundColor: Colors.white,
                        hoverColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        mini: true,
                      )
                      ],
                    ),

*/

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
      colorSchemeSeed: HexColor(primaryColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'To Do List'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(primaryColor),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Öğeleri yatayda ortalar
            children: [
              Text(
                "To Do List",
                style: TextStyle(
                  fontFamily: "TitleFont",
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: HexColor(backGroundColor),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Düğmeye tıklandığında gerçekleştirilecek işlemleri buraya ekleyin
                },
                child: Text("Pr"),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: GoogleFonts.acme(
                fontSize: 20,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
