class TodosController < ApplicationController

    # Index Route (display all)
    get '/todos' do
        if logged_in?
            @user = current_user
            # @todos = Todo.where(user_id: session[:user_id])
            @todos = @user.todos
            erb :"todos/index"
        else
            redirect "/login"
        end
    end

    #new page( show form)
    get '/todos/new' do
        erb :"todos/new"
    end

    # show page (display one todo)
    get '/todos/:id' do
        @todo = Todo.find_by(id:params[:id])
        # @todo_2 = Todo.find_by_id(params[:id])
        if @todo
            erb :"todos/show"
        else
            redirect '/todos'
        end
    end

    # edit
    get '/todos/:id/edit' do 
        @todo = Todo.find_by(id:params[:id])
        erb :"todos/edit"
    end

    patch '/todos/:id' do 
        @todo = Todo.find_by(id:params[:id])
        
        # if params[:todo][:done]
        #     params[:todo][:done] = true
        # else
        #     params[:todo][:done] = false
        # end
    
        params[:todo][:done] = params[:todo][:done]? true : false

        if @todo.update(params[:todo])
            redirect "/todos/#{@todo.id}"
        else
            redirect "/todos/#{@todo.id}/edit"
        end
    end

    # create route
    post '/todos' do
        params[:done] = params[:done]? true : false
        @todo = Todo.new(params)
        if @todo.save
            redirect "/todos/#{@todo.id}"
        else
            redirect "/todos/new"
        end 
    end

    # delete
    delete '/todos/:id' do
        todo = Todo.find_by(id:params[:id])
        if todo.destroy
            redirect "/todos"
        else
            redirect "/todos/#{todo.id}"
        end 
    end

end