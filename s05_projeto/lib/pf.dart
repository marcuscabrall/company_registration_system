import 'package:s05_projeto/endereco.dart';
import 'package:s05_projeto/entradas.dart';
import 'package:s05_projeto/socio.dart';

class PessoaFisica extends Socio {
  String cpf;
  String nomeCompleto;
  Endereco enderecoPF;
  @override
  String infoSocio() {
    return 'Sócio:\nCPF: ${Entradas.formataCPF(cpf)}\nNome Completo: $nomeCompleto\nEndereço: ${enderecoPF.logradouro}, ${enderecoPF.numero}, ${enderecoPF.complemento}, ${enderecoPF.bairro}/${enderecoPF.estado}, ${Entradas.formataCEP(enderecoPF.cep)}\n';
  }

  PessoaFisica(this.nomeCompleto, this.cpf, this.enderecoPF)
      : super(nomeCompleto, cpf, enderecoPF);
}
