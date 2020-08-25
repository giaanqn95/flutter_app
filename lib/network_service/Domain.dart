
enum Domain {
  DEV,
  STAGING,
}

extension DomainExtensionMap on Domain{
  static const valuesMap = const{
    Domain.DEV: "a",
    Domain.STAGING: "a",
  };

  String get values => valuesMap[this];
}