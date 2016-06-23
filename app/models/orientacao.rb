class Orientacao < ActiveRecord::Base

  has_many :itens_orientacao,
    :foreign_key => 'id_orientacao',
    :dependent => :destroy

	validates_presence_of :nome, :itens_orientacao

  accepts_nested_attributes_for :itens_orientacao, allow_destroy: true

end