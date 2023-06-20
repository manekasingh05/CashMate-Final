import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'dart:collection';
import 'package:rxdart/rxdart.dart';
import 'package:cashmate_vscode/services/local_notifications.dart';
import 'package:cashmate_vscode/pages/activity.dart';
import 'dart:developer';
import 'package:cashmate_vscode/pages/loginPage.dart';

class Category {
  final String image;

  Category({required this.image});
}

class SendNotificationScreen extends StatefulWidget {
  SendNotificationScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SendNotificationScreenState createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
  final myController = TextEditingController();
  final myusername = MyRegister.myUsername;

  List<Category> imagePaths = [
    Category(image: "meme_1.png"),
    Category(image: "meme_2.jpg"),
    Category(image: "meme_4.jpg"),
    Category(image: "meme_5.jpg"),
    Category(image: "meme_6.jpeg"),
    Category(image: "meme_7.webp"),
    Category(image: "meme_8.jpeg"),
    Category(image: "meme_9.jpeg"),
    Category(image: "meme_9.webp"),
    Category(image: "meme_10.jpeg"),
    Category(image: "meme_11.webp"),
    Category(image: "meme_12.jpg"),
    Category(image: "meme_13.jpg"),
    Category(image: "meme_14.jpg")
  ];

  HashSet selectItems = new HashSet();
  bool isMultiSelectionEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        leading: isMultiSelectionEnabled
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isMultiSelectionEnabled = false;
                    selectItems.clear();
                  });
                },
                icon: Icon(Icons.close))
            : null,
        title: Text(isMultiSelectionEnabled
            ? getSelectedItemCount()
            : "Send Notifications"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                controller: myController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 122, 122, 122),
                      ),
                    ),
                    hintText: "Type...",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 122, 122, 122)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1.5,
                  children: imagePaths.map((path) {
                    return getGridItem(path);
                  }).toList(),
                ),
              ),
            ),
            Container(
              width: 600,
              child: Card(
                elevation: 10,
                color: Color(0xFF674AEF),
                child: Material(
                  color: Color(0xFF674AEF),
                  borderRadius: BorderRadius.circular(10),
                  shadowColor: Color.fromARGB(67, 66, 66, 66),
                  child: InkWell(
                    onTap: () {
                      NotificationService().showNotification(
                          title: '@${myusername.text}',
                          body: '${myController.text}');
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Notification Sent Successfully!',
                        confirmBtnColor: Color(0xFF674AEF),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 160),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getSelectedItemCount() {
    return selectItems.isNotEmpty
        ? selectItems.length.toString() + " item selected"
        : "No item selected";
  }

  void doMultiSelection(path) {
    if (isMultiSelectionEnabled) {
      setState(() {
        if (selectItems.contains(path)) {
          selectItems.remove(path);
        } else {
          selectItems.add(path);
        }
      });
    } else {
      //
    }
  }

  GridTile getGridItem(path) {
    return GridTile(
      child: InkWell(
        onTap: () {
          doMultiSelection(path);
        },
        onLongPress: () {
          isMultiSelectionEnabled = true;
          doMultiSelection(path);
        },
        child: Stack(
          children: [
            Image.asset(
              "images/${path.image}",
              color:
                  Colors.black.withOpacity(selectItems.contains(path) ? 1 : 0),
              colorBlendMode: BlendMode.color,
            ),
            Visibility(
                visible: selectItems.contains(path),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 30,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
