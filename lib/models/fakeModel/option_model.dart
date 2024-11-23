class FakeVerificationMethodOptionModel {
  String name;
  String id;
  FakeVerificationMethodOptionModel({
    required this.name,
    required this.id,
  });
}

class OptionModel {
  String viewAbleName;
  String value;
  OptionModel({
    this.viewAbleName = '',
    this.value = '',
  });
}

class GuestPlaceOptionModel {
  String viewAbleName;
  String des;
  String localSVGImageLocation;
  String value;
  GuestPlaceOptionModel({
    this.viewAbleName = '',
    this.value = '',
    this.des = '',
    this.localSVGImageLocation = '',
  });
}

class BestPlaceOptionModel {
  String viewAbleName;
  String localSVGImageLocation;
  String value;

  BestPlaceOptionModel({
    this.viewAbleName = '',
    this.value = '',
    this.localSVGImageLocation = '',
  });
}

class FirstReservationOptionModel {
  String viewAbleName;
  String value;
  String des;
  FirstReservationOptionModel({
    this.viewAbleName = '',
    this.value = '',
    this.des = '',
  });
}
