class PublicRecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(public: true)
    @recipes = @recipes.order(:created_at).reverse_order
  end
end
