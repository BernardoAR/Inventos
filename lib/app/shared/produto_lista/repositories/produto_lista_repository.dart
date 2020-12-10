import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/produto_lista/repositories/produto_lista_repository_interface.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;

class ProdutoListaRepository implements IProdutoListaRepository {
  Future getProdutos() async {
    var url = '${constants.baseUrl}/produto/pegaprodutos';
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
