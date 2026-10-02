class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class CacheException implements Exception {
  final String message;
  const CacheException(this.message);
}

class DataException implements Exception {
  final String message;
  const DataException(this.message);
}

class ValidationException implements Exception {
  final String message;
  const ValidationException(this.message);
}
