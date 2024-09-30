
import 'package:bloc/bloc.dart';
import 'package:chef_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/commons/global_models/local_notifications_model.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit({required this.homeRepoImplementation}) : super(HomeScreenInitial());

  static HomeScreenCubit get(context)=>BlocProvider.of(context);
  final HomeRepoImplementation homeRepoImplementation;
















}

