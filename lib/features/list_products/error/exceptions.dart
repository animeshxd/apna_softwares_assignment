class ServerException implements Exception {}

class ConnectionException implements Exception {}

class JSONSerializeModelFailedException implements Exception {
  JSONSerializeModelFailedException(this.json);
  Map json;

  @override
  String toString() {
    return "JSONSerializeModelFailedException: $json";
  }
}
