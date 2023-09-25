import 'package:agri/services/constants.dart';
import 'package:agri/views/change_password.dart';
import 'package:agri/views/login_page.dart';
import 'package:flutter/material.dart';

class DrawerHome extends StatefulWidget {
  DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.4,
      child: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: SizedBox(
              height: 50,
            )),
            Container(
              decoration: new BoxDecoration(
                color: Colors.black87,
              ),
              child: ListTile(
                title: Text(
                  name ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AcceptedOrders()),
                    );
                  },
                  leading: const Icon(
                    Icons.change_circle_outlined,
                    color: Colors.black87,
                  ),
                  title: Text(
                    "Accepted Orders",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    logout();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.black87,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
