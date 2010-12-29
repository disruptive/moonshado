class MoonshadoViewsGenerator < Rails::Generators::Base
  desc "Put the moonshado views in place"

  def self.source_root
    @_moonshado_source_root ||= File.join(File.dirname(__FILE__), "moonshado_views_templates")
  end

  def install
    strategy          = "standard"
    template_strategy = "erb"

    directory "#{strategy}/#{template_strategy}", "app/views"
  end
end
