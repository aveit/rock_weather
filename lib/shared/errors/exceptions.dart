class ServerException implements Exception {
  final String errorTitle;
  final String errorMessage;

  const ServerException({
    this.errorTitle,
    this.errorMessage,
  });
}

class CacheException implements Exception {
  final String errorTitle;
  final String errorMessage;

  const CacheException({
    this.errorTitle,
    this.errorMessage,
  });
}
