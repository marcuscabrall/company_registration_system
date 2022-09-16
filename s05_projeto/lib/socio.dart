import 'package:s05_projeto/endereco.dart';

abstract class Socio {
  String nome;
  String documento;
  Endereco endereco;

  Socio(this.nome, this.documento, this.endereco);

  infoSocio() {}
}
