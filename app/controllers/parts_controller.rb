class PartsController < ApplicationController
  def new
    @part = Part.new
  end

  def create
    @workflow = CreatesPart.new(
    name: params[:part][:name],
    part: params[:part][:part],
    compatability: params[:part][:compatability]) 
    @workflow.create
    if @workflow.success?
      redirect_to parts_path
    else
      @part = @workflow.part
      render :new 
    end
  end

  def index
    @part = Part.all
  end

end
