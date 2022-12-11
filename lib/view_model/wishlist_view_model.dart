import 'package:flutter/material.dart';
import 'package:kortoba_assign/model/favorites_model.dart';

import '../service/db.dart';
import '../view/auth/screens/login/login_screen.dart';

class WishlistViewModel with ChangeNotifier {
  List<dynamic> favoritesList = [];
  logout(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen()));
  }

  setFavoritesList(List<dynamic> favorites) {
    favoritesList = favorites;
    notifyListeners();
  }

  fetchFavorites() async {
    await DB.instance.getFavorites().then((value) => setFavoritesList(value));
  }

  addToFavorites(FavoritesModel favoritesModel) async {
    await DB.instance.insertFavorite(favoritesModel);
  }

  removeFavorite(id) async {
    await DB.instance.deleteFavorite(id);
  }
}
