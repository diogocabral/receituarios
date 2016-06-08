class CreateUnidadesMedida < ActiveRecord::Migration
  def change
    create_table :unidades_medida do |t|
      t.string :nome, null: false
      t.string :sigla
      t.timestamps null: false
    end
  end
end
