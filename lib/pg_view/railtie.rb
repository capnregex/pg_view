require 'pg_view'
require 'rails'

class PgView
  class Railtie < ::Rails::Railtie
    railtie_name :pg_view
    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/**/*.rake").each do |file|
        load file
      end
    end
  end
end
