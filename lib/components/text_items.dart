import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  Function saveFun;
  Function validateFun;
  String lable;
  FormItem({this.lable,this.saveFun,this.validateFun});
  @override
  Widget build(BuildContext context) {
    return    TextFormField(
      validator:validateFun,
      onSaved: (val){
        saveFun(val);
      },
      decoration: InputDecoration(
          labelText: lable,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
