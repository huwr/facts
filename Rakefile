require 'rubocop/rake_task'

RuboCop::RakeTask.new

desc 'run app locally'
task run: 'Gemfile.lock' do
  require_relative 'main'
  FactApp.run!
end
