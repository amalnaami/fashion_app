
import 'package:fashion_app/model/depart.dart';
import 'package:fashion_app/model/market.dart';
import 'package:fashion_app/model/user_model.dart';

class Repository {
  Repository._();
  static Repository repository = Repository._();
  AppUser appUser;
  Depart depart;
  Market market;
}
