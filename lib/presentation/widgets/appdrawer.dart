import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: 200,
        child: ListView(
          children: <Widget>[
            Container(child: Image.asset('assets/images/logo.png')),
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Color(0xFF32434F),
              ),
              title:
                  Text('dashboard', style: TextStyle(color: Color(0xFF32434F))),
            ),
            ListTile(
              leading: Icon(
                Icons.pages,
                color: Color(0xFF32434F),
              ),
              title:
                  Text('requests', style: TextStyle(color: Color(0xFF32434F))),
            ),
            ListTile(
              leading: Icon(
                Icons.pages,
                color: Color(0xFF32434F),
              ),
              title: Text('make request',
                  style: TextStyle(color: Color(0xFF32434F))),
            ),
            ListTile(
              leading: Icon(
                Icons.pages,
                color: Color(0xFF32434F),
              ),
              title:
                  Text('delivered', style: TextStyle(color: Color(0xFF32434F))),
            ),
          ],
        ));
  }
}
