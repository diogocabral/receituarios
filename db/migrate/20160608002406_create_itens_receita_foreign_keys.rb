class CreateItensReceitaForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :itens_receita, :receitas, column: :id_receita
    add_foreign_key :itens_receita, :medicamentos, column: :id_medicamento
    add_foreign_key :itens_receita, :unidades_medida, column: :id_unidade_medida
  end
end
