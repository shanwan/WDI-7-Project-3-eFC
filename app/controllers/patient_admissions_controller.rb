class PatientAdmissionsController < ApplicationController

  before_action :is_authenticated

  def index
    @patient = PatientAdmission.find_by(NRIC: params[:NRIC])
    #find by what???
  end

  def new
    @patient = PatientAdmission.new
  end

  def show
    @patient = PatientAdmission.find_by! user_id: current_user.id, confirm: false
    # how to refer to the current admission
    # @patient = PatientAdmission.where(:user_id => params[current_user.id], :confirm => params['false'])
  end

  def edit
    @patient = PatientAdmission.find_by(user_id: params[:user_id])
  end

  def update
    @patient = PatientAdmission.find_by(user_id: params[:user_id])

    if @patient.update(patient_admission_params)
      redirect_to @PatientAdmission
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def patient_admission_params
    params.require(:patient).permit(:NRIC, :means_testing, :user_id, :id)
  end

end
