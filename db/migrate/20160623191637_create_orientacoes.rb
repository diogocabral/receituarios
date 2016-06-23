class CreateOrientacoes < ActiveRecord::Migration
  def change
    create_table :orientacoes do |t|
      t.string :nome, null: false
      t.timestamps null: false
    end
  end
end
