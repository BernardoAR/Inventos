import 'package:inventos/app/shared/models/usuario_model.dart';

class EnderecoModel {
  final int id;
  final String uf;
  final String cidade;
  final String endereco;
  final String bairro;
  final String cep;
  final String referencia;
  final UsuarioModel usuario;
  EnderecoModel(
      {this.id,
      this.uf,
      this.cidade,
      this.endereco,
      this.bairro,
      this.cep,
      this.referencia,
      this.usuario});

  factory EnderecoModel.fromJson(Map<String, dynamic> json) {
    return EnderecoModel(
        id: int.parse(json['id']),
        uf: json['uf'],
        cidade: json['cidade'],
        endereco: json['endereco'],
        bairro: json['bairro'],
        cep: json['cep'],
        referencia: json['referencia'],
        usuario: UsuarioModel.fromJson(json['usuario']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['uf'] = this.uf;
    data['cidade'] = this.cidade;
    data['endereco'] = this.endereco;
    data['bairro'] = this.bairro;
    data['cep'] = this.cep;
    data['referencia'] = this.referencia;
    data['usuario'] = this.usuario.uid;
    return data;
  }
}
