class ClientsController < ApplicationController
    
    get '/signup' do
        if logged_in?
            redirect '/services'
        else
            erb :'clients/signup'
        end
    end

    post '/signup' do
    @client = Client.new(name: params[:name], phone_num: params[:phone_num], email: params[:email], password: params[:password])
        if @client.save && @client.name != "" && @client.email != "" && @client.authenticate(params[:password])
            session[:client_id] = @client.id
            redirect '/services'
        else
            redirect '/signup'
        end
    end

    get '/login' do
        if logged_in?
            redirect '/services'
        else
        erb :'/clients/login'
        end
    end

    post '/login' do
    client = client.find_by(name: params[:name])
        if client && client.authenticate(params[:password])
        session[:client_id] = client.id
        redirect '/services'
        else
        redirect '/login'
        end

    end


end