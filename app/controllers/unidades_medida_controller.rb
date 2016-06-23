class UnidadesMedidaController < ApplicationController

  before_action :authenticate_usuario!
  before_action :set_unidade_medida, only: [:show, :edit, :update, :destroy]

  # GET /unidades_medida
  def index
    @unidades_medida = UnidadeMedida.order(:nome).all
  end

  # GET /unidades_medida/1
  def show
  end

  # GET /unidades_medida/new
  def new
    @unidade_medida = UnidadeMedida.new
  end

  # GET /unidades_medida/1/edit
  def edit
  end

  # POST /unidades_medida
  def create
    @unidade_medida = UnidadeMedida.new(unidade_medida_params)

    if @unidade_medida.save
      redirect_to @unidade_medida, notice: 'Unidade de medida criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /unidades_medida/1
  def update
    if @unidade_medida.update(unidade_medida_params)
      redirect_to @unidade_medida, notice: 'Unidade de medida atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /unidades_medida/1
  def destroy
    @unidade_medida.destroy
    redirect_to unidades_medida_url, notice: 'Unidade de medida excluída com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade_medida
      @unidade_medida = UnidadeMedida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unidade_medida_params
      params.require(:unidade_medida).permit(:nome, :sigla)
    end
    
end
