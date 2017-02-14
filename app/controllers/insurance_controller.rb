class InsuranceController < ApplicationController
# before_action :is_authenticated

  def index
    #create an instance to be used, refer to the model,
    #find by user id for all insurances, check that it matches current user's id,
    #before executing the following action
    if current_user
      @insurance = Insurance.find_by(user_id: current_user.id)
    else
      redirect_to new_insurance_path #prefix_path or prefix_url
    end
  end

  def new
    @insurance= Insurance.new
  end

  def create
    @insurance= User.Insurance.create(insurance_params)
    if @insurance.save
      flash[:success] = "Policy Details saved"
      redirect_to insurance_index_path
    else
      render :new
    end

    def update
      #computer does not remember that edit was ran
      @insurance=Insurance.find_by_id(params[:id]).update
    end

    def edit
      @insurance=Insurance.find_by_id(params[:id])
    end

    def delete
      @insurance=Insurance.find_by_id(params[:id]).delete
      redirect_to insurance_index_path
    end
end
