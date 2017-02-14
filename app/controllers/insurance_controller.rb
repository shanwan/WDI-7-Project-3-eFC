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

  def edit
    @insurance_record = Insurance.find(params[:id])
  end

  def update
    @insurance_record = Insurance.find(params[:id])
    if @insurance_record.update(insurance_params)
    redirect_to insurance_show_path
    else
    render 'edit'
    end
  end

  def create
    @insurance_record = Insurance.new(insurance_params)
    if @insurance_record.save
      redirect_to @insurance_record
    else
      render "new"
    end
  end

  def destroy
    @insurance = Insurance.find(params[:id])
    @insurance.destroy
  redirect_to insurance_show_path
  end

end
