class LeavetypesController < ApplicationController

  skip_before_action:verify_authenticity_token

  def index
    @leavetypes = Leavetype.all
    render json: @leavetypes
  end

  def show
    @leavetype = Leavetype.find_by(id: params[:id])
    render json: @leavetype
  end

  def create
    
    @leavetype = Leavetype.new(leavetype_params)
    if @leavetype.save
      render json: @leavetype
    else
      render json: { error: @leavetype.errors }
    end
  end

  def update
    @leavetype = Leavetype.find_by(id: params[:id])
    if @leavetype.update(leavetype_params)
      render json: @leavetype
    else
      render json: {error: @leavetype.errors}
    end
  end

  def destroy
    @leavetype = Leavetype.find_by(id: params[:id])
    if @leavetype
      @leavetype.destroy
      render json: {message: "data successfully deleted"}
    else
      render json: { error: "please enter the valid id"}
    end
  end


  private
  def leavetype_params
    params.require(:leavetype).permit(:name)
  end

end

