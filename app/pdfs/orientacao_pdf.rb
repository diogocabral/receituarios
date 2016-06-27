class OrientacaoPdf < Prawn::Document
  
  def initialize(orientacao)
    super(page_size: 'A4', margin: [50, 60, 30, 60], skip_page_creation: true)

    font_families["Arial"] = {
        :normal => { :file => "#{Rails.root}/app/assets/fonts/arial.ttf", :font => "Arial" },
        :bold => { :file => "#{Rails.root}/app/assets/fonts/arial-bold.ttf", :font => "Arial" }
    }

    @orientacao = orientacao
    
    bounding_box [bounds.left, bounds.top - 100], width: bounds.width, height: 600 do
      start_new_page

      font "Arial"
      
      add_body
    end

    repeat :all do
      bounding_box [bounds.left, bounds.top], width: bounds.width do
        add_header
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

      text "ORIENTAÇÕES - " + @orientacao.nome, align: :center, size: 15

      move_down 10
    end

    def add_body
      @orientacao.itens_orientacao.each do |item|
        text "<b>#{item.nome.upcase}</b>",
          :size => 12,
          :inline_format => true

        item.itens_orientacao.each do |subitem|
          move_down 5
          indent(20) do
            text "• " + subitem.nome, 
              :size => 10,
              :align => :justify,
              :leading => 5,
              :inline_format => true
          end
        end

        move_down 10
      end
    end

    def add_footer
      stroke_horizontal_rule
      move_down 5
      text "Rua Barão de Maceió, 288 – CEP: 57.020-360 – Centro – Maceió – Alagoas – Brasil", align: :center, :size => 8
      text "CNPJ: 12.307.187/0001-50 – Inscrição Estadual: 24.054.180-4", align: :center, :size => 8
    end

end