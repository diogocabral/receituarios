class Receita < ActiveRecord::Base

  has_many :itens_receita,
		:foreign_key => 'id_receita',
		:dependent => :destroy

	validates_presence_of :nome, :itens_receita

	accepts_nested_attributes_for :itens_receita, allow_destroy: true

end
