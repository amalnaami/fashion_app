// import 'package:flutter/material.dart';
//
// class ShPage extends StatefulWidget {
//   @override
//   _ShPageState createState() => _ShPageState();
// }
//
// class _ShPageState extends State<ShPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo,
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             showButtonSheet(context);
//           },
//           child: Text('CLICK HERE'),
//         ),
//       ),
//     );
//   }
// }
//
// final _formKey = new GlobalKey<FormState>();
// int groupVal = 0;
//
// void showButtonSheet(context) {
//   showModalBottomSheet(
//       backgroundColor: Colors.white,
//       useRootNavigator: true,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(16.0),
//             topRight: const Radius.circular(16.0)),
//       ),
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Form(
//               key: _formKey,
//               child: Container(
//                   height: MediaQuery.of(context).size.height / 2.5,
//                   margin: EdgeInsets.only(top: 40),
//                   color: Colors.white,
//                   child: ListView(
//                     children: [
//                       RadioListTile(
//                         title: Text('Choice 1'),
//                         onChanged: (val) {
//                           setState(() {});
//                           groupVal = val;
//                         },
//                         groupValue: groupVal,
//                         value: 0,
//                       ),
//                       RadioListTile(
//                         title: Text('Choice 2'),
//                         onChanged: (val) {
//                           setState(() {});
//
//                           groupVal = val;
//                         },
//                         groupValue: groupVal,
//                         value: 1,
//                       ),
//                       RadioListTile(
//                         title: Text('Choice 3'),
//                         onChanged: (val) {
//                           setState(() {});
//
//                           groupVal = val;
//                         },
//                         groupValue: groupVal,
//                         value: 2,
//                       ),
//                       RadioListTile(
//                         title: Text('Choice 4'),
//                         onChanged: (val) {
//                           setState(() {});
//
//                           groupVal = val;
//                         },
//                         groupValue: groupVal,
//                         value: 3,
//                       ),
//                       RadioListTile(
//                         title: Text('Choice 5'),
//                         onChanged: (val) {
//                           setState(() {});
//
//                           groupVal = val;
//                         },
//                         groupValue: groupVal,
//                         value: 4,
//                       ),
//                     ],
//                   )),
//             );
//           },
//         );
//       });
// }
