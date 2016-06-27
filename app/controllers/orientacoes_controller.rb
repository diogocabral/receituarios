class OrientacoesController < ApplicationController
    
  before_action :authenticate_usuario!
  before_action :set_orientacao, only: [:show, :edit, :update, :exportar, :destroy]

  # GET /orientacoes
  def index
    @orientacoes = Orientacao.order(:nome).all
  end

  # GET /orientacoes/1
  def show
  end

  # GET /orientacoes/new
  def new
    @orientacao = Orientacao.new
    @orientacao.itens_orientacao.build
  end

  # GET /orientacoes/1/edit
  def edit
  end

  # POST /orientacoes
  def create
    @orientacao = Orientacao.new(orientacao_params)

    if @orientacao.save
      redirect_to @orientacao, notice: 'Orientação foi criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /orientacoes/1
  def update
    if @orientacao.update(orientacao_params)
      redirect_to @orientacao, notice: 'Orientação foi atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /orientacoes/1
  def destroy
    @orientacao.destroy
    redirect_to receitas_url, notice: 'Orientação foi excluída com sucesso.'
  end

  # GET /orientacoes/1/exportar
  def exportar
    orientacao_pdf = OrientacaoPdf.new(@orientacao)

    send_data orientacao_pdf.render, filename: "orientacao_#{@orientacao.id}.pdf", type: "application/pdf", disposition: "inline"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orientacao
      @orientacao = Orientacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orientacao_params
      params.require(:orientacao).permit(:nome, itens_orientacao_attributes: [
        :id,
        :nome, 
        :_destroy, 
        itens_orientacao_attributes: [
          :id,
          :nome, 
          :_destroy]])
    end

end
