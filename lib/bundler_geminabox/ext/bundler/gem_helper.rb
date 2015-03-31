require 'bundler/gem_helper'

# Lets just hijack the rubygem_push method.
# Should probably alias it so we can switch on a flag, but... whatever.
# I'll do it later.

module Bundler
  class GemHelper
    def install_with_geminabox
      install_without_geminabox

      if Rake::Task["release"].full_comment
        install_comment = Rake::Task["release"].full_comment.gsub("Rubygems", "your geminabox server")
        if Rake::Task["release"].respond_to?(:clear_comments)
          Rake::Task["release"].clear_comments
        else
          Rake::Task["release"].instance_variable_set("@comment", nil)
          Rake::Task["release"].instance_variable_set("@full_comment", nil)
        end
        Rake::Task["release"].add_description install_comment
      end
      GemHelper.instance = self
    end
    alias_method :install_without_geminabox, :install
    alias_method :install, :install_with_geminabox


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
