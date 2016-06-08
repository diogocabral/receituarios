class ReceitaPdf < Prawn::Document
	
  def initialize(receita)
    super(page_size: 'A4', margin: [50, 60, 30, 60])

    @receita = receita

    # bounding_box [bounds.left, bounds.bottom + 40], width: bounds.width, height: 40 do
    	add_header
    	move_down 50
    	add_body(receita)
    	move_down 50
		add_footer
    # end
  end

  private

  	def add_header
  		text "RECEITUÁRIO", align: :center
  	end

  	def add_body(receita)
		@receita.itens.each do |item|
		  text item.medicamento.nome + "---------------------------" + " " + item.unidade_medida.nome, align: :left
		  text item.instrucoes_de_uso, align: :left
		  text "Sugestão de horário:" + item.sugestao_horario, align: :left
		end
  	end

    def add_footer
      text "Rua Barão de Maceió, 288 – CEP: 57.020-360 – Centro – Maceió – Alagoas – Brasil", align: :center
      text "CNPJ: 12.307.187/0001-50 – Inscrição Estadual: 24.054.180-4", align: :center
    end

end