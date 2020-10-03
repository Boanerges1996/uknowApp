import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skulman/src/provider/bottomNav.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    BotomNav botom = Provider.of<BotomNav>(context);
    return Theme(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Boanerges"),
            accountEmail: Text("samsonnkrumah253@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  "https://avatars1.githubusercontent.com/u/43884482?s=460&u=28deefa0cac7c9c7fd0fffa70192d043e00a3f9f&v=4",
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.user),
            title: Text("Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.newspaper),
            title: Text("News"),
            onTap: () {
              botom.setIndex(1);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.handHolding),
            title: Text("BNS"),
            onTap: () {
              botom.setIndex(2);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.book),
            title: Text("Library"),
            onTap: () {
              botom.setIndex(3);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.pen),
            title: Text("Make Post"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/make/post");
            },
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
      data: Theme.of(context).copyWith(primaryColor: Colors.pink),
    );
  }
}
