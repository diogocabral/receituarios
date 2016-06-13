class MedicamentosController < ApplicationController

  before_action :authenticate_usuario!
  before_action :set_medicamento, only: [:show, :edit, :update, :destroy]

  # GET /medicamentos
  # GET /medicamentos.json
  def index
    @medicamentos = Medicamento.all
  end

  # GET /medicamentos/1
  # GET /medicamentos/1.json
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
  # POST /medicamentos.json
  def create
    @medicamento = Medicamento.new(medicamento_params)

    respond_to do |format|
      if @medicamento.save
        format.html { redirect_to @medicamento, notice: 'Medicamento was successfully created.' }
        format.json { render :show, status: :created, location: @medicamento }
      else
        format.html { render :new }
        format.json { render json: @medicamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicamentos/1
  # PATCH/PUT /medicamentos/1.json
  def update
    respond_to do |format|
      if @medicamento.update(medicamento_params)
        format.html { redirect_to @medicamento, notice: 'Medicamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicamento }
      else
        format.html { render :edit }
        format.json { render json: @medicamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicamentos/1
  # DELETE /medicamentos/1.json
  def destroy
    @medicamento.destroy
    respond_to do |format|
      format.html { redirect_to medicamentos_url, notice: 'Medicamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicamento
      @medicamento = Medicamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicamento_params
      params.require(:medicamento).permit(:nome)
    end
end
