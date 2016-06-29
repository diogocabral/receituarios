class CreateUsos < ActiveRecord::Migration
  def change
    create_table :usos do |t|
      t.string :nome
      t.timestamps null: false
    end
  end
end
