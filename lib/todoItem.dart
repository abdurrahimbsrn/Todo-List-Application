import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevler/Models/task.dart';
import 'package:gorevler/Models/todo.dart';
import 'package:gorevler/constants/colors.dart';
import 'package:hexcolor/hexcolor.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Padding(
                padding: EdgeInsets.only(top: 35),
                child: Icon(
                  Icons.flag,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.acme(fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.detail,
                    style: GoogleFonts.aBeeZee(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: isCheck,
                  onChanged: (val) => setState(() => isCheck = val!),
                ),
                IconButton(
                  onPressed: () {
                    // Silme işlemini gerçekleştirecek kod
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownButtonCategory extends StatefulWidget {
  const DropdownButtonCategory({super.key, required this.list});

  final List<TaskCategory> list;

  @override
  State<DropdownButtonCategory> createState() => _DropdownButtonCategory();
}

class _DropdownButtonCategory extends State<DropdownButtonCategory> {
  late TaskCategory dropdownValue = widget.list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TaskCategory>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(color: HexColor(color1),fontSize: 18),
      underline: Container(
        height: 2,
        color: HexColor(colors1),
      ),
      onChanged: (TaskCategory? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<TaskCategory>>((TaskCategory value) {
        return DropdownMenuItem<TaskCategory>(
          value: value,
          child: Text(value.categoryName),

        );
      }).toList(),
    );
  }
}

class Items {
  List<TaskCategory> categoryList= [
    TaskCategory(categoryName:"All"),TaskCategory(categoryName: "+")
  ];

  void addCategory(Items items, String categoryName) {
    TaskCategory category=TaskCategory(categoryName: categoryName);
    TaskCategory last = categoryList.removeLast();
    items.categoryList.add(category);
    items.categoryList.add(last);
  }

  static void showAddCategory(Items items, BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        final _newCategoryController = TextEditingController();

        return SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              color: HexColor(backGroundColor2),
              height: MediaQuery.of(context).size.height * 0.28,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Add new Category",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _newCategoryController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: "Category Name",
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        String newCategory = _newCategoryController.text;
                        if (newCategory == "" ||
                            newCategory == " " ||
                            newCategory == "  " ||
                            newCategory == "   ") {
                          items.showAlertDialog(context);
                        } else {
                          items.addCategory(items, newCategory);
                          Navigator.pop(context); // Close bottom sheet
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor(color1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        minimumSize: const Size(100, 40),
                      ),
                      child: Text(
                        "Add",
                        style: GoogleFonts.acme(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Warning"),
          content: Text("Category name cannot be empty!"),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Burada yapılacak işlemi gerçekleştir
                Navigator.of(context).pop(); // Uyarıyı kapat
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
