import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cashmate_vscode/components/user.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  _InvitePageState createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: '+91 999 881 999 119',
  );

  final List<User> _users = [
    User('Samiksha Gupta', '@Samiksha', 'images/profile.png', false),
    User('Vanshita Varshney', '@vanshsita', 'images/profile.png', false),
    User('Rohit Singh', '@rohitsingh', 'images/profile.png', false),
    User('Manaeka Singh', '@manekasingh', 'images/profile.png', false),
    User('Rahul Roy', '@rahul', 'images/profile.png', false),
    User('John Smith', '@johnsmith', 'images/profile.png', false),
    User('Katty May', '@metz', 'images/profile.png', false),
    User('Ignacio Schmidt', '@schmidt', 'images/profile.png', false),
    User('Clyde Lucas', '@clyde', 'images/profile.png', false),
    User('Mikayla Marquez', '@mikayla', 'images/profile.png', false)
  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.7),
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade700,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                hintText: "Search users"),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: _foundedUsers.length > 0
                    ? ListView.builder(
                        itemCount: _foundedUsers.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  label: 'More',
                                  backgroundColor: Colors.transparent,
                                  icon: Icons.more_horiz,
                                  onPressed: (context) {
                                    print('More');
                                  },
                                ),
                                SlidableAction(
                                  label: 'Delete',
                                  backgroundColor: Colors.transparent,
                                  icon: Icons.delete,
                                  onPressed: (context) => setState(() {
                                    _users.removeAt(index);
                                  }),
                                ),
                              ],
                            ),
                            child: userComponent(user: _foundedUsers[index]),
                          );
                        })
                    : Center(
                        child: Text(
                        "No users found",
                        style: TextStyle(color: Colors.white),
                      )),
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
                      launchUrl(smsLaunchUri);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 180),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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

  userComponent({required User user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(user.image),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Text(user.username, style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: user.isFollowedByMe
                        ? Color(0xFF674AEF)
                        : Color(0xffffff),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: user.isFollowedByMe
                          ? Colors.transparent
                          : Colors.grey.shade700,
                    )),
                child: Center(
                    child: Text(user.isFollowedByMe ? 'Selected' : 'Select',
                        style: TextStyle(
                            color: user.isFollowedByMe
                                ? Colors.white
                                : Colors.white)))),
          )
        ],
      ),
    );
  }
}
