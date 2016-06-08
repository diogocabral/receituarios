class ItensForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :itens, :receitas
    add_foreign_key :itens, :medicamentos
    add_foreign_key :itens, :unidades_medida
  end
end
