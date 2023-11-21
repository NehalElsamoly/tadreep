import 'dart:js';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../core/ulits/apiservice.dart';
import '../../data/model.dart';
import 'monthes_state.dart';

class MonthesCubit extends Cubit<MonthesState> {
  final Apiservice apiService;

  MonthesCubit({required this.apiService}) : super(MonthesLoading());

  Future<void> getAllMonths(String token) async {

    try {
      emit(MonthesLoading());

      final response = await apiService.getAllMonths(token);

      if (response is Monthes) {
        // Assuming your response data is already an instance of Monthes
        emit(MonthesLoaded(response));
      } else if (response is Response) {
        // If the response is not an instance of Monthes, parse it
        final monthes = Monthes.fromJson(response.data as Map<String, dynamic>);
        emit(MonthesLoaded(monthes));
      } else {
        print('Unexpected response type: ${response.runtimeType}');
        emit(MonthesError('Failed to fetch months. Unexpected response type.'));
      }
    } catch (error) {
      emit(MonthesError('Failed to fetch months: $error'));
    }

  }
}
