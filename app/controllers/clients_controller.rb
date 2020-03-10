class ClientsController < ApplicationController
    
    get '/signup' do
        if logged_in?
            redirect '/appointments'
        else
            erb :'clients/signup'
        end
    end

    post '/signup' do
    @client = Client.new(name: params[:name], phone_num: params[:phone_num], email: params[:email], password: params[:password])
        if @client.save && @client.authenticate(params[:password])
            session[:client_id] = @client.id
            redirect '/appointments'
        else
            redirect '/signup'
        end
    end
    # && @client.name != "" && @client.email != ""

    get '/login' do
        if logged_in?
            redirect '/appointments'
        else
        erb :'/clients/login'
        end
    end

    post '/login' do
    client = Client.find_by(email: params[:email])
        if client && client.authenticate(params[:password])
            session[:client_id] = client.id
            redirect '/appointments'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
        else !logged_in?
            redirect '/login'
        end
    end

end