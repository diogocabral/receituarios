class ItensForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :itens, :receitas, column: :id_receita
    add_foreign_key :itens, :medicamentos, column: :id_medicamento
    add_foreign_key :itens, :unidades_medida, column: :id_unidade_medida
  end
end
