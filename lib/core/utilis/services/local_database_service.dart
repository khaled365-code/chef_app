



import 'package:hive_flutter/adapters.dart';

import '../../../features/home/data/models/get_meals_model/meals.dart';

class LocalDatabaseService
{
  static Box<Meals>? favouriteMealsBox=Hive.box<Meals>('favourite_meals');


  static Future<void> creatingFavouritesBox()  async
  {
      await Hive.openBox<Meals>('favourite_meals');
  }

  static Future<void> closeFavouritesBox() async
  {
    await favouriteMealsBox!.close();
  }

  static Future<void> clearFavouritesBox() async
  {
    await favouriteMealsBox!.clear();
  }










}