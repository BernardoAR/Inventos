import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inventos/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:inventos/app/shared/models/tipo_usuario_model.dart';
import 'package:inventos/app/shared/models/usuario_model.dart';
import 'package:inventos/app/shared/repositories/usuarios/usuarios_repository.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UsuariosRepository _usuariosRepository = Modular.get();
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
      await _usuariosRepository.insereAtualizaUsuario(UsuarioModel(
          uid: _auth.currentUser.uid,
          nome: nome,
          tipoUsuario: TipoUsuarioModel(id: 1)));
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
    return await _auth.signInWithEmailAndPassword(
        email: email, password: senha);
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
  Future get user async => _auth.currentUser;
  @override
  Future resetPassword({email}) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future getLogOut() {
    return _auth.signOut();
  }
}
