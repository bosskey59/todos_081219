class SessionController < ApplicationController

    get '/login' do
      erb :'session/login'  
    end

    post '/login' do
        
        # figure out if the user exists db
        @user = User.find_by(email:params[:email])
        # if they do exist verify password
        if @user && @user.authenticate(params[:password])
            # set our sesssion hash and redirect accordingly
            session[:user_id] = @user.id
            redirect '/todos'
        else
            redirect '/login'
        end

        
    end

end