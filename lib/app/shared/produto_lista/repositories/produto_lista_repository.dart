import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/models/tipo_usuario_model.dart';
import 'package:inventos/app/shared/models/usuario_model.dart';
import 'package:inventos/app/shared/produto_lista/repositories/produto_lista_repository_interface.dart';

class ProdutoListaRepository implements IProdutoListaRepository {
  Future getProdutos() async {
    var url = 'http://192.168.0.108/produto/pegaprodutos';
    var response = await http.get(url);
    List<ProdutoModel> lista = [];
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var i = 0; i < data.length; i++) {
        lista.add(ProdutoModel.fromJson(data[i]));
      }
    }
    return lista;
  }
}
