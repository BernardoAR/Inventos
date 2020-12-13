abstract class IAuthRepository {
  Future getUser();
  Future getGoogleLogin();
  Future createEmailPasswordLogin({email, senha, nome});
  Future getEmailPasswordLogin({email, senha});
  Future<String> getToken();
  Future getLogOut();
}
