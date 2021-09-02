import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nav_bar/dafaults/defaults.dart';

void main() {
  runApp(MyApp());
}

var indexClicked = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final page = [
    Center(
      child: Text('Inbox'),
    ),
    Center(
      child: Text('Starred'),
    ),
    Center(
      child: Text('Sent'),
    ),
    Center(
      child: Text('Drafts'),
    ),
    Center(
      child: Text('Trash'),
    ),
    Center(
      child: Text('Spam'),
    ),
  ];
  VoidCallback updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav Drawer'),
      ),
      body: page[indexClicked],
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/drawer.jpg'),
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Johnrambo',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Johnrambo@gmail.com',
                      style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  AppDrawerTile(
                    index: (0),
                    ontap: updateState(0),
                  ),
                  AppDrawerTile(
                    index: (1),
                    ontap: updateState(1),
                  ),
                  AppDrawerTile(
                    index: (2),
                    ontap: updateState(2),
                  ),
                  AppDrawerTile(
                    index: (3),
                    ontap: updateState(3),
                  ),
                  AppDrawerTile(
                    index: (4),
                    ontap: updateState(4),
                  ),
                  AppDrawerTile(
                    index: (5),
                    ontap: updateState(5),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({required this.index, required this.ontap});

  final int index;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      selected: indexClicked == index,
      selectedTileColor: Defaults.drawerSelectedTileColor,
      leading: Icon(
        Defaults.drawerItemIcon[index],
        size: 30,
        color: indexClicked == index
            ? Defaults.drawerItemSelectedColor
            : Defaults.drawerItemColor,
      ),
      title: Text(
        Defaults.drawerItemText[index],
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
      ),
    );
  }
}
 