class Users::DaysController < ApplicationController
  before_action :set_day, only: [:update, :destroy]

  def index
    @days = Day.all
  end

  def show
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)

    respond_to do |format|
      if @day.save
        format.html 
      else
        format.html 
      end
    end
  end

  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html 
      else
        format.html 
      end
    end
  end

  def destroy
    @day.destroy
    respond_to do |format|
      format.html 
    end
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def day_params
    params.fetch(:day, {})
  end

end
