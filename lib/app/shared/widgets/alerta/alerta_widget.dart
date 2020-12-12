import 'package:flutter/material.dart';

// Widget de alerta para ser mais fácil chamar
class AlertaWidget extends StatefulWidget {
  final String titulo;
  final String conteudo;
  final List<Widget> widgets;
  const AlertaWidget({Key key, this.titulo, this.conteudo, this.widgets})
      : super(key: key);
  @override
  _AlertaWidgetState createState() => _AlertaWidgetState();
}

class _AlertaWidgetState extends State<AlertaWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titulo ?? ''),
      content: Text(widget.conteudo ?? ''),
      actions: <Widget>[
        // define os botões na base do dialogo
        widget.widgets ??
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
      ],
    );
  }
}
