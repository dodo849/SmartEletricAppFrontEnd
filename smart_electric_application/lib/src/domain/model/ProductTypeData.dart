import 'package:smart_electric_application/src/domain/model/ProductTypeModel.dart';

/// 가전 제품 분류 종류
class ProductTypeData {
// 싱글톤 패턴 구현 :
  // private constructor ( ._() ) 를 이용해
  // 외부에서 인스턴스를 생성할 수 없도록 한다
  ProductTypeData._() {
    // 클래스 최초 생성 시 초기화 코드
  }

  // 첫 인스턴스 생성
  static final ProductTypeData _instance = ProductTypeData._();

  // 인스턴스가 생성되어있으면 생성되어있는 인스턴스를 반환한다
  factory ProductTypeData() => _instance;

  static final productTypes = <ProductTypeModel>[
    ProductTypeModel(krName: "에어컨", engName: "ac"),
    ProductTypeModel(krName: "냉장고", engName: "fridge"),
    ProductTypeModel(krName: "정수기", engName: "waterpurifier"),
    ProductTypeModel(krName: "컴퓨터", engName: "pc"),
    ProductTypeModel(krName: "세탁기", engName: "washingmachine"),
    ProductTypeModel(krName: "전등", engName: "lamp"),
    ProductTypeModel(krName: "공기청정기", engName: "airpurifier"),
    ProductTypeModel(krName: "TV", engName: "tv"),
    ProductTypeModel(krName: "청소기", engName: "cleaner"),
    ProductTypeModel(krName: "드라이기", engName: "dryer"),
    ProductTypeModel(krName: "전자레인지", engName: "microwave"),
    ProductTypeModel(krName: "에어프라이기", engName: "airfryer"),
    ProductTypeModel(krName: "전기밥솥", engName: "ricecooker"),
    ProductTypeModel(krName: "식기세척기", engName: "dishwasher"),
    ProductTypeModel(krName: "온열기", engName: "warmer"),
    ProductTypeModel(krName: "선풍기", engName: "fan"),
    ProductTypeModel(krName: "제습기", engName: "dehumidifier"),
    ProductTypeModel(krName: "건조기", engName: "dry"),
  ];
}
