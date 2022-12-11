import 'package:flutter/material.dart';
import 'package:kortoba_assign/model/favorites_model.dart';
import 'package:kortoba_assign/res/text_widget.dart';
import 'package:kortoba_assign/view_model/wishlist_view_model.dart';
import 'package:provider/provider.dart';
import 'wishlist_item.dart';

class WishlistList extends StatefulWidget {
  const WishlistList({Key? key}) : super(key: key);

  @override
  State<WishlistList> createState() => _WishlistListState();
}

class _WishlistListState extends State<WishlistList> {
  WishlistViewModel wishlistViewModel = WishlistViewModel();

  @override
  void initState() {
    super.initState();
    wishlistViewModel.fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ChangeNotifierProvider<WishlistViewModel>(
            create: (BuildContext context) => wishlistViewModel,
            child: Consumer<WishlistViewModel>(builder: (context, value, _) {
              return Column(children: [
                _wishList(height, value),
              ]);
            })),
      ],
    );
  }

  Widget _wishList(double height, WishlistViewModel value) {
    return SizedBox(
      height: height,
      child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: value.favoritesList.length,
          itemBuilder: (context, index) {
            if (value.favoritesList.isEmpty) {
              return TextUtils(text: 'emptyyyy');
            } else {
              FavoritesModel favoritesModel =
                  FavoritesModel.fromJson(value.favoritesList[index]);
              // FavoritesModel favoritesModel = value.favoritesList[index];
              return WishlistItem(products: favoritesModel);
            }
          }),
    );
  }
}
