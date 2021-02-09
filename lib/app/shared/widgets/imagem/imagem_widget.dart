import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:inventos/app/shared/widgets/imagem/imagem_controller.dart';

class ImagemWidget extends StatefulWidget {
  final ImagemController imagemController;
  const ImagemWidget({
    Key key,
    this.imagemController,
  }) : super(key: key);
  @override
  _ImagemWidgetState createState() => _ImagemWidgetState();
}

class _ImagemWidgetState extends State<ImagemWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Observer(builder: (_) {
      return Column(children: [
        Container(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: (widget.imagemController.url != null ||
                  widget.imagemController.imagem != null)
              ? InkWell(
                  onTap: widget.imagemController.pegaImagem,
                  child: widget.imagemController.online == false
                      ? (widget.imagemController.imagem != null)
                          ? Image.file(
                              widget.imagemController.imagem,
                              height: mediaQuery.size.height * 0.35,
                              width: mediaQuery.size.width * 0.8,
                            )
                          : RaisedButton(
                              onPressed: widget.imagemController.pegaImagem,
                              child: Icon(Icons.add_a_photo))
                      : Image.network(
                          widget.imagemController.url,
                          height: mediaQuery.size.height * 0.35,
                          width: mediaQuery.size.width * 0.8,
                        ))
              : RaisedButton(
                  onPressed: widget.imagemController.pegaImagem,
                  child: Icon(Icons.add_a_photo)),
        ))
      ]);
    });
  }
}
