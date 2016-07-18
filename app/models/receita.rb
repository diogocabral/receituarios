class Receita < ActiveRecord::Base

  include ActiveModel::Validations

  has_many :itens_receita,
		:foreign_key => 'id_receita',
		:dependent => :destroy

	validates_presence_of :nome, :itens_receita

	accepts_nested_attributes_for :itens_receita, allow_destroy: true

  attr_accessor :paciente, :data, :numero_copias, :observacoes, :orientacoes

  def transient_attributes_valid?
    errors.add(:data, 'não pode ser vazia.') if data.blank?
    errors.add(:numero_copias, 'não pode ser vazio.') if numero_copias.blank?
    errors.add(:numero_copias, 'não pode ser menor que 1.') if numero_copias < 1

    errors.empty?
  end

  def has_parameters?
    itens_receita.each do |item_receita|
      if item_receita.parameters_count > 0
        return true
      end
    end

    return false
  end

end
