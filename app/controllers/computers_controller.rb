class ComputersController < ApplicationController
  def new
    @computer = Computer.new
  end

  def index
    @computers = Computer.all
  end

  def create
    @workflow = CreatesComputer.new(params[:computer])
    @workflow.create
    if @workflow.success?
      redirect_to computers_path
    else
      @computer = @workflow.computer
      render :new
    end
  end
end
