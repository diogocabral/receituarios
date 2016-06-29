class Medicamento < ActiveRecord::Base

  belongs_to :uso,
    :foreign_key => 'id_uso'
    
	validates_presence_of :nome, :uso

end
