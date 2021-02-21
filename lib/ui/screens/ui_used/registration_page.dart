import 'dart:io';

import 'package:fashion_app/backend/fashion_provider.dart';
import 'package:fashion_app/backend/server.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/model/user_model.dart';
import 'package:fashion_app/ui/components/custom_appbar.dart';
import 'package:fashion_app/ui/components/store_item.dart';
import 'package:fashion_app/ui/screens/ui_used/main_log.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatelessWidget {
  userType type;

  RegistrationPage(this.type);

  String userName;
  String email;
  String password;
  String mobileNumber;
  File logo;
  String companyActivity;

  saveUserName(String value) {
    this.userName = value;
  }

  saveEmail(String value) {
    this.email = value;
  }

  savepassword(String value) {
    this.password = value;
  }

  saveMobileNum(String value) {
    this.mobileNumber = value;
  }

  saveLogo(File value) {
    this.logo = value;
  }

  saveCompanyActivity(String value) {
    this.companyActivity = value;
  }

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();

  saveForm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      AppUser appUser = type == userType.store
          ? AppUser.storeUser({
              'userName': this.userName,
              'email': this.email,
              'password': this.password,
              'mobileNumber': this.mobileNumber,
              'companyActivity': this.companyActivity,
            })
          : AppUser.customerUser({
              'userName': this.userName,
              'email': this.email,
              'password': this.password,
              'mobileNumber': this.mobileNumber,
            });

      saveUserInFirebase(appUser);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: this.type == userType.customer
            ? 'Client registration'
            : 'Store registration',
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 120,
        margin: EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Form(
              key: formKey,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 40, top: 20),
                    child: Text(
                      translator.translate(this.type == userType.customer
                          ? 'You can register as a client from here'
                          : 'You can register your store from here'),
                      style: titleStyle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                  ),
                  TextItems(
                    name: 'User name',
                    saveFun: saveUserName,
                    validateFun: nullValidator,
                  ),
                  TextItems(
                    name: 'email',
                    validateFun: nullValidator,
                    saveFun: saveEmail,
                  ),
                  TextItems(
                    name: 'pass',
                    validateFun: nullValidator,
                    saveFun: savepassword,
                  ),
                  TextItems(
                    name: 'phone',
                    validateFun: nullValidator,
                    saveFun: saveMobileNum,
                  ),
                  this.type == userType.customer
                      ? Container()
                      : TextItems(
                          name: 'Company activity',
                          validateFun: nullValidator,
                          saveFun: saveCompanyActivity,
                        ),
                  this.type == userType.store
                      ? Selector<FashionProvider, File>(
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () async {
                          PickedFile pickedFile = await ImagePicker()
                              .getImage(source: ImageSource.gallery);
                          File file = File(pickedFile.path);
                          Provider.of<FashionProvider>(context,
                              listen: false)
                              .setFile(file);
                        },
                        child: Container(
                          color: Colors.grey[300],
                          height: 100,
                          child: value != null
                              ? Image.file(
                            value,
                            fit: BoxFit.cover,
                          )
                              : Icon(Icons.add),
                        ),
                      );
                    },
                    selector: (x, y) {
                      return y.file;
                    },
                  )
                      : Container(),
                  Center(

                    child: FlatButton(onPressed: (){
                      Get.to(MainLog());
                    }, child: Text('Login',
                      style: titleStyle,
                      textAlign: TextAlign.center,
                    )),
                  ),
                  SizedBox(height: 50,)

                ],
              ),
            ),
            InkWell(
              onTap: () {
                saveForm();

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: pinkColor,
                ),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  translator.translate('Register'),
                  style: titleStyle.copyWith(color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
