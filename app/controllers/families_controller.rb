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
            render json: { families: families }
        else 
            render json: { message: "No User found."}
        end
    end

end
