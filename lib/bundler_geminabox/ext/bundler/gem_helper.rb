require 'bundler/gem_helper'

# Lets just hijack the rubygem_push method.
# Should probably alias it so we can switch on a flag, but... whatever.
# I'll do it later.

module Bundler
  class GemHelper
    def install
      desc "Build #{name}-#{version}.gem into the pkg directory."
      task 'build' do
        build_gem
      end

      desc "Build and install #{name}-#{version}.gem into system gems."
      task 'install' do
        install_gem
      end

      desc "Create tag #{version_tag} and build and push #{name}-#{version}.gem to your geminabox server"
      task 'release' do
        release_gem
      end

      GemHelper.instance = self
    end

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
