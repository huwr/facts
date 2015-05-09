require 'sinatra'
require 'json'
require_relative 'facts'

class FactApp < Sinatra::Application
  require_relative 'configuration'

  set :root, File.dirname(__FILE__)

  get '/test' do
    'we\'re up!'
  end

  get '/' do
    name = params[:name] || settings.full_name
    erb :index, :locals => {:fact => Facts.sample.gsub('$NAME', name)}
  end

  get '/all' do
    headers \
      "Content-Type" => "application/json"
    Facts.to_json
  end

end

