abstract class IAuthRepository {
  Future getUser();
  Future getGoogleLogin();
  Future createEmailPasswordLogin({email, senha, nome});
  Future<String> getToken();
  Future getLogOut();
}
