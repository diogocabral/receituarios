class ItemReceita < ActiveRecord::Base

	belongs_to :receita,
		:foreign_key => 'id_receita'

	belongs_to :medicamento,
		:foreign_key => 'id_medicamento'

	belongs_to :unidade_medida,
		:foreign_key => 'id_unidade_medida'

	validates_presence_of :medicamento, :unidade_medida, :quantidade, :instrucoes_uso

  validates :pagina_separada, inclusion: [true, false]

  attr_accessor :parameters

  def has_parameters?
    instrucoes_uso.scan(/\{\p{Digit}\}/).length > 0
  end

  def parameters_count
    instrucoes_uso.scan(/\{\p{Digit}\}/).length
  end

end
