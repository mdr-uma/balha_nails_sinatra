class ClientController < Sinatra::Base
    
    get '/signup' do
    if logged_in?
        redirect '/services'
    else
        erb :'clients/signup'
    end
  end

end