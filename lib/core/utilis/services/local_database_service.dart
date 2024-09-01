

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabaseService
{
  // static BoxCollection? appBoxCollection;
  // static CollectionBox? appFavouritesMeals;
  static Box? favouriteMealsBox;

  // This function to open only a single box in the app not a collection
  static Future<Box>  openHiveBox(String boxName) async
  {
    if(!Hive.isBoxOpen(boxName))
      {
        Hive.init((await getApplicationCacheDirectory()).path);
      }
    return await Hive.openBox(boxName);

  }

  // This function to open a collection of many boxes in the app
  static Future<BoxCollection> openCollections(Set<String> collections) async
  {
    return await BoxCollection.open(
      'mealTimeAppLocalDataBase', // Name of your database
      collections, // Names of your boxes
      path: (await getApplicationCacheDirectory()).path
    );
  }



}