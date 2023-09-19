import 'package:lume_ox_app/data/remote/api_client.dart';
import 'package:lume_ox_app/data/remote/api_contracts.dart';
import 'package:lume_ox_app/data/remote/api_endpoints.dart';
import 'package:lume_ox_app/repository/auth/auth_repo_contracts.dart';

class AuthRepo extends AuthRepoContracts {
  final APIContracts _apiServices = APIClient();

  @override
  Future signOff(String userID) async {
    try {
      dynamic response = await _apiServices.signOff(APIEndPoints().signOffURL, userID);
      return response;
    } catch(e) {
      rethrow;
    }
  }

  @override
  Future signOn(String username, String password) async {
    try {
      dynamic response = await _apiServices.signOn(APIEndPoints().signInURL, username, password);
      return response;
    } catch(e) {
      rethrow;
    }
  }

}