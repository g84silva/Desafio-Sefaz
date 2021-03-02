#Desafio Sefaz - Pitang
--------
>O presente projeto tem como objetivo atender as especificações descritas no documento referente ao processo seletivo, para vaga de desenvolvedor Java júnior, alocada na Secretaria da Fazendo de Pernambuco - Sefaz-PE.

####Ferramentas utilizadas:
------
- [Eclipse][1] Java EE IDE version: 2020-03 (4.15.0) 
>Como de ambiente de desenvolvimento do projeto;
- Jboss [WildFly][2] version: 19.0.0. Final – Java EE Full & Web Distribution
>Na condição de Container Server para a aplicação Java Web;
- Apache [Maven][3]
>Responsável pelo: download, gerenciamento, compilação e controle das dependências;
- [MySQL][4] Workbench version: 8.0.19 CE (64-bits)
>Banco de dados relacional utilizado na aplicação;
- [Bootstrap][5]  version: 4.0
>Integrando JQuerry e estilizações em CSS as layout visual do sistema.

####A aplicação:
-----
Tendo o roteiro do desafio técnico como base, o sistema segue as especificações descritas no desafio ao apresentar estruturação em camadas, no modelo MVC, e sendo capaz de:
- Cadastrar um usuário;
- Efetuar login e logout do usuário no sistema;
- Listar usuários cadastrados;
- Cadastrar telefones ao usuário cadastrado;
- Listar telefones por usuário;
- Alterar/atualizar nome, email, senha e telefone do usuário que está logado;
- Excluir telefones do usuário logado;
- Excluir usuário logado;

####Adição realizada no desenvolvimento do sistema:
------
- Controle do fluxo da aplicação com a utilização de filters;

####Considerações:
-----
>O projeto descrito atende a todos os requisitos obrigatórios do desafio. Em relação aos requisitos obrigatórios, utiliza o Web Container WildFly. A aplicação encontra-se na primeira versão de seu desenvolvimento, estando passível a pontos de melhorias, implementações de funções e expansões. 

[1]: https://www.eclipse.org/downloads/ "Eclipse"
[2]: https://www.wildfly.org/downloads/ "WildFly"
[3]: https://maven.apache.org/download.cgi "Maven"
[4]: https://www.mysql.com/products/workbench/ "MySQL"
[5]: https://getbootstrap.com/docs/4.0/getting-started/introduction/ "Bootstrap"
