class WardsController < ApplicationController
  def show
    @ward = Ward.find(params[:id])
  end

  def new
    @ward = Ward.find(params[:id])
  end

  def edit
    @ward = Ward.find(params[:id])
  end

  def update
    @ward = Ward.find(params[:id])
    if @ward.update(patient_params)
    redirect_to #???
    else
    render 'edit' #???
    end
  end
end
