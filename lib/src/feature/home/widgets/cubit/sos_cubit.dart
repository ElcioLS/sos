import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sos_state.dart';

class SosCubit extends Cubit<SosState> {
  SosCubit() : super(SosInitial());
}
