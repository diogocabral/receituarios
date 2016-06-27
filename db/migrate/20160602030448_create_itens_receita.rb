class CreateItensReceita < ActiveRecord::Migration
  def change
    create_table :itens_receita do |t|
  	  t.integer :id_receita, null: false
  	  t.integer :id_medicamento, null: false
  	  t.integer :id_unidade_medida, null: false
      t.integer :quantidade, null: false
      t.string :instrucoes_uso
      t.string :sugestao_horario
      t.boolean :pagina_separada
      t.timestamps null: false
    end
  end
end
