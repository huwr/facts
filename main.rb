require 'sinatra'
require 'json'
require_relative 'facts'

class FactApp < Sinatra::Application
  require_relative 'configuration'

  set :root, File.dirname(__FILE__)

  def possessive_pronoun(gender)
    gender.downcase == 'f' ? 'her' : 'his'
  end

  def subjective_pronoun(gender)
    gender.downcase == 'f' ? 'she' : 'he'
  end

  def objective_pronoun(gender)
    gender.downcase == 'f' ? 'her' : 'him'
  end

  def capitalise_first_letter!(sentence)
    sentence.sub!(/^(.)/) { Regexp.last_match[1].capitalize }
  end

  get '/test' do
    'we\'re up!'
  end

  get '/' do
    name = params[:name] || settings.full_name
    gender = params[:gender] || settings.gender

    fact = FACTS.sample.gsub('$NAME', name)
      .gsub('$POSS', possessive_pronoun(gender))
      .gsub('$SUBJ', subjective_pronoun(gender))
      .gsub('$OBJ', objective_pronoun(gender))

    capitalise_first_letter!(fact)

    erb :index, :locals => {:fact => fact}
  end

  get '/all' do
    headers \
      'Content-Type' => 'application/json'
    FACTS.to_json
  end
end
