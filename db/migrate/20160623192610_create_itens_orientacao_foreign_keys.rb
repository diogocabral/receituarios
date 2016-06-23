class CreateItensOrientacaoForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :itens_orientacao, :orientacoes, column: :id_orientacao
    add_foreign_key :itens_orientacao, :itens_orientacao, column: :id_item_orientacao_sup
  end
end
