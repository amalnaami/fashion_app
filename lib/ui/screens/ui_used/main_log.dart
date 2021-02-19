import 'package:fashion_app/backend/server.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/ui/components/custom_appbar.dart';
import 'package:fashion_app/ui/components/store_item.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class MainLog extends StatelessWidget {
  String email;
  String password;
  saveEmail(String value) {
    this.email = value;
  }

  savepassword(String value) {
    this.password = value;
  }

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  GlobalKey<FormState> loginKey = GlobalKey();
  saveForm() {
    if (loginKey.currentState.validate()) {
      loginKey.currentState.save();

      signInUsingEmailAndPassword(this.email, this.password);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(
        title: 'Login',
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 120,
          margin: EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Form(
                key:loginKey ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 40, top: 20),

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
                    translator.translate('Login'),
                    style: titleStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
