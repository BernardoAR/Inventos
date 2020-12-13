import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inventos/app/shared/auth/repositories/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future createEmailPasswordLogin({email, senha, nome}) async {
    // Verifica se deu algum erro
    bool temErro = false;
    String texto = '';
    try {
      // Cria o usuário com o email e a senha
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      // Atualiza os dados do perfil
      await _auth.currentUser.updateProfile(displayName: nome);
      // Envia o e-mail de verificação
      await _auth.currentUser.sendEmailVerification();
      // Cadastra ou atualiza o usuário

    } on FirebaseAuthException catch (e) {
      temErro = true;
      if (e.code == 'weak-password') {
        texto += 'A senha é muito fraca.';
      } else if (e.code == 'email-already-in-use') {
        texto += 'Uma conta já existe com esse email.';
      }
    }
    return {'temErro': temErro, 'texto': texto};
  }

  @override
  Future getEmailPasswordLogin({email, senha}) async {
    // Verifica se deu algum erro
    bool temErro = false;
    String texto = '';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: email);
    } on FirebaseAuthException catch (e) {
      temErro = true;
      if (e.code == 'user-not-found') {
        texto += 'E-mail não encontrado.';
      } else if (e.code == 'wrong-password') {
        texto += 'Senha incorreta.';
      }
    }
    return {'temErro': temErro, 'texto': texto};
  }

  @override
  Future getGoogleLogin() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getUser() async {
    return _auth.currentUser;
  }

  @override
  Future getLogOut() {
    return _auth.signOut();
  }
}
