class CreateMedicamentosForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :medicamentos, :usos, column: :id_uso
  end
end
