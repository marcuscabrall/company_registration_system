import 'package:s05_projeto/empresa.dart';
import 'package:s05_projeto/endereco.dart';
import 'package:s05_projeto/entradas.dart';
import 'dart:io';

import 'package:s05_projeto/pf.dart';

void main() {
  List<Empresa> listaDeEmpresas = [];
  Empresa empresa = Empresa(
    'Pães e Doces',
    '11941838000104',
    Endereco(
      '',
      '',
      '',
      '',
      '',
      '54430160',
    ),
    'Elisa e Flávia Pães e Doces ME',
    '19988380630',
    PessoaFisica(
      'Mirella Kamilly Letícia Barbosa',
      '76367980008',
      Endereco(
        '',
        '',
        '',
        '',
        '',
        '54430160',
      ),
    ),
  );
  listaDeEmpresas.add(empresa);
  // ignore: avoid_function_literals_in_foreach_calls
  listaDeEmpresas.forEach((e) => print(
      "\nID: ${e.id}\nCNPJ: ${Entradas.formataCNPJ(e.cnpj)} | Data Cadastro: ${e.dataCdastro}\nRazão Social: ${e.razaoSocial}\nNome Fantasia: ${e.nomeFantasia}\nTelefone: ${Entradas.formataTelefone(e.telefone!)}\nEndereço: ${e.enderecoPJ.logradouro}, ${e.enderecoPJ.numero}, ${e.enderecoPJ.bairro}, ${e.enderecoPJ.estado}, ${Entradas.formataCEP(e.enderecoPJ.cep)}\n${e.socio.infoSocio()}"));
  print("\n\nPressione enter para continuar...");
  stdin.readLineSync();
}
