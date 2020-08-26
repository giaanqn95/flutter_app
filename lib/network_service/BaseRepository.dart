import 'package:flutter_app/model/BaseResponse.dart';


class LoadingState extends StateRepository {
  final bool isLoading;

  LoadingState(this.isLoading);
}

class SuccessState extends StateRepository {
  final BaseResponse baseResponse;

  SuccessState(this.baseResponse);
}

class ErrorState extends StateRepository {
  final String error;

  ErrorState(this.error);
}

abstract class StateRepository {
  T use<T>(T Function(LoadingState) useLoadingState,
      T Function(SuccessState) useChooseAccountState,
      T Function(ErrorState) useImportingState) {
    if (this is LoadingState) {
      return useLoadingState(this);
    }
    if (this is SuccessState) {
      return useChooseAccountState(this);
    }
    if (this is ErrorState) {
      return useImportingState(this);
    }
    throw Exception('Invalid state');
  }
}