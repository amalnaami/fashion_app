import 'package:fashion_app/backend/repository.dart';
import 'package:fashion_app/backend/server.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/model/user_model.dart';
import 'package:fashion_app/ui/screens/call_us.dart';
import 'package:fashion_app/ui/screens/terms_screen.dart';
import 'package:fashion_app/ui/screens/ui_used/new_depart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../about_us_screen.dart';

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
              currentAccountPicture: Repository.repository.appUser.logoUrl !=
                      null
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage(Repository.repository.appUser.logoUrl),
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Text(
                        Repository.repository.appUser.userName[0].toUpperCase(),
                        style: titleStyle.copyWith(
                            fontWeight: FontWeight.w900, fontSize: 34),
                      ),
                    ),
              accountName: Text(Repository.repository.appUser.userName,
                  style: titleStyle.copyWith(color: brownColor, fontSize: 16)),
              accountEmail: Text(Repository.repository.appUser.email,
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
          Repository.repository.appUser.type == userType.store
              ? ListTile(
            leading: Icon(
              Icons.pages_rounded,
              size: 22,
              color: brownColor,
            ),
            title: Text('Add Depart',style: titleStyle.copyWith(color: brownColor, fontSize: 18)),
            onTap: () {
              Get.to(NewDepart());
            },
          )
              : ListTile(
            title: Text(''),
          ),
          // Repository.repository.appUser.type == userType.store
          //     ? ListTile(
          //   leading: Icon(
          //     Icons.shopping_cart,
          //     size: 22,
          //     color: brownColor,
          //   ),
          //   title: Text('Add Product',style: titleStyle.copyWith(color: brownColor, fontSize: 18)),
          //   onTap: () {
          //     Get.to(NewProduct());
          //   },
          // )
          //     : ListTile(
          //   title: Text(''),
          // ),

          ListTile(
            subtitle: InkWell(
                onTap: () {
                  translator.setNewLanguage(
                    context,
                    newLanguage:
                        translator.currentLanguage == 'ar' ? 'en' : 'ar',
                    remember: true,
                    restart: true,
                  );
                },
                child: Text(
                  'Change',
                  style: titleStyle.copyWith(fontSize: 14, color: pinkColor),
                )),
            title: Text(translator.translate('Language'),
                style: titleStyle.copyWith(color: brownColor, fontSize: 18)),
            leading: Icon(
              Icons.language,
              size: 22,
              color: brownColor,
            ),
          ),
          InkWell(
            onTap: () {
              signOut();
            },
            child: ListTile(
              title: Text(translator.translate('Log Out'),
                  style: titleStyle.copyWith(color: brownColor, fontSize: 18)),
              leading: Icon(
                Icons.logout,
                size: 22,
                color: brownColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
