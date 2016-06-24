class CreateItensOrientacao < ActiveRecord::Migration
  def change
    create_table :itens_orientacao do |t|
      t.string :nome, null: false
      t.integer :id_item_orientacao_sup
      t.integer :id_orientacao
      t.timestamps null: false
    end
  end
end
