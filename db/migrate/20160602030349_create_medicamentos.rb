class CreateMedicamentos < ActiveRecord::Migration
  def change
    create_table :medicamentos do |t|
      t.string :nome, null: false
      t.timestamps null: false
    end
  end
end
