# Animal
(#id_animal, dataNascimento, [nomeProprio], &id_especie,
 dataEntradaRecinto, &id_recinto)

# Recinto
(#id_recinto, localizacao, capacidade)
# Terrestre
(#&id_recinto, area, biomaEmulado)
# Aquário
(#&id_recinto, tipoAgua, temperatura)

# ResponsabilidadeRecinto
(#&id_pessoa, #&id_recinto)

# Pessoa
(#id_pessoa, cpf, telefone, nome)
# Funcionario
(#&id_pessoa, salario, funcao)
# Visitante
(#&id_pessoa, dataNascimento, dataCadastro)

# ResponsavelPorVisitante
(#&id_responsavel, #&id_visitante)

# Ingresso
(#&id_pessoa, #&id_visita)

# Visita
(#id_visita, dataHora, visitaGuiada (bool), qtdPessoas, [&id_funcionarioGuia])

# Veterinario (descende de funcionario)
(#&id_pessoa, CRMV, especialidade)

# Consulta
(#id_consulta, &id_animal, &id_veterinario, data, diagnostico)

# Prescrição
(#&id_consulta, #&id_medicamento, dosagem, duração, frequência)

# Medicamento
(#id_medicamento, nome, fabricante, dataValidade)

# Espécie
(#id_especie, nomeCientifico, espectativaVida, habitatNatural)
# NomePopular
(&id_especie, #id_nomePopular, nomePopular)

# EspeciesCompativeis
(#&id_especie1, #&id_especie2)
# Restricoes
(&id_especie1, &id_especie2, #id_restricao, restricao)

# Aquática
(#&id_especie, tipoAgua, temperaturaMinima, tempreraturaMaxima)

# Dieta
(#id_dieta, classificacao, frequencia, &id_especie)

# ComposicaoDieta
(#&id_dieta, #&id_alimento, quantidade)

# Alimento
(#id_alimento, nome, tipo, validade)
