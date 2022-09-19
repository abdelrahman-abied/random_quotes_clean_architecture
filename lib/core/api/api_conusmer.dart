abstract class ApiConsumer {
  //GET METHOD
  Future<dynamic> get(path, {Map<String, dynamic>? queryParams});
  //POST METHOD
  Future<dynamic> post(
    path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  );
}
