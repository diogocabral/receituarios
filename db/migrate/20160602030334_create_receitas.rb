class CreateReceitas < ActiveRecord::Migration
  def change
    create_table :receitas do |t|
      t.string :nome, null: false
      t.timestamps null: false
    end
  end
end
