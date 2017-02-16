class InsuranceController < ApplicationController
before_action :is_authenticated

  def index
    #create an instance to be used, refer to the model,
    #find by user id for all insurances, check that it matches current user's id,
    #before executing the following action
    if current_user # if you're logged in
      @insurance = InsuranceTable.where(user_id: current_user.id)
      @patient = PatientAdmission.find_by user_id: current_user.id, confirm: false
    else
      redirect_to new_insurance_path #prefix_path or prefix_url
    end
  end

  def show
    @insurance = InsuranceTable.find(params[:id])
    if @insurance.user_id == current_user.id
      render :show
    else
      redirect_to insurance_index_path
    end
  end

  def new
    @insurance= InsuranceTable.new
  end

  def create
    @insurance= InsuranceTable.new(insurance_params)
    @insurance["user_id"]= current_user.id #need to referrence to a user id as it is a foreign key
    if @insurance.save
      flash[:success] = "Policy Details saved"
      redirect_to insurance_index_path
    else
      render :new
    end
  end

    def update
      #computer does not remember that edit was ran
      @insurance=InsuranceTable.find_by_id(params[:id])
      if @insurance.update(insurance_params)
        redirect_to insurance_index_path
      else
        redirect_to edit_insurance_path
      end
    end

    def edit
      @insurance=InsuranceTable.find_by_id(params[:id])
    end

    def destroy

      @insurance=InsuranceTable.find(params[:id])
      @insurance.destroy
      redirect_to insurance_index_path
    end

    private

    def insurance_params
      params.require(:insurance).permit(:insurance_company, :id, :insurance_name, :insurance_type, :claimable_amount)
    end
end
