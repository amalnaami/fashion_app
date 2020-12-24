import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/screens/about_us_screen.dart';
import 'package:fashion_app/screens/call_us.dart';
import 'package:fashion_app/screens/terms_screen.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: pinkColor),
              arrowColor: Colors.red,
              currentAccountPicture: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.G5N1757qeorY7b5xL0kqkQHaEK?pid=Api&rs=1'),
              ),
              accountName: Text('اسم المتجر/العميل',
                  style: titleStyle.copyWith(color: brownColor, fontSize: 16)),
              accountEmail: Text('user@gmail.com',
                  style: titleStyle.copyWith(color: brownColor, fontSize: 14))),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CallUsScreen()));
            },
            child: ListTile(
              title: Text(translator.translate('Contact us'),
                  style: titleStyle.copyWith(color: brownColor, fontSize: 18)),
              leading: Icon(
                Icons.phone_in_talk,
                size: 22,
                color: brownColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TermsScreen()));
            },
            child: ListTile(
              title: Text(translator.translate('Terms and conditions'),
                  style: titleStyle.copyWith(color: brownColor, fontSize: 18)),
              leading: Icon(
                Icons.settings,
                size: 22,
                color: brownColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()));
            },
            child: ListTile(
              title: Text(translator.translate('About Us'),
                  style: titleStyle.copyWith(color: brownColor, fontSize: 18)),
              leading: Icon(
                Icons.info,
                size: 22,
                color: brownColor,
              ),
            ),
          ),
          ListTile(
            subtitle: InkWell(
                onTap: (){
                  translator.setNewLanguage(
                    context,
                    newLanguage:
                    translator.currentLanguage == 'ar'
                        ? 'en'
                        : 'ar',
                    remember: true,
                    restart: true,
                  );
                },
                child: Text('Change',style: titleStyle.copyWith(fontSize: 14,color: pinkColor),)),
            title: Text(translator.translate('Language'),
                style: titleStyle.copyWith(color: brownColor, fontSize: 18)),
            leading: Icon(
              Icons.language,
              size: 22,
              color: brownColor,
            ),
          ),
        ],
      ),
    );
  }
}
