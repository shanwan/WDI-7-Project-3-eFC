class PatientsController < ApplicationController
    def show
      @patients_record = Patient.find(params[:id])
    end

    # def new
    #   @patient_record = Patient.new
    #   # @parks = Park.all
    #   # this is a new instance created but you have to create another new when posting. if the user leaves the page as it is for 2 days, you may have already lost the data
    # end

    def edit
      @patient_record = Patient.find(params[:id])
      debugger
    end

    def update
      @patient_record = current_user.patient.find(params[:id])
      debugger
      if @patient_record.update(patient_params)
      redirect_to patient_admissions_show_path
      else
      render 'edit'
      end
      debugger
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
