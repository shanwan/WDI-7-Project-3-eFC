class PatientAdmissionsController < ApplicationController

  before_action :is_authenticated

  def index
  end

  def new
    @patient = Patient_admission.new
  end

  def show
    @patient = Patient_admission.find_by(personal_id: params[:personal_id])
  end

  def edit
    @patient = Patient_admission.find_by(personal_id: params[:personal_id])
  end

  def update
    @patient = Patient_admission.find_by(personal_id: params[:personal_id])

    if @patient.update(patient_admission_params)
      redirect_to @patient_admission
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def patient_admission_params
    params.require(:patient).permit()
  end

end
