class MedicamentosController < ApplicationController

  before_action :authenticate_usuario!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_medicamento, only: [:show, :edit, :update, :destroy]

  # GET /medicamentos
  def index
    @medicamentos = Medicamento.eager_load(:uso).order(:nome).all
  end

  # GET /medicamentos/1
  def show
  end

  # GET /medicamentos/new
  def new
    @medicamento = Medicamento.new
  end

  # GET /medicamentos/1/edit
  def edit
  end

  # POST /medicamentos
  def create
    @medicamento = Medicamento.new(medicamento_params)

    if @medicamento.save
      redirect_to @medicamento, notice: 'Medicamento foi criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /medicamentos/1
  def update
    if @medicamento.update(medicamento_params)
      redirect_to @medicamento, notice: 'Medicamento foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /medicamentos/1
  def destroy
    @medicamento.destroy
    redirect_to medicamentos_url, notice: 'Medicamento foi excluído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicamento
      @medicamento = Medicamento.eager_load(:uso).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicamento_params
      params.require(:medicamento).permit(:nome, :id_uso)
    end
    
end
