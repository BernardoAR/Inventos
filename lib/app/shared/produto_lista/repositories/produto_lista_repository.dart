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
    List parsedList = jsonDecode(response.body);
    print(parsedList);
    print(parsedList[0].usuarioModel);
    // Todo: Continuar daqui
    // List<ProdutoModel> list =
    //     parsedList.map((val) => SignUpResponse.fromJson(val)).toList();
    return parsedList;
  }
}
