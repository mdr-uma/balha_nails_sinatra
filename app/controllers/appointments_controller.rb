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
        @appointments = Appointment.create(service_name: params[:service_name], date: params[:date], :client_id => client.id)
        flash[:message] = "Your appointment is Successfully created."
        redirect '/appointments'
    end
    
    get '/appointments/:id' do
        if !logged_in?
            redirect '/login'
        end
        @appointment = Appointment.find_by(id: params[:id])
        if current_client.id != @appointment.client_id
            redirect '/appointments'
        else
            erb :"appointments/show"
        end
    end 

    get '/appointments/:id/edit' do
        if !logged_in?
            redirect '/login'
        end
            @appointment = current_client.appointments.find_by(id: params[:id])
                erb :"/appointments/edit"
    end

    patch '/appointments/:id' do
         appointment = current_client.appointments.find_by(id: params[:id])
         appointment.update(service_name: params[:service_name], date: params[:date])
         flash[:message] = "Your appointment is Successfully updated."
         redirect "/appointments" 
    end
    
    delete '/appointments/:id' do
        @appointment = current_client.appointments.find_by(id: params[:id])
        if @appointment && @appointment.destroy
            flash[:message] = "Your appointment is Successfully deleted."
            redirect "/appointments"
        else
            redirect "/appointments/#{params[:id]}"
        end

    end

end