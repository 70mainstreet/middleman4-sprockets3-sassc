module ::Sprockets::SassC
  class SassProcessor < ::Sprockets::SassProcessor
    def call(input)
      context = input[:environment].context_class.new(input)
      options = {
          filename: input[:filename],
          syntax: self.class.syntax,
          load_paths: input[:environment].paths,
          importer: ::SassC::Rails::Importer,
          sprockets: {
              context: context,
              environment: input[:environment],
              dependencies: context.metadata[:dependency_paths]
          }
      }
      engine = ::SassC::Engine.new(input[:data], options)

      css = Sprockets::Utils.module_include(::SassC::Script::Functions, @functions) do
        engine.render
      end

      context.metadata.merge(data: css)
    end
  end

  class ScssProcessor < SassProcessor
    def self.syntax
      :scss
    end
  end
end

class ::Middleman::Sprockets::Extension
  def use_sassc_if_available
    require 'sassc-rails'
    if defined?(::SassC::Rails)
      environment.register_engine '.sass', ::Sprockets::SassC::SassProcessor
      environment.register_engine '.scss', ::Sprockets::SassC::ScssProcessor

      logger.info '== Sprockets will render css with SassC'
    elsif defined?(::SassC)
      require 'sprockets/sassc_processor'
      environment.register_transformer 'text/sass', 'text/css', ::Sprockets::SasscProcessor.new
      environment.register_transformer 'text/scss', 'text/css', ::Sprockets::ScsscProcessor.new

      logger.info '== Sprockets will render css with SassC'
    end
  rescue LoadError
    logger.info "== Sprockets will render css with ruby sass\n" \
                      '   consider using Sprockets 4.x to render with SassC'
  end
end
