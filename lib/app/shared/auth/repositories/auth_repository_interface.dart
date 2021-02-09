abstract class IAuthRepository {
  Future get user;
  Future getGoogleLogin();
  Future createEmailPasswordLogin({email, senha, nome});
  Future getEmailPasswordLogin({email, senha});
  Future<String> getToken();
  Future resetPassword({email});
  Future getLogOut();
  Future estaLogadoGoogle();
  Future updateProfile({url, nome, email, senha, novaSenha});
}
