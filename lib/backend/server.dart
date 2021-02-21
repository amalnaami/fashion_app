import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/backend/fashion_provider.dart';
import 'package:fashion_app/backend/repository.dart';
import 'package:fashion_app/model/market.dart';
import 'package:fashion_app/model/depart.dart';
import 'package:fashion_app/model/products.dart';
import 'package:fashion_app/model/user_model.dart';
import 'package:fashion_app/ui/screens/first_screen.dart';
import 'package:fashion_app/ui/screens/ui_used/home_screen.dart';
import 'package:fashion_app/ui/screens/ui_used/main_log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/route_manager.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
Logger logger = Logger();
final String collectionName = 'users';

Future<String> registerUsingEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await firebaseAuth
      .createUserWithEmailAndPassword(email: email, password: password);
  return userCredential.user.uid;
}

Future<String> signInUsingEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password);
  DocumentSnapshot documentSnapshot = await firestore
      .collection(collectionName)
      .doc(userCredential.user.uid)
      .get();
  Map map = documentSnapshot.data();
  map['userId'] = userCredential.user.uid;
 logger.e(userCredential.user.uid);
  AppUser appUser = AppUser.newUser(map);
  Repository.repository.appUser = appUser;
  Get.to(HomeScreen());
}

String getUserId() {
  String userId =
      firebaseAuth.currentUser != null ? firebaseAuth.currentUser.uid : null;
  return userId;
}

signOut() async {
  await firebaseAuth.signOut();
  Get.off(FirstScreen());
}

saveUserInFirebase(AppUser appUser) async {
  try {
    String userId =
        await registerUsingEmailAndPassword(appUser.email, appUser.password);
    Map map = appUser.toJson();
    map.remove('password');
    bool isStore = appUser.type == userType.store;
    if (isStore) {
      map['logoUrl'] = await uploadImage(
          Provider.of<FashionProvider>(Get.context, listen: false).file);

      appUser.logoUrl = map['logoUrl'];
    }

    await firestore.collection(collectionName).doc(userId).set(map);
    Repository.repository.appUser = appUser;
    Get.to(MainLog());
  } on Exception catch (e) {
    logger.e(e);
  }
}

Future<AppUser> getUserFromFirebase() async {
  String userId = getUserId();

  DocumentSnapshot documentSnapshot =
      await firestore.collection(collectionName).doc(userId).get();
  Map map = documentSnapshot.data();
  map['userId'] = userId;
  AppUser appUser = AppUser.newUser(map);

  return appUser;
}

Future<String> uploadImage(File file, [bool isProductImage = false]) async {
  String fileName = file.path.split('/').last;
  String folderName = isProductImage ? 'productImages' : 'logos';
  Reference reference = storage.ref('$folderName/$fileName');
  await reference.putFile(file);
  String imageUrl = await reference.getDownloadURL();
  return imageUrl;
}

fetchSplachData() async {
  getAllMarkets();
  AppUser appUser = await getUserFromFirebase();
  Repository.repository.appUser = appUser;
}

addNewDepart(Map map) async {
  String productImageUrl = await uploadImage(map['file'], true);

  map.remove('file');
  map['imageUrl'] = productImageUrl;
  await firestore
      .collection(Repository.repository.appUser.userId)
      .add({...map});

  // firestore
  //     .collection('Depart')
  //     .doc(Repository.repository.appUser.userId)
  //     .collection('MarketDepart')
  //     .add({...map});
  Get.back();
}

getAllMarkets() async {
  QuerySnapshot querySnapshot = await firestore
      .collection('users')
      .where('isStore', isEqualTo: true)
      .get();
  List<Market> markets = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['marketId'] = e.id;
    return Market.fromMap(map);
  }).toList();
  Provider.of<FashionProvider>(Get.context, listen: false).setMarkets(markets);
}

getAllMarketsProductsFromFirebase(String marketId) async {
  QuerySnapshot querySnapshot = await firestore
      .collection('Markets')
      .doc(marketId)
      .collection('MarketProduct')
      .get();

  List<Product> products = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['productId'] = e.id;
    return Product.fromMap(map);
  }).toList();
  Provider.of<FashionProvider>(Get.context, listen: false)
      .setProducts(products);
}
// getAllMarkets() async {
//   QuerySnapshot querySnapshot = await firestore
//       .collection('users')
//       .where('isStore', isEqualTo: true)
//       .get();
//   List<Market> markets = querySnapshot.docs.map((e) {
//     Map map = e.data();
//     map['marketId'] = e.id;
//     return Market.fromMap(map);
//   }).toList();
//   Provider.of<FashionProvider>(Get.context, listen: false).setMarkets(markets);
// }
//
//
// getAllMarketsProductsFromFirebase(String marketId) async {
//   QuerySnapshot querySnapshot = await firestore.collection(marketId).get();
//   List<Depart> departs = querySnapshot.docs.map((e) {
//     Map map = e.data();
//     map['departId'] = e.id;
//     return Depart.fromMap(map);
//   }).toList();
//   Provider.of<FashionProvider>(Get.context, listen: false).setDeparts(departs);
// }


///TODO
addNewProducts(Map map) async {
  String productImageUrl = await uploadImage(map['file'], true);
  map.remove('file');
  map['imageUrl'] = productImageUrl;
  await firestore.collection('Products')
      .doc(Repository.repository.appUser.userId)
      .collection(map['departId'])
      .add({...map});
  Get.back();
  print(
      'Repository.repository.depart.departId${Repository.repository.depart.departId}');
}

getAllProductsFromFirebase(String departId) async {
  QuerySnapshot querySnapshot = await firestore
      .collection('Products')
      .doc(Repository.repository.appUser.userId)
      .collection(departId)
      .get();
  List<Product> products = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['departId'] = e.id;
    return Product.fromMap(map);
  }).toList();

  Provider.of<FashionProvider>(Get.context, listen: false)
      .setProducts(products);
}


