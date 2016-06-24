class ReceitasController < ApplicationController

  before_action :authenticate_usuario!
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
    @data = Time.now.strftime("%d/%m/%Y")
    @numero_copias = 1
  end

  # GET /receitas/1/exportar
  def exportar
    paciente = params[:paciente]
    data = params[:data]
    observacoes = params[:observacoes]
    numero_copias = params[:numero_copias].to_i

    if params[:id_orientacao].present?
      orientacao = Orientacao.find(params[:id_orientacao])
    end

    receita_pdf = ReceitaPdf.new(@receita, paciente, data, observacoes, numero_copias)

    send_data receita_pdf.render, filename: "receita_#{@receita.id}.pdf", type: "application/pdf", disposition: "inline"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receita
      @receita = Receita.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receita_params
      params.require(:receita).permit(:nome, itens_receita_attributes: [
        :id,
        :id_medicamento, 
        :id_unidade_medida, 
        :quantidade, 
        :instrucoes_de_uso, 
        :sugestao_horario,
        :_destroy])
    end
    
end
