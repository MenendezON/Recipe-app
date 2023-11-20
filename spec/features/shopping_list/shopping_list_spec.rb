require 'rails_helper'

# RSpec.describe ShoppingLists, type: :controller do
#   let(:recipe) { FactoryBot.create(:recipe) }
#   let(:inventory) { FactoryBot.create(:inventory) }

#   describe 'GET #index' do
#     context 'when the recipe is public' do
#       before do
#         recipe.update(public: true)
#         get :index, params: { recipe_id: recipe.id, inventory: { inventory_id: inventory.id } }
#       end

#       it 'renders the index template' do
#         expect(response).to render_template(:index)
#       end

#       it 'assigns the recipe, inventory, shopping list, and total foods value' do
#         expect(assigns(:recipe)).to eq(recipe)
#         expect(assigns(:inventory)).to eq(inventory)
#         expect(assigns(:shopping_list)).to be_present
#         expect(assigns(:total_foods_value)).to be_a(Numeric)
#       end
#     end

#     context 'when the recipe is not public' do
#       before do
#         recipe.update(public: false)
#         get :index, params: { recipe_id: recipe.id, inventory: { inventory_id: inventory.id } }
#       end

#       it 'renders the unauthorized template' do
#         expect(response).to render_template('unauthorized')
#       end
#     end
#   end
# end
