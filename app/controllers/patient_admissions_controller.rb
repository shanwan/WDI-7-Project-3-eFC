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
    elsif @income > 4000 && @income < 6000
      @subsidyC = 0.4
      @subsidyB2 = 0.2
      @subsidyB1 = 0
      @subsidyA = 0
    end

    @patient = PatientAdmission.find_by(user_id: current_user.id)
    @ward = Ward.all
    @wardA = Ward.find_by(ward_type: 'A')
    # puts "**************** new"
    # puts @ward
    # puts "**************** new"
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
