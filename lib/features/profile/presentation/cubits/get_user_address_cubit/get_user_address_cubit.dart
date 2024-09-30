import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/utilis/services/internet_connection_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/commons/global_models/adress_model/AddressComponents.dart';
import '../../../../../core/commons/global_models/adress_model/AddressModel.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/utilis/services/get_device_address_service.dart';

part 'get_user_address_state.dart';

class GetUserAddressCubit extends Cubit<GetUserAddressState> {
  GetUserAddressCubit() : super(GetUserAddressInitial());


  static GetUserAddressCubit get(context)=>BlocProvider.of(context);

  String userAddress='';

  getUserAddressFun() async
  {
    if(await InternetConnectionCheckingService.checkInternetConnection() == true)
      {
        AddressModel addressModel = await DeviceAddressService.getAppAddress();
        List<AddressComponents> addressComponentsList=addressModel.results![0].addressComponents!;
        for(var item in addressComponentsList)
        {
          userAddress+="${item.longName},";
        }
        await CacheHelper().saveData(key: ApiKeys.userAddress, value: userAddress);
      }

  }








}
