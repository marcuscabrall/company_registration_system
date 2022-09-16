// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:s05_projeto/pj.dart';
import 'package:s05_projeto/socio.dart';
import 'package:uuid/uuid.dart';

class Empresa extends PessoaJuridica {
  final id = Uuid().v4();
  String? telefone;
  final dataCdastro = DateTime.now();
  final Socio socio;

  Empresa(super.nomeFantasia, super.cnpj, super.enderecoPJ, super.razaoSocial,
      this.telefone, this.socio);
}
