import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/model/BillSimulationProductModel.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillSimulationRepositoryInterface.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 요금 시뮬레이션 관련 레포지토리
class BillSimulationRepository implements BillSimulationRepositoryInterface {
  // - Inner
  Future<Database> getBillSimulationProductDB() async {
    // 데이터베이스를 열고 참조 값을 얻습니다.
    final Future<Database> database = openDatabase(
      // 데이터베이스 경로를 지정합니다. 참고: `path` 패키지의 `join` 함수를 사용하는 것이
      // 각 플랫폼 별로 경로가 제대로 생성됐는지 보장할 수 있는 가장 좋은 방법입니다.
      join(await getDatabasesPath(), 'sqlite.db'),

      onCreate: (db, version) {
        // 데이터베이스에 CREATE TABLE 수행
        return db.execute(
          "CREATE TABLE BillSimulationProduct(id INTEGER PRIMARY KEY AUTOINCREMENT, productName TEXT, modelName TEXT, typeKrName TEXT, typeEngName TEXT, monthPowerUsage DOUBLE)",
        );
      },
      // 버전을 설정하세요. onCreate 함수에서 수행되며 데이터베이스 업그레이드와 다운그레이드를
      // 수행하기 위한 경로를 제공합니다.
      version: 1,
    );

    return database;
  }

  // - Outer
  @override
  Future<Result<List<BillSimulationProductModel>, String>>
      getBillSimulationProduct() async {
    try {
      final Database db = await getBillSimulationProductDB();

      // 모든 billSimulationProduct를 얻기 위해 테이블에 질의합니다.
      List<Map<String, dynamic>> billSimulationProductsJson =
          await db.query('BillSimulationProduct');

      List<BillSimulationProductModel> billSimulationProductsModel =
          billSimulationProductsJson
              .map((element) => BillSimulationProductModel.fromJson(element))
              .toList();

      return Result.success(billSimulationProductsModel);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> saveBillSimulationProduct(
      {required BillSimulationProductModel billSimulationProduct}) async {
    try {
      final Database db = await getBillSimulationProductDB();

      await db.insert(
        'BillSimulationProduct',
        billSimulationProduct.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> deleteBillSimulationProduct(
      {required int id}) async {
    try {
      final Database db = await getBillSimulationProductDB();

      // 데이터베이스에서 Dog를 삭제합니다.
      await db.delete(
        'BillSimulationProduct',
        // 특정 dog를 제거하기 위해 `where` 절을 사용하세요
        where: "id = ?",
        // Dog의 id를 where의 인자로 넘겨 SQL injection을 방지합니다.
        whereArgs: [id],
      );

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }
}
