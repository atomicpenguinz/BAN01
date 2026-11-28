#set document(title: "Dicionário de Dados")
#set page(paper: "a4", margin: 2cm)
#set text(size: 10pt)

#let entidade(nome, celulas) = {
  heading(level: 2)[#nome]
  table(
    columns: (2fr, 1fr, 1fr, 2fr, 3fr),
    [*Atributo*], [*Tipo*], [*Tamanho*], [*RI*], [*Descrição*],
    ..celulas,
  )
}

= Dicionário de Dados

#entidade("Animal", (
  [id_animal], [Numérico], [], [chave primária], [Identificador do animal],
  [dataNascimento], [Data], [], [], [Data de nascimento],
  [nomeProprio], [Texto], [50], [Opcional], [Nome próprio do animal],
  [id_especie], [Numérico], [], [chave estrangeira de Espécie], [Espécie à qual o animal pertence],
  [dataEntradaRecinto], [Data], [], [], [Data de entrada no recinto],
  [id_recinto], [Numérico], [], [chave estrangeira de Recinto], [Recinto atual do animal],
))

#entidade("Recinto", (
  [id_recinto], [Numérico], [], [chave primária], [Identificador do recinto],
  [localizacao], [Texto], [50], [], [Localização do recinto dentro do zoológico],
  [capacidade], [Numérico], [], [], [Capacidade máxima do recinto],
))

#entidade("Terrestre", (
  [id_recinto], [Numérico], [], [chave primária e estrangeira de Recinto], [Identificador do recinto terrestre; chave herdada de Recinto],
  [area], [Numérico], [], [], [Área (m²) do recinto terrestre],
  [biomaEmulado], [Texto], [30], [], [Bioma emulado no recinto],
))

#entidade("Aquário", (
  [id_recinto], [Numérico], [], [chave primária e estrangeira de Recinto], [Identificador do aquário; chave herdada de Recinto],
  [tipoAgua], [Texto], [7], [Tipos possíveis: doce, salgada e salobra], [Tipo de água do aquário],
  [temperatura], [Numérico], [], [], [Temperatura mantida no aquário],
))

#entidade("ResponsabilidadeRecinto", (
  [id_pessoa], [Numérico], [], [chave primária e estrangeira de Pessoa], [Pessoa responsável pelo recinto],
  [id_recinto], [Numérico], [], [chave primária e estrangeira de Recinto], [Recinto sob responsabilidade],
))

#entidade("Pessoa", (
  [id_pessoa], [Numérico], [], [chave primária], [Identificador da pessoa],
  [cpf], [Texto], [11], [], [CPF da pessoa],
  [telefone], [Texto], [20], [], [Telefone de contato],
  [nome], [Texto], [100], [], [Nome completo da pessoa],
))

#entidade("Funcionario", (
  [id_pessoa], [Numérico], [], [chave primária e estrangeira de Pessoa], [Identificador do funcionário; chave herdada de Pessoa],
  [salario], [Numérico], [], [], [Salário do funcionário],
  [funcao], [Texto], [50], [], [Função exercida pelo funcionário],
))

#entidade("Visitante", (
  [id_pessoa], [Numérico], [], [chave primária e estrangeira de Pessoa], [Identificador do visitante; chave herdada de Pessoa],
  [dataNascimento], [Data], [], [], [Data de nascimento do visitante],
  [dataCadastro], [Data], [], [], [Data de cadastro do visitante],
))

#entidade("ResponsavelPorVisitante", (
  [id_responsavel], [Numérico], [], [chave primária e estrangeira de Visitante], [Visitante responsável],
  [id_visitante], [Numérico], [], [chave primária e estrangeira de Visitante], [Visitante sob responsabilidade],
))

#entidade("Ingresso", (
  [id_pessoa], [Numérico], [], [chave primária e estrangeira de Pessoa], [Pessoa associada ao ingresso],
  [id_visita], [Numérico], [], [chave primária e estrangeira de Visita], [Visita associada ao ingresso],
))

#entidade("Visita", (
  [id_visita], [Numérico], [], [chave primária], [Identificador da visita],
  [dataHora], [Data e hora], [], [], [Data e horário da visita],
  [visitaGuiada], [Booleano], [], [], [Indica se a visita é guiada],
  [qtdPessoas], [Numérico], [], [], [Quantidade de pessoas na visita],
  [id_funcionarioGuia], [Numérico], [], [chave estrangeira de Funcionario; Só deve existir caso visitaGuiada seja True; O Funcionário deve ter a função Guia],
                        [Funcionário responsável por guiar a visita],
))

#entidade("Veterinario", (
  [id_pessoa], [Numérico], [], [chave primária e estrangeira de Funcionario], [Identificador do veterinário; chave herdada de Funcionário],
  [CRMV], [Texto], [10], [], [Registro profissional no CRMV],
  [especialidade], [Texto], [30], [], [Especialidade do veterinário],
))

#entidade("Consulta", (
  [id_consulta], [Numérico], [], [chave primária], [Identificador da consulta],
  [id_animal], [Numérico], [], [chave estrangeira de Animal], [Animal atendido],
  [id_veterinario], [Numérico], [], [chave estrangeira de Veterinario], [Veterinário responsável pela consulta],
  [data], [Data], [], [], [Data da consulta],
  [diagnostico], [Texto], [100], [], [Diagnóstico da consulta],
))

#entidade("Prescrição", (
  [id_consulta], [Numérico], [], [chave primária e estrangeira de Consulta], [Consulta à qual a prescrição pertence],
  [id_medicamento], [Numérico], [], [chave primária e estrangeira de Medicamento], [Medicamento prescrito],
  [dosagem], [Texto], [20], [], [Dosagem prescrita],
  [duracao], [Texto], [20], [], [Duração do tratamento],
  [frequencia], [Texto], [20], [], [Frequência de administração],
))

#entidade("Medicamento", (
  [id_medicamento], [Numérico], [], [chave primária], [Identificador do medicamento],
  [nome], [Texto], [50], [], [Nome do medicamento],
  [fabricante], [Texto], [50], [], [Fabricante do medicamento],
  [dataValidade], [Data], [], [], [Data de validade do medicamento],
))

#entidade("Especie", (
  [id_especie], [Numérico], [], [chave primária], [Identificador da espécie],
  [nomeCientifico], [Texto], [50], [], [Nome científico da espécie],
  [expectativaVida], [Numérico], [], [], [Expectativa de vida da espécie],
  [habitatNatural], [Texto], [30], [], [Habitat natural da espécie],
))

#entidade("NomePopular", (
  [id_especie], [Numérico], [], [chave estrangeira de Especie], [Espécie associada ao nome popular],
  [id_nomePopular], [Numérico], [], [chave primária], [Identificador do nome popular],
  [nomePopular], [Texto], [30], [], [Nome popular da espécie],
))

#entidade("EspeciesCompativeis", (
  [id_especie1], [Numérico], [], [chave primária e estrangeira de Especie], [Primeira espécie do par compatível],
  [id_especie2], [Numérico], [], [chave primária e estrangeira de Especie], [Segunda espécie do par compatível],
))

#entidade("Restricoes", (
  [id_especie1], [Numérico], [], [chave estrangeira de espécie], [Primeira espécie relacionada à restrição],
  [id_especie2], [Numérico], [], [chave estrangeira de espécie], [Segunda espécie relacionada à restrição],
  [id_restricao], [Numérico], [], [chave primária], [Identificador da restrição],
  [restricao], [Texto], [50], [], [Descrição da restrição entre as espécies],
))

#entidade("Aquatica", (
  [id_especie], [Numérico], [], [chave primária e estrangeira de Especie], [Identificador da espécie aquática; chave herdada de Espécie],
  [tipoAgua], [Texto], [7], [Tipos possíveis: doce, salgada e salobra], [Tipo de água adequado à espécie],
  [temperaturaMinima], [Numérico], [], [], [Temperatura mínima adequada à espécie],
  [temperaturaMaxima], [Numérico], [], [], [Temperatura máxima adequada à espécie],
))

#entidade("Dieta", (
  [id_dieta], [Numérico], [], [chave primária], [Identificador da dieta],
  [classificacao], [Texto], [13], [Quatro tipos: carnívora, herbívora, onívora e especializada], [Classificação da dieta],
  [frequencia], [Texto], [20], [], [Frequência da dieta],
  [id_especie], [Numérico], [], [chave estrangeira de Especie], [Espécie à qual a dieta se aplica],
))

#entidade("ComposicaoDieta", (
  [id_dieta], [Numérico], [], [chave primária e estrangeira de Dieta], [Dieta que contém o alimento],
  [id_alimento], [Numérico], [], [chave primária e estrangeira de Alimento], [Alimento incluído na dieta],
  [quantidade], [Numérico], [], [], [Quantidade do alimento na composição da dieta],
))

#entidade("Alimento", (
  [id_alimento], [Numérico], [], [chave primária], [Identificador do alimento],
  [nome], [Texto], [20], [], [Nome do alimento],
  [tipo], [Texto], [20], [], [Tipo ou categoria do alimento],
  [validade], [Data], [], [], [Data de validade do alimento],
))
