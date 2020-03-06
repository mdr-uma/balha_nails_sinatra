class ServicesController < ApplicationController
    get '/services' do
        if !logged_in?
            redirect '/login'
         elsif logged_in?
            @services = Service.all
            @client = current_client 
            erb :'services/index'
          end
    end

    get '/services/new' do
        if !logged_in?
            redirect '/login'
        end
        erb :'services/new'
    end

    post '/services' do
        #  binding.pry
        client = current_client
        # if params[:service_name].empty?
        #     redirect '/services/new' 
        # end  
        @service = Service.create(service_name: params[:service_name], :client_id => client.id)
        redirect '/services'
    end

end