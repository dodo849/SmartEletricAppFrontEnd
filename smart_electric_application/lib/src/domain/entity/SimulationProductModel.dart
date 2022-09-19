// 사용자가 추가한 시뮬레이션 가전 정보

class SimulationProductModel {
  late String name; // 가전명
  late String serialNumber; // 시리얼 넘버
  late String type; // 타입 ex. ac, dry, cleaner ...

  SimulationProductModel(
      {required String name,
      required String serialNumber,
      required String type}) {
    this.name = name;
    this.serialNumber = serialNumber;
    this.type = type;
  }

  // factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  // Map<String, dynamic> toJson() => _$PostToJson(this);

  // @override
  // String toString() {
  //   return "Post id [${id}] title: $title";
  // }
}
