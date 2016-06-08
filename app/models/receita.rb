class Receita < ActiveRecord::Base

	has_many :itens,
		:foreign_key => 'id_receita',
		:dependent => :destroy

	validates_presence_of :nome, :itens

	accepts_nested_attributes_for :itens, allow_destroy: true

end
