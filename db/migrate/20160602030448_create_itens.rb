class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
  	  t.integer :id_receita, null: false
  	  t.integer :id_medicamento, null: false
  	  t.integer :id_unidade_medida, null: false
      t.integer :quantidade, null: false
      t.string :instrucoes_de_uso
      t.string :sugestao_horario      
      t.timestamps null: false
    end
  end
end
