class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
  	  t.references :receita, :foreign_key => 'id_receita', null: false
  	  t.references :medicamento, :foreign_key => 'id_medicamento', null: false
  	  t.references :unidade_medida, :foreign_key => 'id_unidade_medida', null: false
      t.integer :quantidade, null: false
      t.string :instrucoes_de_uso
      t.string :sugestao_horario      
      t.timestamps null: false
    end
  end
end
