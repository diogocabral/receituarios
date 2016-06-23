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

Medicamento.create(nome: 'ALIVIUM 100 mg/mL')
Medicamento.create(nome: 'CEFALEXINA 500 mg')
Medicamento.create(nome: 'MECLIN 25 mg')
Medicamento.create(nome: 'NOVALGINA 500 mg')
Medicamento.create(nome: 'RINOSORO JET')
Medicamento.create(nome: 'TRAMAL 100 mg/mL')

Receita.create(nome: 'Pós-operatório de Desvio de Septo e Turmbinectomia', itens_receita: [
ItemReceita.new(medicamento: Medicamento.find(2), unidade_medida: UnidadeMedida.find(2), quantidade: 28, instrucoes_de_uso: 'Uso: Tomar um comprimido de 6/6h'),
ItemReceita.new(medicamento: Medicamento.find(4), unidade_medida: UnidadeMedida.find(1), quantidade: 1, instrucoes_de_uso: 'Tomar um comprimido de 6/6h se dor'),
ItemReceita.new(medicamento: Medicamento.find(5), unidade_medida: UnidadeMedida.find(3), quantidade: 1, instrucoes_de_uso: 'Aplicar um jato em cada narina de 2/2h')
])