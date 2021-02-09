import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:random_string/random_string.dart';
part 'imagem_controller.g.dart';

@Injectable()
class ImagemController = _ImagemControllerBase with _$ImagemController;

abstract class _ImagemControllerBase with Store {
  final String caminho;
  @observable
  File imagem;
  @observable
  String url;
  @observable
  bool online = false;

  final picker = ImagePicker();

  _ImagemControllerBase({this.caminho});

  @action
  Future pegaImagem() async {
    this.online = false;
    var imagemPegada = await picker.getImage(source: ImageSource.gallery);
    if (imagemPegada != null) imagem = File(imagemPegada.path);
  }

  @action
  Future enviarImagemFirebase() async {
    try {
      // Make random image name.
      String nome = randomAlphaNumeric(16);
      String localizacao = '${this.caminho}/$nome.jpg';
      // Upload image to firebase.
      var task = await firebase_storage.FirebaseStorage.instance
          .ref(localizacao)
          .putFile(imagem);
      url = await task.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.code);
    } catch (e) {
      print(e.message);
    }
  }
}
