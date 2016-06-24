class ItemOrientacao < ActiveRecord::Base

  belongs_to :orientacao,
    :foreign_key => 'id_orientacao'

  has_many :itens_orientacao,
    :foreign_key => 'id_item_orientacao_sup',
    :dependent => :destroy

  validates_presence_of :nome

  accepts_nested_attributes_for :itens_orientacao, allow_destroy: true

end
