class Users::DaysController < Users::ApplicationController
  before_action :set_day, only: %i[show update destroy]
  before_action :find_plan, only: %i[show update destroy]

  def index
    @days = Day.all
  end

  def show     
    # puts @day.inspect
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

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end
end
