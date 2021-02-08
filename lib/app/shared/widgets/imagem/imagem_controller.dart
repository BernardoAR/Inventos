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
  @observable
  File _imagem;
  @observable
  String _url;
  final picker = ImagePicker();
  @action
  Future pegaImagem() async {
    var imagemPegada = await picker.getImage(source: ImageSource.gallery);
    if (imagemPegada != null) _imagem = File(imagemPegada.path);
  }

  @action
  Future enviarImagemFirebase() async {
    try {
      // Make random image name.
      String nome = randomAlphaNumeric(16);
      String localizacao = 'uploads/produtos/$nome.jpg';
      // Upload image to firebase.
      var task = await firebase_storage.FirebaseStorage.instance
          .ref(localizacao)
          .putFile(_imagem);
      _url = await task.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.code);
    } catch (e) {
      print(e.message);
    }
  }

  get url => _url;
  get imagem => _imagem;
}
