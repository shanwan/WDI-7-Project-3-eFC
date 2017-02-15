class PatientAdmissionsController < ApplicationController

  before_action :is_authenticated

  def index
    @patient = PatientAdmission.find_by(NRIC: params[:NRIC])
    @ward = Ward.all
    # puts "**************** index"
    # puts @ward
  end

  def new
    @patient_record = Patient.find_by(id: current_user.id)
    # puts "**************** income"
    # puts "#{@patient_record.income}"
    # puts "**************** income"
    @income = @patient_record.income

    # @formula_to_use =
    # @formulasall = FormulaTable.all
    # @formulasall.each do |formula|
    #   if (formula.Income_Min..formula.Income_Max).cover?(@income)
    #     @formula_to_use = formula
    #   end
    # end

    if @income < 3200
      @subsidyC = 0.8
      @subsidyB2 = 0.6
      @subsidyB1 = 0.4
      @subsidyA = 0
    elsif @income > 3200 && @income < 4000
      @subsidyC = 0.6
      @subsidyB2 = 0.4
      @subsidyB1 = 0.2
      @subsidyA = 0
    else @income > 4000 && @income < 6000
      @subsidyC = 0.4
      @subsidyB2 = 0.2
      @subsidyB1 = 0
      @subsidyA = 0
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
      @subsidyC = 0.8
      @subsidyB2 = 0.6
      @subsidyB1 = 0.4
      @subsidyA = 0
    elsif @income > 3200 && @income < 4000
      @subsidyC = 0.6
      @subsidyB2 = 0.4
      @subsidyB1 = 0.2
      @subsidyA = 0
    else @income > 4000 && @income < 6000
      @subsidyC = 0.4
      @subsidyB2 = 0.2
      @subsidyB1 = 0
      @subsidyA = 0
    end

    @patient = PatientAdmission.find_by(user_id: current_user.id)
    @ward = Ward.all
    @wardA = Ward.find_by(ward_type: 'A')
    @wardB1 = Ward.find_by(ward_type: 'B1')
    @wardB2 = Ward.find_by(ward_type: 'B2')
    @wardC = Ward.find_by(ward_type: 'C')
  end

  def update
    @patient = PatientAdmission.find_by(user_id: params[:user_id])

    @income = @patient_record.income

    if @income < 3200
      @subsidyC = 0.8
      @subsidyB2 = 0.6
      @subsidyB1 = 0.4
      @subsidyA = 0
    elsif @income > 3200 && @income < 4000
      @subsidyC = 0.6
      @subsidyB2 = 0.4
      @subsidyB1 = 0.2
      @subsidyA = 0
    else @income > 4000 && @income < 6000
      @subsidyC = 0.4
      @subsidyB2 = 0.2
      @subsidyB1 = 0
      @subsidyA = 0
    end

    @patient = PatientAdmission.find_by(user_id: current_user.id)
    @ward = Ward.all
    @wardA = Ward.find_by(ward_type: 'A')
    @wardB1 = Ward.find_by(ward_type: 'B1')
    @wardB2 = Ward.find_by(ward_type: 'B2')
    @wardC = Ward.find_by(ward_type: 'C')

    if @patient.update(patient_admission_params)
      p '*' * 50
      if (params[:ward_selected] == 'A')
        @wardA.availability -= 1
      elsif (params[:ward_selected] == 'B1')
        @wardB1.availability -= 1
      elsif (params[:ward_selected] == 'B2')
        @wardB2.availability -= 1
      elsif (params[:ward_selected] == 'C')
        @wardC.availability -= 1
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
    params.require(:patient).permit(:NRIC, :means_testing, :user_id, :id, :ward_selected, :bill_amount, :claim_medisave, :pay_cash)
  end

end
