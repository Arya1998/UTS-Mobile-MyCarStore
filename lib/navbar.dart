import 'package:flutter/material.dart';
import 'package:utsku/form.dart';
import 'package:utsku/profile.dart';


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('I Wayan Arya Gina Widyatmaja'),
            accountEmail: Text('aryagina@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://i.ibb.co/mGnf4Kw/IMG-7175.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://i.ibb.co/bsDD3fg/thumb-1920-751043.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Profile())),
          ),
          ListTile(
            leading: Icon(Icons.folder_open_outlined),
            title: Text('Library'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.payment_outlined),
            title: Text('Payment'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification & offers'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_post_office),
            title: Text('Feedback'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FormFeed()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}