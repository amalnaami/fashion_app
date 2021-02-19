import 'dart:io';

import 'package:fashion_app/backend/fashion_provider.dart';
import 'package:fashion_app/backend/server.dart';
import 'package:fashion_app/contstant.dart';
import 'package:fashion_app/ui/components/custom_appbar.dart';
import 'package:fashion_app/ui/components/store_item.dart';
import 'package:fashion_app/ui/components/text_items.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewDepart extends StatelessWidget {
  String departName;
  // String price;
  String description;
  bool allowCall;
  bool allowMessages;
  File departimage;
  GlobalKey<FormState> newDepartFormKey = GlobalKey();

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  setProductName(String value) {
    this.departName = value;
  }

  // setProductPrice(String value) {
  //   this.price = value;
  // }

  setProductDescription(String value) {
    this.description = value;
  }

  setAllowCall(bool value) {
    this.allowCall = value;
  }

  setAllowMessages(bool value) {
    this.allowMessages = value;
  }

  saveForm(context) {
    if (newDepartFormKey.currentState.validate()) {
      newDepartFormKey.currentState.save();
      Map map = {
        'departName': this.departName,
     //   'productPrice': this.price,
        'departDescription': this.description,
        // 'allowCalling':
        //     Provider.of<FashionProvider>(context, listen: false).isCallAllowed,
        // 'allowMessaging': Provider.of<FashionProvider>(context, listen: false)
        //     .isMessagesAllowed,
        'file': Provider.of<FashionProvider>(context, listen: false).file,
      };
      addNewDepart(map);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Departs',
      ),
      body: Form(
          key: newDepartFormKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextItems(
                  name: 'Depart Name',
                  saveFun: setProductName,
                  validateFun: nullValidator,
                ),
                // TextItems(
                //   name: 'Price',
                //   saveFun: setProductPrice,
                //   validateFun: nullValidator,
                // ),
                TextItems(
                  name: 'Description',
                  saveFun: setProductDescription,
                  validateFun: nullValidator,
                ),
                Selector<FashionProvider, File>(
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () async {
                        PickedFile pickedFile = await ImagePicker()
                            .getImage(source: ImageSource.gallery);
                        File file = File(pickedFile.path);
                        Provider.of<FashionProvider>(context, listen: false)
                            .setFile(file);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width/2,
                        width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100]
                        ),
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
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  color: pinkColor,
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text('Add Depart',style: titleStyle.copyWith(color: Colors.white),),
                    onPressed: () {
                      saveForm(context);
                    })
              ],
            ),
          )),
    );
  }
}
