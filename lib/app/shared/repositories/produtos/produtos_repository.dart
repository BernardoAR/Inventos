import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'dart:convert';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
import 'package:inventos/app/shared/repositories/produtos/produtos_repository_interface.dart';
import 'package:http/http.dart' as http;
part 'produtos_repository.g.dart';

@Injectable()
class ProdutosRepository extends Disposable implements IProdutosRepository {
  Future fetchProdutos() async {
    final response =
        await http.get('${constants.baseUrl}/produto/pegaprodutos');
    List<ProdutoModel> lista = [];
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var i = 0; i < data.length; i++) {
        lista.add(ProdutoModel.fromJson(data[i]));
      }
    }
    return lista;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
