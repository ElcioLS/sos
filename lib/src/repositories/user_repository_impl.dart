import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sos/src/data/modules/user_model.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio _dio;

  UserRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<UserModel?> login() async {
    final response = await _dio.post('/login');

    if (response.statusCode == 200) {
      log(response.data.toString());
    }
  }

  @override
  Future<UserModel?> me({required String sessionToken}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> update({required UserModel user}) {
    throw UnimplementedError();
  }
}
