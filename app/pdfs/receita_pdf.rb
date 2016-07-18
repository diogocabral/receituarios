class ReceitaPdf < Prawn::Document
	
  def initialize(receita)
    super(page_size: 'A4', margin: [50, 60, 30, 60], skip_page_creation: true)

    font_families["Arial"] = {
        :normal => { :file => "#{Rails.root}/app/assets/fonts/arial.ttf", :font => "Arial" },
        :bold => { :file => "#{Rails.root}/app/assets/fonts/arial-bold.ttf", :font => "Arial" }
    }

    @receita = receita

    @first_page = true

    mesma_pagina = @receita.itens_receita.select { |item| item.pagina_separada == false}

    itens_by_uso = mesma_pagina.group_by { |item| item.medicamento.uso }

    @receita.numero_copias.to_i.times do
      bounding_box [bounds.left, bounds.top - 150], width: bounds.width, height: 300 do
        start_new_page

        font "Arial"        

        add_body(itens_by_uso)
      end

      if @first_page == true
        bounding_box [bounds.left, bounds.bottom + 300], width: bounds.width do
          text @receita.observacoes, align: :center
        end
        @first_page = false
      end
    end

    pagina_separada = @receita.itens_receita.select { |item| item.pagina_separada == true}

    pagina_separada.each do |item|
      itens_by_uso = Hash.new

      itens_by_uso[item.medicamento.uso] = [item]

      @receita.numero_copias.to_i.times do
        bounding_box [bounds.left, bounds.top - 150], width: bounds.width, height: 200 do
          start_new_page

          font "Arial"
          
          add_body(itens_by_uso)
        end
      end
    end

    repeat :all do
      bounding_box [bounds.left, bounds.top], width: bounds.width do
        add_header
      end

      bounding_box [bounds.left, bounds.bottom + 200], width: bounds.width do
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

      bounding_box [bounds.left + 80, bounds.top - 20], width: bounds.width - 80, height: 40 do
        text "Receituário", align: :center, valign: :bottom, size: 20
      end

      move_down 30

      text "<b>Nome:</b> #{@receita.paciente}", :size => 12, :inline_format => true
  	end

  	def add_body(itens_grouped_by_uso)

      itens_grouped_by_uso.sort_by { |key, value| key[:nome] }.reverse.each do |key, value|

        text "<b>Uso #{key.nome.downcase}:</b>",
          :inline_format => true

        move_down 10

        indent(20) do
          value.sort_by { |item| item.medicamento.nome }.each_with_index do |item, index|
            unidade_medida = item.unidade_medida.nome.pluralize(item.quantidade).downcase

            text_size = width_of "<b>#{index + 1}) #{item.medicamento.nome}</b> #{item.quantidade} #{unidade_medida.downcase}", 
              :size => 12, 
              :inline_format => true

            separator_size = width_of "-", 
              :size => 12, 
              :inline_format => true

            separators = "-" * ((450 - text_size)/separator_size)

            text "<b>#{index + 1}) #{item.medicamento.nome}</b> #{separators} #{item.quantidade} #{unidade_medida}", 
              :size => 12, 
              align: :center,
              :inline_format => true

            indent(20) do

              move_down 5

              sugestao_uso = item.instrucoes_uso

              item.parameters_count.times do |index|
                sugestao_uso.sub! "{#{index}}", item.parameters[index]
              end

      		    text sugestao_uso, :size => 10
              if item.sugestao_horario?

                move_down 5

                text "Sugestão de horário: " + item.sugestao_horario, :size => 9
              end
            end

            move_down 20

          end
        end
  		end
  	end

    def add_signature
      text "Maceió, #{@receita.data}", :size => 10, align: :center
    end

    def add_footer
      stroke_horizontal_rule
      move_down 5
      text "Rua Barão de Maceió, 288 – CEP: 57.020-360 – Centro – Maceió – Alagoas – Brasil", align: :center, :size => 8
      text "CNPJ: 12.307.187/0001-50 – Inscrição Estadual: 24.054.180-4", align: :center, :size => 8
    end

end