class PatientsController < ApplicationController

  before_action :is_authenticated

    def show
      @patients_record = Patient.find(params[:id])
    end

    def new
      @patient_record = Patient.find(params[:id])
    end

    def new2
     @patient_record = Patient.find(params[:id])
    end

    def edit
      @patient_record = Patient.find(params[:id])
    end

    def edit2
      @patient_record = Patient.find(params[:id])
    end

    def update
      @patient_record = Patient.find(params[:id])
      if @patient_record.update(patient_params)
      # redirect_to @patient_record
      redirect_to edit2_patient_path(@patient_record)
      else
      render 'edit'
      end
    end

    def update2
      @patient_record = Patient.find(params[:id])
      if @patient_record.update(patient_params)
        redirect_to insurance_index_path
      else
      render 'edit2'
      end
    end

    def create
      @patient_record = Patient.new(patient_params)
      if @patient_record.save
        redirect_to @patient_record
      else
        render "new"
        # you render so that you have the errors stored
      end
    end

  def create2
    @patient_record = Patient.find(params[:id])
    @user = User.find(params[:id])
    PatientMailer.messagemail(@user, @patient_record.next_of_kin_email).deliver_now
    render 'new'
  end

    # def destroy
    #   @patient = Patient.find(params[:id])
    #   @patient.destroy
    #
    #   redirect_to patient_admissions_show_path
    # end

    private
    # by adding the below, if anyone changes the keys to send through via the chrome dev tool for eg, the data cannot be passed through via below
    def patient_params
      params.require(:patient_record).permit(:means_testing, :medisave_access)
    end

  end
