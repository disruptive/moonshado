require 'moonshado'
require 'rails'

module Moonshado
  class Engine < Rails::Engine
    engine_name :moonshado
    
    
    # Config defaults
    config.api_key = ''
    config.client_id = ''
    config.short_code = ''
    config.keyword = ''

    # Load rake tasks
    rake_tasks do
      load File.join(File.dirname(__FILE__), '../rails/railties/tasks.rake')
    end
  end
  

end