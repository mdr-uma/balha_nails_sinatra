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
        client = current_client
        # if params[:service_name] == nil
        #     redirect '/appointments/new' 
        # end  
        @appointments = Appointment.create(service_name: params[:service_name], date: params[:date], :client_id => client.id)
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

    patch '/appointments/:id' do
         appointment = Appointment.find_by(id: params[:id])
            # if !params[:service_name].empty?
                appointment.update(service_name: params[:service_name])

                 redirect "/appointments"
            # else        
                # redirect "/appointments/#{params[:id]}/edit"  
            # end 
    end
    
    delete '/appointments/:id' do
        @appointment = current_client.appointments.find_by(id: params[:id])
        if @appointment && @appointment.destroy
            redirect "/appointments"
        else
            redirect "/appointments/#{params[:id]}"
    end

    end

end