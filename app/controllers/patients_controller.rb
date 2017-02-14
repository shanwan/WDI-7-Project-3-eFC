class PatientsController < ApplicationController
    def show
      @patients_record = current_user.patient.find(params[:id])
    end

    def new
      puts @patient_record
      @patient_record = current_user.patients.find(params[:id])
      puts @patient_record
    end

    def edit
      puts @patient_record
      @patient_record = current_user.patient.find(params[:id])
      puts @patient_record
    end

    def update
      puts @patient_record
      @patient_record = current_user.patient.find(params[:id])
      puts @patient_record
      if @patient_record.update(patient_params)
      redirect_to patient_admissions_show_path
      else
      render 'edit'
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

    # def destroy
    #   @patient = Patient.find(params[:id])
    #   @patient.destroy
    #
    #   redirect_to patient_admissions_show_path
    # end

    private
    # by adding the below, if anyone changes the keys to send through via the chrome dev tool for eg, the data cannot be passed through via below
    def patient_params
      params.require(:patient_record).permit(:means_testing)
    end

  end
