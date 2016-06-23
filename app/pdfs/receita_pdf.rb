class ReceitaPdf < Prawn::Document
	
  def initialize(receita, nome_paciente, data, observacoes)
    super(page_size: 'A4', margin: [50, 60, 30, 60])

    font_families["Arial"] = {
        :normal => { :file => "#{Rails.root}/app/assets/fonts/arial.ttf", :font => "Arial" },
        :bold => { :file => "#{Rails.root}/app/assets/fonts/arial-bold.ttf", :font => "Arial" }
    }

    font "Arial"

    @receita = receita
    @nome_paciente = nome_paciente
    @data = data
    @observacoes = observacoes

    bounding_box [bounds.left, bounds.top - 150], width: bounds.width, height: 200 do
      add_body
    end

    repeat :all do
      bounding_box [bounds.left, bounds.top], width: bounds.width do
        add_header
      end

      bounding_box [bounds.left, bounds.bottom + 300], width: bounds.width do
        add_signature
      end

      bounding_box [bounds.left, bounds.bottom + 40], width: bounds.width do
        add_footer
      end
    end
  end

  private

  	def add_header
      image "#{Rails.root}/app/assets/images/logo.jpg", position: :left, width: 80

      move_cursor_to bounds.top

      move_down 40

  		text "Receituário", align: :center, size: 20

      move_down 10

      stroke_horizontal_rule

      move_down 30

      text "<b>Nome:</b> #{@nome_paciente}", :size => 12, :inline_format => true
  	end

  	def add_body
  		@receita.itens_receita.each do |item|
        unidade_medida = item.unidade_medida.nome.pluralize(item.quantidade).downcase

        text_size = width_of "<b>#{item.medicamento.nome}</b> #{item.quantidade} #{unidade_medida}", 
          :size => 12, 
          :inline_format => true

        separator_size = width_of "-", 
          :size => 12, 
          :inline_format => true

        separators = "-" * ((450 - text_size)/separator_size)

        text "<b>#{item.medicamento.nome}</b> #{separators} #{item.quantidade} #{unidade_medida}", 
          :size => 12, 
          align: :center,
          :inline_format => true

        indent(20) do
  		    text item.instrucoes_de_uso, :size => 10
          if item.sugestao_horario?
            text "Sugestão de horário: " + item.sugestao_horario, :size => 9
          end
        end

        move_down 20
  		end

      move_down 50
      text @observacoes, align: :center
  	end

    def add_signature
      text "Maceió, #{@data}", :size => 10, align: :center
    end

    def add_footer
      stroke_horizontal_rule
      move_down 5
      text "Rua Barão de Maceió, 288 – CEP: 57.020-360 – Centro – Maceió – Alagoas – Brasil", align: :center, :size => 8
      text "CNPJ: 12.307.187/0001-50 – Inscrição Estadual: 24.054.180-4", align: :center, :size => 8
    end

end