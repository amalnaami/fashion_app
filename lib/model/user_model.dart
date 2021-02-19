import 'dart:io';

enum userType { customer, store }

class AppUser {
  String userId;
  String userName;
  String email;
  String password;
  String mobileNumber;
  File logo;
  String logoUrl;
  String companyActivity;
  userType type;

  AppUser(
      {this.companyActivity,
      this.email,
      this.logo,
      this.userName,
      this.mobileNumber,
      this.password,
      this.userId,
      this.type});

  factory AppUser.newUser(Map map) {
    bool isStore = map['isStore'] ?? false;
    if (isStore) {
      return AppUser.storeUser(map);
    } else {
      return AppUser.customerUser(map);
    }
  }

  AppUser.storeUser(Map map) {
    this.userId = map['userId'];
    this.companyActivity = map['companyActivity'];
    this.userName = map['userName'];
    this.email = map['email'];
    this.password = map['password'] ?? '';
    this.mobileNumber = map['mobileNumber'];
    this.logoUrl = map['logoUrl'];
    this.type = userType.store;
  }

  AppUser.customerUser(Map map) {
    this.userId = map['userId'];
    this.userName = map['userName'];
    this.email = map['email'];
    this.password = map['password'] ?? '';
    this.mobileNumber = map['mobileNumber'];
    this.type = userType.customer;
  }

  toJson() {
    return type == userType.customer
        ? {
            'userName': this.userName,
            'email': this.email,
            'password': this.password,
            'mobileNumber': this.mobileNumber,
            'isCustomer': true
          }
        : {
            'userName': this.userName,
            'email': this.email,
            'password': this.password,
            'mobileNumber': this.mobileNumber,
            'logo': this.logo,
            'logoUrl': this.logoUrl,
            'companyActivity': this.companyActivity,
            'isStore': true
          };
  }
}
