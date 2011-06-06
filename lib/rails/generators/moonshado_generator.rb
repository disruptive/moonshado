require 'rails/generators'
require 'rails/generators/migration'

class MoonshadoGenerator < Rails::Generators::Base
  desc "establish the files needed for Moonshado Engine Integration"
  include Rails::Generators::Migration
  
  def self.source_root
    File.join(File.dirname(__FILE__), 'moonshado_templates')
  end
  
  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def copy_initializer_file
    copy_file 'initializer.rb', 'config/initializers/moonshado.rb'
  end

  def install
    if File.exists?("spec")
      template "factories.rb", "spec/factories/moonshado.rb"
    else
      template "factories.rb", "test/factories/moonshado.rb"
    end
    migration_template 'migration.rb', 'db/migrate/moonshado_create_messages.rb'
    
    readme "README"
  end

end
