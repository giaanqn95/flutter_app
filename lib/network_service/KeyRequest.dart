enum KeyRequest {
  GET_SOMETHING
}

extension KeyExtensionMap on KeyRequest{
  static const valuesMap = const{
    KeyRequest.GET_SOMETHING: "a",
  };

  String get values => valuesMap[this];
}
