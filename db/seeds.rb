# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Usuario.find_or_create_by!(email: 'user@example.com') do |usuario|
  usuario.password = 'changeme'
  usuario.password_confirmation = 'changeme'
end

UnidadeMedida.create(nome: 'CAIXA', sigla: 'CX')
UnidadeMedida.create(nome: 'COMPRIMIDO', sigla: 'CP')
UnidadeMedida.create(nome: 'MILILITRO', sigla: 'mL')
UnidadeMedida.create(nome: 'FRASCO', sigla: 'F')

Uso.create(nome: 'ORAL')
Uso.create(nome: 'NASAL')

Medicamento.create(nome: 'ALIVIUM 100 mg/mL', uso: Uso.find(1))
Medicamento.create(nome: 'CEFALEXINA 500 mg', uso: Uso.find(1))
Medicamento.create(nome: 'MECLIN 25 mg', uso: Uso.find(1))
Medicamento.create(nome: 'NOVALGINA 500 mg', uso: Uso.find(1))
Medicamento.create(nome: 'RINOSORO JET', uso: Uso.find(2))
Medicamento.create(nome: 'TRAMAL 100 mg/mL', uso: Uso.find(1))

Receita.create(nome: 'Pós-operatório de Desvio de Septo e Turmbinectomia', itens_receita: [
  ItemReceita.new(medicamento: Medicamento.find(2), unidade_medida: UnidadeMedida.find(2), quantidade: 28, instrucoes_uso: 'Tomar um comprimido de 6/6h', pagina_separada: false),
  ItemReceita.new(medicamento: Medicamento.find(4), unidade_medida: UnidadeMedida.find(1), quantidade: 1, instrucoes_uso: 'Tomar um comprimido de 6/6h se dor', pagina_separada: false),
  ItemReceita.new(medicamento: Medicamento.find(5), unidade_medida: UnidadeMedida.find(3), quantidade: 1, instrucoes_uso: 'Aplicar um jato em cada narina de 2/2h', pagina_separada: false)
])

Orientacao.create(nome: 'AMIGDALECTOMIA COM OU SEM ADENOIDECTOMIA', itens_orientacao: [
  ItemOrientacao.new(nome: 'ALIMENTAÇÃO', itens_orientacao: [
    ItemOrientacao.new(nome: '<b>1º E 2º dia:</b> Somente líquidos, ao natural ou gelado (leite, chá, café, caldos, suco de frutas não ácidas, sorvete, gelatina, etc).'),
    ItemOrientacao.new(nome: '<b>3º dia:</b> Pastosa em temperatura ambiente (sopa de massa fina, mingaus, arroz mole com caldo de feijão, purê de batata, canja de galinha, etc).'),
    ItemOrientacao.new(nome: '<b>A partir do 4º dia:</b> Retornar aos poucos a alimentação costumeira (em temperatura ambiente ou morna até o 10º dia).')
  ]), ItemOrientacao.new(nome: 'REPOUSO', itens_orientacao: [
    ItemOrientacao.new(nome: '<b>1º dia:</b> Repouso no leito e cuspir até que a saliva esteja clara. Ficar com a cabeça na horizontal, deitado de lado. Depois que a saliva estiver clara deverá engolir mesmo que sinta dor.'),
    ItemOrientacao.new(nome: '<b>A partir do 2º dia:</b> Retornar aos poucos às atividades normais na medida do possível.')
  ]), ItemOrientacao.new(nome: 'GARGANTA', itens_orientacao: [
    ItemOrientacao.new(nome: 'No local da operação forma-se uma placa branca (fibrina) indicativa de cicatrização e não deverá ser interpretado como pus (portanto não necessita de antibiótico). É uma causa também de mau hálito.'),
    ItemOrientacao.new(nome: 'Evitar movimentos bruscos (higiene dental e bochechos vigorosos) que façam com que essa placa se descole, podendo provocar sangramento.')
  ]), ItemOrientacao.new(nome: 'FEBRE', itens_orientacao: [
    ItemOrientacao.new(nome: 'Febre (37 a 38,5ºC) pode ocorrer nos dois primeiros dias.')
  ]), ItemOrientacao.new(nome: 'DOR', itens_orientacao: [
    ItemOrientacao.new(nome: 'Dor de garganta e de ouvido e dificuldade para alimentação são esperadas e não devem ser causa de inquietação. Nestes casos, deve ser oferecida a medicação analgésica específica. Não pingar nada no ouvido sem indicação médica.')
  ]), ItemOrientacao.new(nome: 'VÔMITOS', itens_orientacao: [
    ItemOrientacao.new(nome: 'Podem ocorrer vômitos nos primeiros dias após a cirurgia, constituídos de sangue.'),
    ItemOrientacao.new(nome: 'Porém se os vômitos forem repetidos e de sangue vivo, procurar o médico ou o hospital.')
  ]), ItemOrientacao.new(nome: 'HEMORRAGIAS', itens_orientacao: [
    ItemOrientacao.new(nome: 'São normais pequenos sangramentos de garganta nos primeiros dias. Deve- se deitar de lado, cuspindo o sangue e avisar o médico se não ceder, para instruções.')
  ])
])

Orientacao.create(nome: 'CIRURGIA LARÍNGEA', itens_orientacao: [
  ItemOrientacao.new(nome: 'ALIMENTAÇÃO', itens_orientacao: [
    ItemOrientacao.new(nome: 'Não há restrição quanto a alimentos. A alimentação deve ser a usual.')
  ]), ItemOrientacao.new(nome: 'REPOUSO', itens_orientacao: [
    ItemOrientacao.new(nome: '1 o dia: Repouso no leito.'),
    ItemOrientacao.new(nome: 'A partir do 2 o dia: Retornar aos poucos às atividades normais na medida do possível.')
  ]), ItemOrientacao.new(nome: 'VOZ', itens_orientacao: [
    ItemOrientacao.new(nome: 'Deve-se manter repouso vocal absoluto por 07 dias, ou seja, não conversar ou sussurrar durante 01 semana. Isto é muito importante para o sucesso da cirurgia e para evitar complicações.')
  ]), ItemOrientacao.new(nome: 'FEBRE', itens_orientacao: [
    ItemOrientacao.new(nome: 'Febre (37 a 38,5ºC) pode ocorrer nos dois primeiros dias.')
  ]), ItemOrientacao.new(nome: 'DOR', itens_orientacao: [
    ItemOrientacao.new(nome: 'Dores são raras, mas esperadas e não devem ser causa de inquietação. Nestes casos, deve ser dada a medicação analgésica específica.')
  ]), ItemOrientacao.new(nome: 'VÔMITOS', itens_orientacao: [
    ItemOrientacao.new(nome: 'Podem ocorrer vômitos nos primeiros dias após a cirurgia, constituídos de sangue. Porém se os vômitos forem repetidos e de sangue vivo, procurar o médico ou o hospital.')
  ])
])

Orientacao.create(nome: 'CIRURGIA NASAL', itens_orientacao: [
  ItemOrientacao.new(nome: 'ALIMENTAÇÃO', itens_orientacao: [
    ItemOrientacao.new(nome: 'A alimentação deve ser a usual, evitando-se alimentos quentes e/ou muito endurecidos durante a primeira semana.')
  ]), ItemOrientacao.new(nome: 'REPOUSO', itens_orientacao: [
    ItemOrientacao.new(nome: '1 o dia: Repouso no leito. Ficar com a cabeça elevada (deitado com um travesseiro alto). A partir do 2 o dia: Retornar aos poucos às atividades normais na medida do possível.')
  ]), ItemOrientacao.new(nome: 'NARIZ', itens_orientacao: [
    ItemOrientacao.new(nome: 'O nariz poderá permanecer entupido por cerca de 10 dias. Lavar constantemente as narinas com a medicação prescrita, porém poderá permanecer parcialmente entupido até o retorno.')
  ]), ItemOrientacao.new(nome: 'FEBRE', itens_orientacao: [
    ItemOrientacao.new(nome: 'Febre (37 a 38,5ºC) pode ocorrer nos dois primeiros dias.')
  ]), ItemOrientacao.new(nome: 'DOR', itens_orientacao: [
    ItemOrientacao.new(nome: 'Dores são raras, mas esperadas e não devem ser causa de inquietação. Nestes casos, deve ser dada a medicação analgésica específica.')
  ]), ItemOrientacao.new(nome: 'VÔMITOS', itens_orientacao: [
    ItemOrientacao.new(nome: 'Podem ocorrer vômitos nos primeiros dias após a cirurgia, constituídos de sangue. Porém se os vômitos forem repetidos e de sangue vivo, procurar o médico ou o hospital.')
  ]), ItemOrientacao.new(nome: 'HEMORRAGIAS', itens_orientacao: [
    ItemOrientacao.new(nome: 'Evitar abaixar a cabeça, não coçar intempestivamente o nariz, deve-se manter a boca aberta durante episódios de espirros.'),
    ItemOrientacao.new(nome: 'São normais pequenos sangramentos do nariz e da garganta nos primeiros dias. Deve-se comprimir o nariz e abaixar a cabeça, cuspindo o sangue, por 10 minutos. Avisar o médico se não ceder, para instruções.')
  ])
])

Orientacao.create(nome: 'CIRURGIA OTOLÓGICA', itens_orientacao: [
  ItemOrientacao.new(nome: 'REPOUSO', itens_orientacao: [
    ItemOrientacao.new(nome: '1º e 2º dia: Repouso absoluto no leito.'),
    ItemOrientacao.new(nome: 'A partir do 3º dia: Repouso relativo. Não fazer exercícios físicos, caminhadas, carregar peso. Não assuar o nariz. Se tossir ou espirrar, abrir sempre a boca antes. Manter o hábito intestinal, evitando esforços para defecação.')
  ]), ItemOrientacao.new(nome: 'OUVIDO', itens_orientacao: [
    ItemOrientacao.new(nome: 'Não deixar cair água dentro do ouvido e nem no curativo. Depois da retirada do curativo, manter um algodão seco na entrada do conduto auditivo e não molhar o ouvido. Quando tomar banho, usar algodão embebido com óleo mineral para proteção. É normal a sensação de que o ouvido está cheio e tampado. <b>É fundamental a higienização das mãos.</b>')
  ]), ItemOrientacao.new(nome: 'FEBRE', itens_orientacao: [
    ItemOrientacao.new(nome: 'Febre (37 a 38,5ºC) pode ocorrer nos dois primeiros dias.')
  ]), ItemOrientacao.new(nome: 'DOR', itens_orientacao: [
    ItemOrientacao.new(nome: 'Dores são raras, mas esperadas e não devem ser causa de inquietação. Nestes casos, deve ser dada a medicação analgésica específica.')
  ]), ItemOrientacao.new(nome: 'TONTURAS', itens_orientacao: [
    ItemOrientacao.new(nome: 'Tonturas são esperadas e não devem ser causa de inquietação. Nestes casos, deve ser dada a medicação específica.')
  ]), ItemOrientacao.new(nome: 'VÔMITOS', itens_orientacao: [
    ItemOrientacao.new(nome: 'Podem ocorrer vômitos nos primeiros dias após a cirurgia. Porém se os vômitos forem repetidos e de sangue vivo, procurar o médico ou o hospital.')
  ]), ItemOrientacao.new(nome: 'HEMORRAGIAS', itens_orientacao: [
    ItemOrientacao.new(nome: 'São normais pequenos sangramentos do ouvido nos primeiros dias. Avisar o médico se não ceder, para instruções.')
  ]), ItemOrientacao.new(nome: 'VOLTAR AO ESPECIALISTA', itens_orientacao: [
    ItemOrientacao.new(nome: 'Vermelhidão, inchaço, dor forte ou sangramento excessivo.'),
    ItemOrientacao.new(nome: 'Aumento ou mau cheiro do líquido drenado pelo ouvido.'),
    ItemOrientacao.new(nome: 'Perda súbita de audição.')
  ])
])