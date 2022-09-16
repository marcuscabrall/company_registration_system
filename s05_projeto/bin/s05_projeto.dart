import 'package:s05_projeto/endereco.dart';
import 'package:s05_projeto/empresa.dart';
import 'package:s05_projeto/entradas.dart';

void main() {
  List<Empresa> listaDeEmpresas = [];
  bool continuar = true;

  while (continuar) {
    print("\n====================|REGISTRO DE EMPRESAS|====================");
    print("| 1 - Cadastrar uma nova empresa                             |");
    print("| 2 - Buscar Empresa cadastrada por CNPJ                     |");
    print("| 3 - Buscar Empresa por CPF/CNPJ do Sócio                   |");
    print("| 4 - Listar Empresas cadastradas em ordem alfabética        |");
    print("| 5 - Excluir uma empresa (por ID)                           |");
    print("| 6 - Sair                                                   |");
    print("==============================================================\n");
    int opcaoMenu = int.parse(
        Entradas.verificaNumeros("Informe o número da opção desejada: ", 0));
//Empresa(nomeFantasia, cnpj, enderecoPJ, razaoSocial, telefone);
    switch (opcaoMenu) {
      case 1:
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
        break;
      case 2:
        Entradas.consultaEmpresa(listaDeEmpresas);
        Entradas.pressEnter();
        break;
      case 3:
        Entradas.consultaSocio(listaDeEmpresas);
        Entradas.pressEnter();
        break;
      case 4:
        Entradas.pegaListaOrdenada(listaDeEmpresas);
        Entradas.formataEmpresa(listaDeEmpresas);
        Entradas.pressEnter();
        break;
      case 5:
        Entradas.excluiID(listaDeEmpresas);
        Entradas.pressEnter();
        break;
      case 6:
        print("Encerrando o programa...");
        continuar = false;
        break;
      default:
        print("\n>>> Opção inválida! <<<");
        Entradas.pressEnter();
        break;
    }
  }
}
