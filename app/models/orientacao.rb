class Orientacao < ActiveRecord::Base

  has_many :itens_orientacao,
    :foreign_key => 'id_orientacao',
    :dependent => :destroy

	validates_presence_of :nome

end