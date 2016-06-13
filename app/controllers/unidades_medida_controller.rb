class UnidadesMedidaController < ApplicationController

  before_action :authenticate_usuario!
  before_action :set_unidade_medida, only: [:show, :edit, :update, :destroy]

  # GET /unidades_medida
  # GET /unidades_medida.json
  def index
    @unidades_medida = UnidadeMedida.all
  end

  # GET /unidades_medida/1
  # GET /unidades_medida/1.json
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
  # POST /unidades_medida.json
  def create
    @unidade_medida = UnidadeMedida.new(unidade_medida_params)

    respond_to do |format|
      if @unidade_medida.save
        format.html { redirect_to @unidade_medida, notice: 'Unidade medida was successfully created.' }
        format.json { render :show, status: :created, location: @unidade_medida }
      else
        format.html { render :new }
        format.json { render json: @unidade_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidades_medida/1
  # PATCH/PUT /unidades_medida/1.json
  def update
    respond_to do |format|
      if @unidade_medida.update(unidade_medida_params)
        format.html { redirect_to @unidade_medida, notice: 'Unidade medida was successfully updated.' }
        format.json { render :show, status: :ok, location: @unidade_medida }
      else
        format.html { render :edit }
        format.json { render json: @unidade_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades_medida/1
  # DELETE /unidades_medida/1.json
  def destroy
    @unidade_medida.destroy
    respond_to do |format|
      format.html { redirect_to unidades_medida_url, notice: 'Unidade medida was successfully destroyed.' }
      format.json { head :no_content }
    end
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
