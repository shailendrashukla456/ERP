class EmployeesController < ApplicationController

  skip_before_action:verify_authenticity_token

  def index
    @employees = Employee.all
    render json: @employees
  end

  def show
    @employee = Employee.find_by(id: params[:id])
    render json: @employee
  end

  def create
    
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee
    else
      render json: { error: @employee.errors }
    end
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: {error: @employee.errors}
    end
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    if @employee
      @employee.destroy
      render json: {message: "data successfully deleted"}
    else
      render json: { error: "please enter the valid id"}
    end
  end


  private
  def employee_params
    params.require(:employee).permit(:name, :email, :contact, :password, :address, :department_id, :leavetype_id, :salary_id)
  end

end


