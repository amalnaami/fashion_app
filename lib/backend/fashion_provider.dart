import 'dart:io';

import 'package:fashion_app/model/market.dart';
import 'package:fashion_app/model/depart.dart';
import 'package:fashion_app/model/products.dart';
import 'package:fashion_app/model/user_model.dart';
import 'package:flutter/material.dart';

class FashionProvider extends ChangeNotifier {
  Market selectedMarket;
  AppUser appUser;
  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }


  // bool isCallAllowed = false;
  // bool isMessagesAllowed = false;
  // changeCallAllowed() {
  //   this.isCallAllowed = !this.isCallAllowed;
  //   notifyListeners();
  // }
  //
  // changeMessagesAllowed() {
  //   this.isMessagesAllowed = !this.isMessagesAllowed;
  //   notifyListeners();
  // }

  File file;
  setFile(File file) {
    this.file = file;
    notifyListeners();
  }

  List<Market> markets = [];
  List<Depart> depart = [];
  List<Product> product = [];

  setMarkets(List<Market> value) {
    this.markets = value;
    notifyListeners();
  }

  setDeparts(List<Depart> value) {
    this.depart = value;
    notifyListeners();
  }
  setProducts(List<Product> value) {
    this.product = value;
    notifyListeners();
  }

  int productBottomIndex = 0;
  changeIndex(int value) {
    this.productBottomIndex = value;
    notifyListeners();
  }
}
