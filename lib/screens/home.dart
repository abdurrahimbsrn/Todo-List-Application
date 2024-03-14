import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevler/Models/task.dart';
import 'package:gorevler/constants/colors.dart';
import 'package:gorevler/main.dart';
import 'package:gorevler/screens/add_new_task.dart';
import 'package:gorevler/todoItem.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskCategory selected = TaskCategory(categoryName: "");
  bool isCheck = false;
  Items items = Items();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // Klavye açıldığında ekran boyutunu otomatik olarak ayarlamayı devre dışı bırak
          backgroundColor: HexColor(backGroundColor2),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor(backGroundColor2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 0,
                        ),
                        child:
                            Icon(Icons.menu, size: 30, color: HexColor(color1)),
                      ),
                      Container(
                        child: Text(
                          "Todo List",
                          style: TextStyle(
                            fontFamily: "TitleFont",
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: HexColor(color1),
                          ),
                        ),
                      ),
                      Text(
                        date(),
                        style:
                            GoogleFonts.acme(fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width / 1.05,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width:
                  MediaQuery.of(context).size.width, // Ekran genişliğine sığdır
              height: 60,
              child: ListView.builder(
                itemCount: items.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  TaskCategory currentCategory = items.categoryList[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selected = items.categoryList[index];
                          if (selected.categoryName == "+") {
                            Items.showAddCategory(items,context);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: selected.categoryName == currentCategory.categoryName
                            ? Colors.white // Consistent white text color
                            : Colors.black,
                        backgroundColor: currentCategory.categoryName == "+"
                            ? HexColor(
                                "F9A828") // Blue background for "+" button
                            : (selected.categoryName == currentCategory.categoryName
                                ? HexColor(
                                    color1) // Selected color for other buttons
                                : Colors.white), // Default background color
                        shape: currentCategory.categoryName == "+"
                            ? RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50)) // Maximum circular border for "+" button
                            : null, // Standard border for other buttons
                      ),
                      child: Text(
                        currentCategory.categoryName,
                        style: GoogleFonts.acme(
                          fontSize: 18,
                          color: selected.categoryName == currentCategory.categoryName
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return TodoItem(
                              title: "Task $index",
                              detail:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.");
                        }),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Last Completed Task",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.flag_sharp,
                        size: 25,
                        color: Colors.blue,
                      ),
                      Text("Completed Task",
                          style: GoogleFonts.acme(fontSize: 30,color: Colors.grey)),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width:
                  MediaQuery.of(context).size.width, // Ekran genişliğine sığdır
              height: 55,
              color: HexColor(backGroundColor2),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddNewTask(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor(color1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: Text(
                    "Add new task",
                    style: GoogleFonts.acme(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

