class FamiliesController < ApplicationController

    def create_family
        family = Family.new(name: params[:name], code: params[:code])
        user = User.find_by(username: params[:username])

        if user
            family.save
            Inclusion.create(user: user, family: family)
            render json: { message: "Success! Family created."}
        else
            render json: { error: "Please sign in before creating a family" }
        end
    end

    def index
        user = get_user

        families = user.families

        if user
            render json: { families: families,  }
        else 
            render json: { message: "No User found."}
        end
    end

    def show
        family = Family.find_by(id: params[:id])

        recipes = family.recipes

        if family
            render json: { recipes: recipes}
        else
            render json: { message: "No recipes found."}
        end
    end

    def join
        user = User.find_by(username: params[:username])
        family = Family.find_by(name: params[:name])

        if family
            if family.code == params[:code]
                Inclusion.create(user: user, family: family)
                render json: { message: "Success! You have joined this family!"}
            else
                render json: { message: "The code you have entered is incorrect"}
            end
        else
            render json: { message: "This family does not exist"}
        end
    end


end
