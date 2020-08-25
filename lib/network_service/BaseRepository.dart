
class MyState {
  MyState._();

  factory MyState.success(String foo) = MySuccessState;
  factory MyState.error(String foo) = MyErrorState;
}

class MyErrorState extends MyState {
  MyErrorState(this.msg): super._();

  final String msg;
}

class MySuccessState extends MyState {
  MySuccessState(this.value): super._();

  final String value;
}

//TODO: Làm sealed class cho call api