class DepartmentsController < ApplicationController

skip_before_action:verify_authenticity_token

  def index
    @departments = Department.all
    render json: @departments
  end

  def show
    @department = Department.find_by(id: params[:id])
    render json: @department
  end

  def create
    
    @department = Department.new(depart_params)
    if @department.save
      render json: @department
    else
      render json: { error: @department.errors }
    end
  end

  def update
    @department = Department.find_by(id: params[:id])
    if @department.update(depart_params)
      render json: @department
    else
      render json: {error: @department.errors}
    end
  end

  def destroy
    @department = Department.find_by(id: params[:id])
    if @department
      @department.destroy
      render json: {message: "data successfully deleted"}
    else
      render json: { error: "please enter the valid id"}
    end
  end


  private
  def depart_params
    params.require(:department).permit(:department_name)
  end

end

