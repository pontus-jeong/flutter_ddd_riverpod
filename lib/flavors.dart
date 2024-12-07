enum Flavor {
  local,
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.local:
        return 'Example Local';
      case Flavor.development:
        return 'Example Development';
      case Flavor.production:
        return 'Example Production';
      default:
        return 'title';
    }
  }

  /// Defines the environment variables filename for each flavor
  static String get envFileName => '${appFlavor?.name}.config.json';
}
