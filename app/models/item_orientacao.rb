class ItemOrientacao < ActiveRecord::Base

  belongs_to :orientacao,
    :foreign_key => 'id_orientacao'

  belongs_to :item_orientacao,
    :foreign_key => 'id_item_orientacao_sup'

  validates_presence_of :nome

end
