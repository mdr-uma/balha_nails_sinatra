require './config/environment'
#  require 'sinatra/base'
 require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable :sessions
    #set :session_secret, "password_security"
    use Rack::Session::Cookie,  :key => 'rack.session',
                                :path => '/',
                                # prevents tampering with session hash
                                :secret => 'your_secret'
    use Rack::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!current_client
    end

    def current_client
      @current_client ||= Client.find_by(id: session[:client_id]) if session[:client_id]
    end
  end


end
