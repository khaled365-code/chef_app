



import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/database/errors/server_exception.dart';
import 'package:chef_app/core/utilis/commons.dart';
import 'package:chef_app/features/menu/data/models/MealModel.dart';
import 'package:chef_app/features/menu/data/repos/menue_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class MenueRepoImplementation implements MenueRepo {

  final ApiConsumer api;

  MenueRepoImplementation({required this.api});

  @override
  Future<Either<String, String>> addMeal({required String name, required String desc, required String price, required String category, required String howToSell, required XFile mealImage}) async {

    try
    {
     final response= await api.post(
       EndPoint.addMeal,
       data: {
         ApiKeys.name:name,
         ApiKeys.description:desc,
         ApiKeys.price:price,
         ApiKeys.category:category,
         ApiKeys.howToSell:howToSell,
         ApiKeys.mealImage:await uploadImageToAPI(mealImage)
       },
       formData: true

     );
     return Right(response['message']);
    }
    on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }

  }

  @override
  Future<Either<String, MealModel>> getAllMeals({required dynamic id}) async {
    try
    {
     final respnse=await api.get(
          EndPoint.getAllChefMeals(id)
      );
     return Right(MealModel.fromJson(respnse));
    }
    on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }

  }

  @override
  Future<Either<String, String>> deleteMeals({required id}) async
  {
    try {
      final response =await api.delete(
        EndPoint.deleteMeal(id),
      );
      return Right(response[ApiKeys.message]);
    }on ServerException catch(e)
    {
      return Left(e.errorModel.errorMessage);
    }
   
  }
}
