class UsersController < ApplicationController

    def sign_in
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            render json: { username: user.username, token: generate_token( {id: user.id}) }
        else
            render json: { message: "Incorrect username or password. PLease try again!" }
        end

    end

    def validate
        # Check if we can decode the token we've been sent and find a valid user
        if get_user
          # If so, send back that user's username and a newly generated token
          render json: { username: get_user.username, token: generate_token(id: get_user.id)}
        else
          # Otherwise, send back an error
          render json: { error: "You are not authorized" }
        end
    end

end
