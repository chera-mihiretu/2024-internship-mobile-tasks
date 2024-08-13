class AppData {
  static const String sharedProduct = 'my_shared_products';
  static const String baseUrl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1';
  static const String allProductUrl = '$baseUrl/products';
  static const Map<String, String> jsonHeader = {
    'Content-Type': 'application/json'
  };
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';

  /// The following are error messages

  static const int cacheError = 1001;
  static const int serverError = 1002;
  static const int connectionError = 1003;
  static const int successInsert = 1004;
  static const int successUpdate = 1005;
  static const int successDelete = 1006;

  static const Map<int, String> message = {
    cacheError: 'Caching Failed',
    connectionError: 'No Internet Connection',
    serverError: 'Server request failed',
    successDelete: 'Successfully Deleted',
    successInsert: 'Successfully inserted',
    successUpdate: 'Successfully Update',
  };

  static const Map<String, int> methodInt = {
    post: successInsert,
    put: successUpdate,
    delete: successDelete
  };

  static int getCorrespondingSuccess(String method) {
    return methodInt[method]!;
  }

  static String getMessage(int code) {
    return message[code]!;
  }
}
