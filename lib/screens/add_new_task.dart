//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevler/Models/task.dart';
import 'package:gorevler/constants/colors.dart';
import 'package:gorevler/main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:gorevler/todoItem.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  Items items = Items();
  TaskCategory selected = TaskCategory(categoryName: "");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor(backGroundColor2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 0,
                        ),
                        child: Icon(Icons.close,
                            size: 35, color: HexColor(color1)),
                      ),
                      Container(
                        child: Text(
                          "Add New Task",
                          style: TextStyle(
                            fontSize: 28,
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
          body: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width / 1.05,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Task Title",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Task title cannot be left blank';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Task Title",
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
                  Row(
                    children: [
                      Column(children: [
                        Text("Date"),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Task title cannot be left blank';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "Date",
                            ),
                          ),
                        )
                      ],),
                      Column(children: [

                      ],)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
