import 'package:kortoba_assign/model/cart_model.dart';
import 'package:kortoba_assign/model/favorites_model.dart';
import 'package:kortoba_assign/model/products_model.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

class DB {
  static final DB instance = DB._init();

  static Database? _database;

  DB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('shop.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "create table favorites(id integer primary key autoincrement, productId integer,productName text,productPrice text,productRate text,productCategory text,productCatImage text,productCatId integer,productImage text,productDesc text)");
    await db.execute(
        "create table cart(id integer primary key autoincrement,quantity integer, productId integer,productName text,productPrice text,productRate text,productCategory text,productCatImage text,productCatId integer,productImage text,productDesc text)");
  }

  // Future _onConfigure(Database db) async {
  //   // Add support for cascade delete
  //   // await db.execute("PRAGMA foreign_keys = ON");
  // }

  Future<int> insertFavorite(FavoritesModel favoritesModel) async {
    final db = await instance.database;
    return db.insert("favorites", favoritesModel.toJson());
  }

  Future<int> insertCart(CartModel cartModel) async {
    final db = await instance.database;
    return db.insert("cart", cartModel.toJson());
  }

  Future<void> clearCart() async {
    final db = await instance.database;

    db.execute("delete from cart");
  }

  Future<void> deleteFavorite(id) async {
    final db = await instance.database;
    await db.delete('favorites', where: "productId = ?", whereArgs: [id]);
  }

  Future<void> deleteCartItem(id) async {
    final db = await instance.database;
    await db.delete('cart', where: "productId = ?", whereArgs: [id]);
  }

  Future<List> getFavorites() async {
    final db = await instance.database;
    // final List<Map<String, Object?>> schedule =
    return db.query("favorites");
    //return schedule.map((e) => Schedule.fromMap(e)).toList();
  }

  Future<List> getCart() async {
    final db = await instance.database;
    // final List<Map<String, Object?>> schedule =
    return db.query("cart");
    //return schedule.map((e) => Schedule.fromMap(e)).toList();
  }

  Future<List<FavoritesModel>> checkFavoriteExist(id) async {
    final db = await instance.database;
    final result =
        await db.query('favorites', where: 'productId = ?', whereArgs: [id]);
    return result.map((json) => FavoritesModel.fromJson(json)).toList();
  }

  Future<List<CartModel>> checkCartExist(CartModel productModel) async {
    final db = await instance.database;
    final result = await db
        .query('cart', where: 'productId = ?', whereArgs: [productModel.id]);
    return result.map((json) => CartModel.fromJson(json)).toList();
  }
}
