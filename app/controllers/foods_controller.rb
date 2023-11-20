class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      # redirect to the page that called this action
      redirect_to request.referer, notice: 'Food successfully created.'
    else
      render :new, alert: 'Food not created.'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      redirect_to root_path, notice: 'Food successfully deleted.'
    else
      redirect_to root_path, alert: 'Food not deleted.'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price_dollars)
  end
end
