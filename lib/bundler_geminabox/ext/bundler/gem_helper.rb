# Lets just hijack the rubygem_push method.
# Should probably alias it so we can switch on a flag, but... whatever.
# I'll do it later.

module Bundler
  class GemHelper
    protected
    def rubygem_push(path)
      if Pathname.new("~/.gem/geminabox").expand_path.exist?
        sh("gem inabox #{path}")
        Bundler.ui.confirm "Pushed #{name} #{version} to your geminabox server."
      else
        raise "You do not have geminabox configured. Please run `gem inabox --configure`"
      end
    end
  end
end
