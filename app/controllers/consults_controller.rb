class ConsultsController < ApplicationController
  before_action :set_patient
  before_action :set_consult, only: [:show, :edit, :update, :destroy]

  # GET /patients/:patient_id/consults
  def index
    @consults = @patient.consults
  end

  # GET /patients/:patient_id/consults/:id
  def show
  end

  # GET /patients/:patient_id/consults/new
  def new
    @consult = @patient.consults.build
  end

  # GET /patients/:patient_id/consults/:id/edit
  def edit
  end

  # POST /patients/:patient_id/consults
  def create
    @consult = @patient.consults.build(consult_params)

    if @consult.save
      redirect_to [@patient, @consult], notice: 'Consulta creada con éxito.'
    else
      render :new
    end
  end

  # PATCH/PUT /patients/:patient_id/consults/:id
  def update
    if @consult.update(consult_params)
      redirect_to [@patient, @consult], notice: 'Consulta actualizada con éxito.'
    else
      render :edit
    end
  end

  # DELETE /patients/:patient_id/consults/:id
  def destroy
    @consult.destroy
    redirect_to patient_consults_url(@patient), notice: 'Consulta eliminada con éxito.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def set_consult
      @consult = @patient.consults.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consult_params
      params.require(:consult).permit(:description)
    end
end
