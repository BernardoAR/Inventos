abstract class IAuthRepository {
  Future getUser();
  Future getGoogleLogin();
  Future getFacebookLogin();
  Future getEmailPasswordLogin();
  Future<String> getToken();
  Future getLogOut();
}
