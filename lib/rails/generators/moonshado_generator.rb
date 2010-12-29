require 'rails/generators/active_record'

class MoonshadoGenerator < ActiveRecord::Generators::Base
  desc "establish the files needed for Moonshado"

  def self.source_root
    @_moonshado_source_root ||= File.join(File.dirname(__FILE__), "moonshado_templates")
  end

  def install
    template "moonshado_sample.yml", "config/moonshado.yml"

    message_model = "app/models/message.rb"
    if File.exists?(message_model)
      inject_into_class message_model, User do
        "include Moonshado::User"
      end
    else
      template "message.rb", message_model
    end

    if File.exists?("spec")
      template "factories.rb", "spec/factories/moonshado.rb"
    else
      template "factories.rb", "test/factories/moonshado.rb"
    end

    migration_template "migrations/create_messages.rb", "db/migrate/create_messages.rb"

    readme "README"
  end

end
