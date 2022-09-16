import 'dart:convert';
import 'dart:io';
import 'package:s05_projeto/empresa.dart';
import 'package:s05_projeto/endereco.dart';
import 'package:s05_projeto/pf.dart';
import 'package:s05_projeto/pj.dart';
import 'package:s05_projeto/socio.dart';

abstract class Entradas {
  static String receba(String mensagem) {
    stdout.write(mensagem);
    String? entrada = stdin.readLineSync(encoding: utf8);
    if (entrada == null || entrada == "") {
      print("Informe um valor válido!");
      entrada = receba(mensagem);
    }
    return entrada;
  }

  static String verificaNumeros(String mensagem, [int lenght = 0]) {
    bool condicao = true;
    String numero = Entradas.receba(mensagem);

    while (condicao) {
      if (int.tryParse(numero) == null) {
        print('São permitidos apenas números ');
        numero = Entradas.receba(mensagem);
        if (lenght == 0) {
          return numero;
        }
      } else if (numero.toString().length < lenght) {
        stdout.write("Tamanho inválido! \n");
        numero = Entradas.receba(mensagem);
      } else {
        condicao = false;
      }
    }
    return numero;
  }

  static String formataCPF(String cpf) {
    return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';
  }

  static String formataCNPJ(String cnpj) {
    return '${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12, 14)}';
  }

  static String formataTelefone(String telefone) {
    return '(${telefone.substring(0, 2)}) ${telefone.substring(2, 3)} ${telefone.substring(3, 7)}-${telefone.substring(7, 11)}';
  }

  static String formataCEP(String cep) {
    return '${cep.substring(0, 2)}.${cep.substring(2, 5)}-${cep.substring(5, 8)}';
  }

  static Socio defineSocio() {
    String opcaoRecebe = receba(
        "Cadastro de Sócio: \nDigite PJ para Pessoa Jurídica ou PF para Pessoa Física: ");
    late Socio novoSocio;
    switch (opcaoRecebe.toUpperCase()) {
      case 'PJ':
        novoSocio = PessoaJuridica(
            Entradas.receba("Informe o Nome Fantasia: "),
            Entradas.verificaNumeros("Informe o CNPJ: ", 14),
            Endereco(
                Entradas.receba("Informe o Logradouro: "),
                Entradas.verificaNumeros("Informe o número: ", 0),
                Entradas.receba("Informe o complemento: "),
                Entradas.receba("Informe o bairro: "),
                Entradas.receba("Informe o estado: "),
                Entradas.verificaNumeros("Informe o CEP: ", 8)),
            Entradas.receba("Informe a Razão Social: "));
        break;
      case 'PF':
        novoSocio = PessoaFisica(
            Entradas.receba("Informe o Nome Completo: "),
            Entradas.verificaNumeros("Informe o CPF: ", 11),
            Endereco(
                Entradas.receba("Informe o Logradouro: "),
                Entradas.verificaNumeros("Informe o número: ", 0),
                Entradas.receba("Informe o complemento: "),
                Entradas.receba("Informe o bairro: "),
                Entradas.receba("Informe o estado: "),
                Entradas.verificaNumeros("Informe o CEP: ", 8)));
        break;
      default:
        print("Opção inválida!");
        defineSocio();
        break;
    }
    return novoSocio;
  }

  static void formataEmpresa(List<Empresa> listaDeEmpresas) {
    // ignore: avoid_function_literals_in_foreach_calls
    listaDeEmpresas.forEach((e) => infoEmpresa(e));
  }

  static void pressEnter() {
    print("Pressione enter para continuar...");
    stdin.readLineSync();
  }

  static infoEmpresa(Empresa empresa) {
    print(
        "\nID: ${empresa.id}\nCNPJ: ${Entradas.formataCNPJ(empresa.cnpj)} | Data Cadastro: ${empresa.dataCdastro}\nRazão Social: ${empresa.razaoSocial}\nNome Fantasia: ${empresa.nomeFantasia}\nTelefone: ${Entradas.formataTelefone(empresa.telefone!)}\nEndereço: ${empresa.enderecoPJ.logradouro}, ${empresa.enderecoPJ.numero}, ${empresa.enderecoPJ.bairro}, ${empresa.enderecoPJ.estado}, ${Entradas.formataCEP(empresa.enderecoPJ.cep)}\n${empresa.socio.infoSocio()}");
  }

  static List<Empresa> pegaListaOrdenada(List<Empresa> listaDeEmpresas) {
    List<Empresa> lista = listaDeEmpresas;
    lista.sort((a, b) => a.razaoSocial.compareTo(b.razaoSocial));
    return lista;
  }

  static void recebeDadosEmpresa(listaDeEmpresas) {
    Empresa empresa = Empresa(
        Entradas.receba("Informe o Nome Fantasia da Empresa: "),
        Entradas.verificaNumeros("Informe o CNPJ: ", 14),
        Endereco(
            Entradas.receba("Informe o Logradouro: "),
            Entradas.verificaNumeros("Informe o número: ", 0),
            Entradas.receba("Informe o complemento: "),
            Entradas.receba("Informe o bairro: "),
            Entradas.receba("Informe o estado: "),
            Entradas.verificaNumeros("Informe o CEP: ", 8)),
        Entradas.receba("Informe a Razão Social: "),
        Entradas.verificaNumeros("Informe o telefone: ", 11),
        Entradas.defineSocio());
    listaDeEmpresas.add(empresa);
  }

  static void consultaEmpresa(List<Empresa> listaDeEmpresas) {
    String recebeCNPJ =
        Entradas.verificaNumeros("Informe o CNPJ para pesquisar: ", 14);
    infoEmpresa(listaDeEmpresas.firstWhere((e) => e.cnpj == recebeCNPJ));
  }

  static void consultaSocio(List<Empresa> listaDeEmpresas) {
    String recebeCPFcNPJ = Entradas.verificaNumeros(
        "Informe o CPF/CNPJ do sócio para pesquisar: ");
    infoEmpresa(
        listaDeEmpresas.firstWhere((e) => e.socio.documento == recebeCPFcNPJ));
  }

  static void excluiID(List<Empresa> listaDeEmpresas) {
    String recebeID = Entradas.receba("Informe o ID para excluir: ");
    if (listaDeEmpresas.any((e) => e.id == recebeID)) {
      listaDeEmpresas
          .remove(listaDeEmpresas.firstWhere((e) => e.id == recebeID));
      print("Empresa removida com sucesso!");
      return;
    }
    print("Empresa não encontrada...");
  }
}
