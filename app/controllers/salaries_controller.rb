class SalariesController < ApplicationController

  skip_before_action:verify_authenticity_token

  def index
    @salaries = Salary.all
    render json: @salaries
  end

  def show
    @salary = Salary.find_by(id: params[:id])
    render json: @salary
  end

  def create
    
    @salary = Salary.new(salary_params)
    if @salary.save
      render json: @salary
    else
      render json: { error: @salary.errors }
    end
  end

  def update
    @salary = Salary.find_by(id: params[:id])
    if @salary.update(salary_params)
      render json: @salary
    else
      render json: {error: @salary.errors}
    end
  end

  def destroy
    @salary = Salary.find_by(id: params[:id])
    if @salary
      @salary.destroy
      render json: {message: "data successfully deleted"}
    else
      render json: { error: "please enter the valid id"}
    end
  end


  private
  def salary_params
    params.require(:salary).permit(:amount, :position)
  end

end


