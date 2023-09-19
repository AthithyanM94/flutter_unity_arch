abstract class APIContracts {
  final String baseURL = "";

  Future<dynamic> signOn(String url, String username, String password);
  Future<dynamic> signOff(String url, String userID);

}