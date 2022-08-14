class SimulationProductModel {
  late String name;
  late String serialNumber;
  late String type;

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
