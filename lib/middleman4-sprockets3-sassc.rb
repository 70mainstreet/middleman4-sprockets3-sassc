require 'middleman-core'

Middleman::Extensions.register(:sprockets3_sassc) do
  require 'middleman4-sprockets3-sassc/extension'
  Middleman4::Sprockets3::SassC::Extension
end