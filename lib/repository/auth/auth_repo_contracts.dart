abstract class AuthRepoContracts {
  Future<dynamic> signOn(String username, String password);

  Future<dynamic> signOff(String userID);
}
