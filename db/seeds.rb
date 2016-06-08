# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
UnidadeMedida.create(nome: 'CAIXA', sigla: 'CX')
UnidadeMedida.create(nome: 'COMPRIMIDO', sigla: 'CP')
UnidadeMedida.create(nome: 'MILILITRO', sigla: 'mL')

Medicamento.create(nome: 'ALIVIUM 100 mg/mL')
Medicamento.create(nome: 'CEFALEXINA 500 mg')
Medicamento.create(nome: 'MECLIN 25 mg')
Medicamento.create(nome: 'NOVALGINA 500 mg')
Medicamento.create(nome: 'RINOSORO JET')
Medicamento.create(nome: 'TRAMAL 100 mg/mL')