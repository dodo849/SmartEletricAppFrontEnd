enum BuildType {
  debug,
  debugLocal,
  profile,
  release,
}

class Environment {

  static Environment? _instance;

  static Environment get instance {
    assert(_instance != null, 'Environment instance has not been initialized yet.');
    return _instance!;
  }

  final BuildType _buildType;

  static BuildType get buildType => instance._buildType;

  static String get apiURL {
    switch (buildType) {
      case BuildType.debugLocal:
        return ""; // If in debug local mode, inject mock repository in the DI.
      default:
        return "https://api.smartelectric.kr";
    }
  }

  Environment._internal(this._buildType);

  factory Environment.newInstance(BuildType buildType) {
    _instance ??= Environment._internal(buildType);
    return _instance!;
  }

  // 플레이버 기반의 환경 설정 초기화 메서드
  static void initialize(String flavor) {
    BuildType buildType;
    switch (flavor) {
      case 'Debug':
        buildType = BuildType.debug;
        break;
      case 'Debug-local':
        buildType = BuildType.debugLocal;
        break;
      case 'Profile':
        buildType = BuildType.profile;
        break;
      case 'Release':
        buildType = BuildType.release;
        break;
      default:
        buildType = BuildType.release; // 기본값 설정
    }
    Environment.newInstance(buildType);
  }
}