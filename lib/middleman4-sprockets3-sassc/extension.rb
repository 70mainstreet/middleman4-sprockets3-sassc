module Middleman4
  module Sprockets3
    module SassC
      class Extension < Middleman::Extension
        def initialize(*)
          super
          require 'middleman4-sprockets3-sassc/monkey-patches'
        end
      end
    end
  end
end
