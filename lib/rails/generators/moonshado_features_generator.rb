class MoonshadoFeaturesGenerator < Rails::Generators::Base
  desc "Put the clearance features in place"

  def self.source_root
    @_moonshado_source_root ||= File.join(File.dirname(__FILE__), "moonshado_features_templates")
  end

  def install
    directory "features"

    inject_into_file "features/support/paths.rb", :after => "# Add more mappings here.\n" do
"    when /the messages page/i
      messages_path
    when /the moonshado message receiving page/i
      moonshado_receive_path
    when /the moonshado message status update page/i
      moonshado_report_path\n"
    end
  end
end
