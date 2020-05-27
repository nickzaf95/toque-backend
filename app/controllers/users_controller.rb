class UsersController < ApplicationController

    def sign_in
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            render json: { username: user.username, token: generate_token( {id: user.id}), families: user.families, recipes: user.recipes }
        else
            render json: { message: "Incorrect username or password. PLease try again!" }
        end

    end

    def validate
        # Check if we can decode the token we've been sent and find a valid user
        if get_user
          # If so, send back that user's username and a newly generated token
          render json: { username: get_user.username, token: generate_token(id: get_user.id), families: get_user.families, recipes: get_user.recipes}
        else
          # Otherwise, send back an error
          render json: { error: "You are not authorized" }
        end
    end

    def signup
        user = User.create(
            username: params[:username],
            password: params[:password],
            full_name: params[:full_name],
            email: params[:email],
        )

        if User.find_by(username: user.username)
            render json: { message: "Success!"}
        else
            render json: { message: "Please fill out the form as required" }
        end
    end

end
