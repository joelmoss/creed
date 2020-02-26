# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/focus'
require 'minitest/reporters'
require 'mocha/minitest'

# Configure Rails
ENV['RAILS_ENV'] = 'test'

require 'responders'
require 'active_model'

Minitest::Reporters.use!

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'creed'

Creed::Routes = ActionDispatch::Routing::RouteSet.new
Creed::Routes.draw do
  ActiveSupport::Deprecation.silence do
    get '/:controller(/:action(/:id))'
  end
end

class ApplicationController < ActionController::Base
  include Creed::Routes.url_helpers

  respond_to :json
end

class ActiveSupport::TestCase
  self.test_order = :random

  setup do
    @routes = Creed::Routes
  end
end
