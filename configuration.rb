configure do
  set :first_name, 'Milton'
  set :last_name, 'Freehouse'

  set :full_name, [settings.first_name, settings.last_name].join(' ')
  set :gender, 'm'
end
