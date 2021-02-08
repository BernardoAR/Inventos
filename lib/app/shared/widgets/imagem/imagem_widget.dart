import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/imagem/imagem_controller.dart';

class ImagemWidget extends StatefulWidget {
  const ImagemWidget({Key key}) : super(key: key);
  @override
  _ImagemWidgetState createState() => _ImagemWidgetState();
}

class _ImagemWidgetState extends ModularState<ImagemWidget, ImagemController> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Observer(builder: (_) {
      return Column(children: [
        Container(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: controller.imagem != null
              ? InkWell(
                  onTap: controller.pegaImagem,
                  child: Image.file(
                    controller.imagem,
                    height: mediaQuery.size.height * 0.35,
                    width: mediaQuery.size.width * 0.8,
                  ))
              : RaisedButton(
                  onPressed: controller.pegaImagem,
                  child: Icon(Icons.add_a_photo)),
        ))
      ]);
    });
  }
}
