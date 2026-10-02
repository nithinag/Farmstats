enum Environment {
  dev,
  prod,
  test
}

class AppEnvironment {
  static Environment current = Environment.dev;
}
