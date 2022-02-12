class RecipesController < ApplicationController

    def index 
        @current_user
        render json: @current_user.recipes, status: :created
    end 

    def create 
        recipe = @current_user.recipes.create!(recipe_params) 
        render json: recipe, status: :created
    end

    private 

    def recipe_params 
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end

end
