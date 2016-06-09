class ReceitaPdf < Prawn::Document
	
  def initialize(receita)
    super(page_size: 'A4', margin: [50, 60, 30, 60])

    @receita = receita

    # bounding_box [bounds.left, bounds.top + 40], width: bounds.width, height: 40 do
    	add_header
      move_down 10
    # end

    add_body(receita)

    bounding_box [bounds.left, bounds.bottom + 40], width: bounds.width, height: 40 do
      add_footer
    end
  end

  private

  	def add_header
  		text "Receituário", align: :center, size: 20
      stroke_horizontal_rule
  	end

  	def add_body(receita)

      text "Nome: Diogo Cabral de Almeida", :size => 10
      move_down 20
  		@receita.itens.each do |item|
        medicamento_size = (item.medicamento.nome + item.quantidade.to_s + item.unidade_medida.nome).size

        asd = "-" * (118 - medicamento_size)

  		  text "#{item.medicamento.nome} #{asd} #{item.quantidade} #{item.unidade_medida.nome}", :size => 10
  		  text "Uso: " + item.instrucoes_de_uso, :size => 8

        if item.sugestao_horario?
  		    text "Sugestão de horário: " + item.sugestao_horario, :size => 8
        end
        move_down 20
  		end
  	end

    def add_footer
      stroke_horizontal_rule
      move_down 5
      text "Rua Barão de Maceió, 288 – CEP: 57.020-360 – Centro – Maceió – Alagoas – Brasil", align: :center, :size => 8
      text "CNPJ: 12.307.187/0001-50 – Inscrição Estadual: 24.054.180-4", align: :center, :size => 8
    end

end