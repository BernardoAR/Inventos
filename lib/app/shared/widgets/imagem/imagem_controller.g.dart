// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagem_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ImagemController = BindInject(
  (i) => ImagemController(caminho: i<String>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImagemController on _ImagemControllerBase, Store {
  final _$imagemAtom = Atom(name: '_ImagemControllerBase.imagem');

  @override
  File get imagem {
    _$imagemAtom.reportRead();
    return super.imagem;
  }

  @override
  set imagem(File value) {
    _$imagemAtom.reportWrite(value, super.imagem, () {
      super.imagem = value;
    });
  }

  final _$urlAtom = Atom(name: '_ImagemControllerBase.url');

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  final _$onlineAtom = Atom(name: '_ImagemControllerBase.online');

  @override
  bool get online {
    _$onlineAtom.reportRead();
    return super.online;
  }

  @override
  set online(bool value) {
    _$onlineAtom.reportWrite(value, super.online, () {
      super.online = value;
    });
  }

  final _$pegaImagemAsyncAction =
      AsyncAction('_ImagemControllerBase.pegaImagem');

  @override
  Future<dynamic> pegaImagem() {
    return _$pegaImagemAsyncAction.run(() => super.pegaImagem());
  }

  final _$enviarImagemFirebaseAsyncAction =
      AsyncAction('_ImagemControllerBase.enviarImagemFirebase');

  @override
  Future<dynamic> enviarImagemFirebase() {
    return _$enviarImagemFirebaseAsyncAction
        .run(() => super.enviarImagemFirebase());
  }

  @override
  String toString() {
    return '''
imagem: ${imagem},
url: ${url},
online: ${online}
    ''';
  }
}
