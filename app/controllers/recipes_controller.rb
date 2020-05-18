class RecipesController < ApplicationController

    def create_recipe

        user = User.find_by(username: params[:username])

        if user
            if params[:image]
                if params[:video]
                    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], method: params[:method], image: params[:image], video: params[:video], user: user)
                else
                    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], method: params[:method], image: params[:image], video: "", user: user)
                end
            else
                recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], method: params[:method], image: null, video: null, user: user)
            end
            
            if recipe
                render json: { message: "Success! Recipe created."}
            else
                render json: { error: "Unfortunately your recipe was not created. Please fill out the form again."}
            end
        else
            render json: { error: "Unfortunately you are not signed in. Please sign in."}
        end
    end

end
