class ItemReceita < ActiveRecord::Base

	belongs_to :receita,
		:foreign_key => 'id_receita'

	belongs_to :medicamento,
		:foreign_key => 'id_medicamento'

	belongs_to :unidade_medida,
		:foreign_key => 'id_unidade_medida'

	validates_presence_of :medicamento, :unidade_medida, :quantidade, :instrucoes_de_uso

end
