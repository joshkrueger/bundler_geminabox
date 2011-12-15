require "bundler_geminabox/version"


module BundlerGeminabox
  # Your code goes here...
  class GemHelper
    def self.install
      require "bundler_geminabox/ext/bundler/gem_helper"
    end
  end
end
