import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  final myusername = MyRegister.myUsername;

  bool startAnimation = false;

  List<String> imagePaths = [
    "images/profile9.jpg",
    "images/profile2.jpg",
    "images/profile3.jpg",
    "images/profile2.jpg",
    "images/profile5.jpg",
    "images/profile7.jpeg",
    "images/profile8.jpeg",
    "images/profile9.jpg",
    "images/profile12.jpg",
    "images/profile5.jpg",
    "images/profile9.jpg",
    "images/profile2.jpg",
    "images/profile3.jpg",
    "images/profile2.jpg",
    "images/profile12.jpg",
    "images/profile5.jpg",
    "images/profile9.jpg",
    "images/profile2.jpg",
    "images/profile3.jpg",
    "images/profile2.jpg"
  ];

  List<String> texts = [
    "@Samiksha",
    "@Vanshita09",
    "@Rohit",
    "@Paarth",
    "@Erinakira78",
    "@Surya",
    "@Sakshi67",
    "@P.i.y.u.s.h",
    "@Samridhi",
    "@Raj",
    "@Riyaaa",
    "@Milee67",
    "@HarryPotter",
    "@John",
    "@Hermoine",
    "@Ron",
    "@Ironman",
    "@Elizabeth",
    "@Quenn678",
    "@King56",
  ];

  List<IconData> icons = [
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
    Icons.arrow_forward_ios,
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text('Select Users'),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  // Future.delayed(const Duration(milliseconds: 500), () {
                  //   setState(() {
                  //     startAnimation = true;
                  //   });
                  // });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('images/profile.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${myusername.text}',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'List Of Users',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyRoutes.PayWithWalletRoute);
                      },
                      child: item(index));
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(int index) {
    return AnimatedContainer(
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("${imagePaths[index]}"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${texts[index]}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Icon(
            icons[index],
            color: Color(0xFF674AEF),
          ),
        ],
      ),
    );
  }
}
