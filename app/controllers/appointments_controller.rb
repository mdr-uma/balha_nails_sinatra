class AppointmentsController < ApplicationController
    get '/appointments' do
        if !logged_in?
            redirect '/login'
         elsif logged_in?
            @appointments = Appointment.all
            @client = current_client 
            erb :'clients/show'
          end
    end

    get '/appointments/new' do
        if !logged_in?
            redirect '/login'
        end
        erb :'appointments/new'
    end

    post '/appointments' do
        # binding.pry
        client = current_client
        if params[:service_name].empty?
            redirect '/appointments/new' 
        end  
        @appointments = Appointment.create(service_name: params[:service_name], :client_id => client.id)
        redirect '/appointments'
    end
    
    get '/appointments/:id' do
        if !logged_in?
            redirect '/login'
        end
        @appointment = Appointment.find_by(id: params[:id])
        erb :"appointments/show"
    end 

    get '/appointments/:id/edit' do
        if !logged_in?
            redirect '/login'
        end
        @appointment = Appointment.find_by(id: params[:id])
        erb :"/appointments/edit"
    end
    

end