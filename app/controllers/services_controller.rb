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

end