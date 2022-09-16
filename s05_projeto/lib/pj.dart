import 'package:s05_projeto/endereco.dart';
import 'package:s05_projeto/entradas.dart';
import 'package:s05_projeto/socio.dart';

class PessoaJuridica extends Socio {
  String cnpj;
  String razaoSocial;
  String nomeFantasia;
  Endereco enderecoPJ;
  @override
  String infoSocio() {
    return 'Sócio:\nCNPJ: ${Entradas.formataCNPJ(cnpj)}\nRazão Social: $razaoSocial\nNome Fantasia: $nomeFantasia\nEndereço: ${enderecoPJ.logradouro}, ${enderecoPJ.numero}, ${enderecoPJ.complemento}, ${enderecoPJ.bairro}/${enderecoPJ.estado}, ${Entradas.formataCEP(enderecoPJ.cep)}\n';
  }

  PessoaJuridica(
    this.nomeFantasia,
    this.cnpj,
    this.enderecoPJ,
    this.razaoSocial,
  ) : super(nomeFantasia, cnpj, enderecoPJ);
}
