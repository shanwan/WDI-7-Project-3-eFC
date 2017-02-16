class PatientAdmissionsController < ApplicationController
  # before_action :is_authenticated

  def index
    @patient = PatientAdmission.find_by(NRIC: params[:NRIC])
    @ward = Ward.all
  end

  def new
    @patient_record = Patient.find_by(id: current_user.id)
    @income = @patient_record.income

    if @income < 3200
      @subsidy_C = 0.8
      @subsidy_B2 = 0.6
      @subsidy_B1 = 0.4
      @subsidy_A = 0
    elsif @income > 3200 && @income < 4000
      @subsidy_C = 0.6
      @subsidy_B2 = 0.4
      @subsidy_B1 = 0.2
      @subsidy_A = 0
    elsif @income > 4000 && @income < 6000
      @subsidy_C = 0.4
      @subsidy_B2 = 0.2
      @subsidy_B1 = 0
      @subsidy_A = 0
    end

    @patient = PatientAdmission.find_by(user_id: current_user.id)
    @ward = Ward.all
    @wardA = Ward.find_by(ward_type: 'A')
    @wardB1 = Ward.find_by(ward_type: 'B1')
    @wardB2 = Ward.find_by(ward_type: 'B2')
    @wardC = Ward.find_by(ward_type: 'C')
  end

  def show
    @patient = PatientAdmission.find_by! user_id: current_user.id, confirm: false
    # if @patient
    #   redirect_to patient_admission_path
    # else
    #   render 'edit'
    # end
    # how to refer to the current admission
    # @patient = PatientAdmission.where(:user_id => params[current_user.id], :confirm => params['false'])
  end

  def edit
    @patient = PatientAdmission.find_by(user_id: params[:user_id])
    @patient_record = Patient.find_by(id: current_user.id)
    @income = @patient_record.income

    if @income < 3200
      @subsidy_C = 0.80
      @subsidy_B2 = 0.60
      @subsidy_B1 = 0.40
      @subsidy_A = 0.00
    elsif @income > 3200 && @income < 4000
      @subsidy_C = 0.60
      @subsidy_B2 = 0.40
      @subsidy_B1 = 0.20
      @subsidy_A = 0.00
    else @income > 4000 && @income < 6000
      @subsidy_C = 0.40
      @subsidy_B2 = 0.20
      @subsidy_B1 = 0.00
      @subsidy_A = 0.00
    end

    @patient = PatientAdmission.find_by(user_id: current_user.id)
    @ward = Ward.all
    @wardA = Ward.find_by(ward_type: 'A')
    @wardB1 = Ward.find_by(ward_type: 'B1')
    @wardB2 = Ward.find_by(ward_type: 'B2')
    @wardC = Ward.find_by(ward_type: 'C')
  end

  def update
    @patient = PatientAdmission.find_by(user_id: current_user.id)
    @patient_record = Patient.find_by(id: current_user.id)
    @income = @patient_record.income

    if @income < 3200
      @subsidy_C = 0.8
      @subsidy_B2 = 0.6
      @subsidy_B1 = 0.4
      @subsidy_A = 0
    elsif @income > 3200 && @income < 4000
      @subsidy_C = 0.6
      @subsidy_B2 = 0.4
      @subsidy_B1 = 0.2
      @subsidy_A = 0
    else @income > 4000 && @income < 6000
      @subsidy_C = 0.4
      @subsidy_B2 = 0.2
      @subsidy_B1 = 0
      @subsidy_A = 0
    end

    @ward = Ward.all
    @wardA = Ward.find_by(ward_type: 'A')
    @wardB1 = Ward.find_by(ward_type: 'B1')
    @wardB2 = Ward.find_by(ward_type: 'B2')
    @wardC = Ward.find_by(ward_type: 'C')


    if @patient.update!(patient_admission_params)
      @patient_record.minus_medisave(patient_admission_params[:claim_medisave])
      if (patient_admission_params[:ward_selected] == 'A')
        @wardA.change_availability
      elsif (patient_admission_params[:ward_selected] == 'B1')
        @wardB1.change_availability
      elsif (patient_admission_params[:ward_selected] == 'B2')
        @wardB2.change_availability
      elsif (patient_admission_params[:ward_selected] == 'C')
        @wardC.change_availability
      end
      redirect_to patient_admissions_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def patient_admission_params
    params.require(:patient).permit(:NRIC, :means_testing, :user_id, :ward_selected, :bill_amount, :claim_medisave, :pay_cash, :confirm)
  end

end
