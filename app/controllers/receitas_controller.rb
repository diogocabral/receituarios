class ReceitasController < ApplicationController

  before_action :authenticate_usuario!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_receita, only: [:show, :edit, :exportar, :preparar, :update, :destroy]

  # GET /receitas
  def index
    @receitas = Receita.order(:nome).all
  end

  # GET /receitas/1
  def show
  end

  # GET /receitas/new
  def new
    @receita = Receita.new
    @receita.itens_receita.build
  end

  # GET /receitas/1/edit
  def edit
  end

  # POST /receitas
  def create
    @receita = Receita.new(receita_params)

    if @receita.save
      redirect_to @receita, notice: 'Receita foi criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /receitas/1
  def update
    if @receita.update(receita_params)
      redirect_to @receita, notice: 'Receita foi atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /receitas/1
  def destroy
    @receita.destroy
    redirect_to receitas_url, notice: 'Receita foi excluída com sucesso.'
  end

  # GET /receitas/1/preparar
  def preparar
    @receita.data = Time.now.strftime('%d/%m/%Y')
    @receita.numero_copias = 1
  end

  # POST /receitas/1/exportar
  def exportar
    @receita.paciente = receita_params[:paciente]
    @receita.data = receita_params[:data]
    @receita.observacoes = receita_params[:observacoes]
    @receita.numero_copias = receita_params[:numero_copias].to_i

    parameters = receita_params[:itens_receita_attributes]

    @receita.itens_receita.each_with_index do |item, item_index|
      @receita.itens_receita[item_index].parameters = []

      item.parameters_count.times do |index|
        @receita.itens_receita[item_index].parameters[index] = parameters[item.id.to_s][:parameters_attributes][index.to_s][:value]
      end
    end

    @receita.orientacoes = []
    if receita_params[:orientacoes].present?
      # Using select to avoid the first empty element. It's probably a bug on rails multiselect helper.
      # http://stackoverflow.com/questions/8929230/why-is-the-first-element-always-blank-in-my-rails-multi-select-using-an-embedde
      receita_params[:orientacoes].select { |item| item.present? }.each do |id_orientacao|
        @receita.orientacoes << Orientacao.find(id_orientacao)
      end      
    end

    if @receita.transient_attributes_valid?
      receita_pdf = ReceitaPdf.new(@receita)

      combined_file = CombinePDF.new
      combined_file << CombinePDF.parse(receita_pdf.render)

      if @receita.orientacoes.any?
        @receita.orientacoes.each do |orientacao|
          orientacao_pdf = OrientacaoPdf.new(orientacao)
          combined_file << CombinePDF.parse(orientacao_pdf.render)
        end
      end

      send_data combined_file.to_pdf, filename: "receita_#{@receita.id}.pdf", type: "application/pdf", disposition: "inline"
    elsif
      render :preparar
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receita
      @receita = Receita.includes(:itens_receita => [:unidade_medida, :medicamento => [:uso]]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receita_params
      params.require(:receita).permit(:nome, :paciente, :data, :observacoes, :numero_copias, :paciente, 
        orientacoes: [],
        itens_receita_attributes: [
          :id,
          :id_medicamento, 
          :id_unidade_medida, 
          :quantidade, 
          :instrucoes_uso, 
          :sugestao_horario,
          :pagina_separada,
          :_destroy, {parameters_attributes: [:value]}])
    end
    
end
