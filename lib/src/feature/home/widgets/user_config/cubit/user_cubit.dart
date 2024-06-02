import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
}
