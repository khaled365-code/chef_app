



import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver
{

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('bloc is created,$bloc');
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('bloc $bloc is changed,$change');

  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('bloc $bloc is closed');

  }

}