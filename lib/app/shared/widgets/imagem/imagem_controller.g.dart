// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagem_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ImagemController = BindInject(
  (i) => ImagemController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImagemController on _ImagemControllerBase, Store {
  final _$_imagemAtom = Atom(name: '_ImagemControllerBase._imagem');

  @override
  File get _imagem {
    _$_imagemAtom.reportRead();
    return super._imagem;
  }

  @override
  set _imagem(File value) {
    _$_imagemAtom.reportWrite(value, super._imagem, () {
      super._imagem = value;
    });
  }

  final _$_urlAtom = Atom(name: '_ImagemControllerBase._url');

  @override
  String get _url {
    _$_urlAtom.reportRead();
    return super._url;
  }

  @override
  set _url(String value) {
    _$_urlAtom.reportWrite(value, super._url, () {
      super._url = value;
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

    ''';
  }
}
