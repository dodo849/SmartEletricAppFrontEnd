// 절약 팁 분류 종류

class SavingTipTypeModel {
  late String krName; // 분류 한글명 ex. 에어컨, 청소기
  late String engName; // 아이콘(영어명) ex. ac, cleaner

  SavingTipTypeModel(
      {required String krName,
      required String engName}) {
    this.krName = krName;
    this.engName = engName;
  }
}