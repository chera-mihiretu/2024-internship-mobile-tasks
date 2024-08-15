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
  //! validation errors
  static const int invalidPriceCharacter = 2000;
  static const int negativePrice = 2001;
  static const int invalidName = 2002;

  static const Map<int, String> message = {
    cacheError: 'Caching Failed',
    connectionError: 'No Internet Connection',
    serverError: 'Server request failed',
    successDelete: 'Successfully Deleted',
    successInsert: 'Successfully inserted',
    successUpdate: 'Successfully Update',
    invalidPriceCharacter: 'Price can not contain character',
    negativePrice: 'Price can not be negative',
    invalidName: 'Name can not contain character'
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

  static const String imageUrl =
      'https://static.nike.com/a/images/f_auto/dpr_3.0,cs_srgb/w_363,c_limit/83e721fb-4f3f-44d5-ae11-5ef19006fd93/best-running-shoes-for-walking-by-nike.jpg';
}
