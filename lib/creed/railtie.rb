# frozen_string_literal: true

module Creed
  class Railtie < Rails::Railtie
    config.before_configuration do |app|
      app.config.paths.add 'app/commands', eager_load: true
    end
  end
end
