# frozen_string_literal: true

require 'test_helper'
require 'support/models'

class ResponderTest < ActionController::TestCase
  class CreateUser < Creed::Command
    def perform
      Customer.new('joel', 13)
    end
  end

  class CreedResponder < ActionController::Responder
    include Creed::Responder
  end

  class CustomerController < ApplicationController
    self.responder = CreedResponder

    def with_class
      respond_with CreateUser
    end

    def with_perform
      respond_with CreateUser.perform
    end
  end

  tests CustomerController

  def setup
    @request.accept = 'application/json'
    @controller.stubs(:polymorphic_url).returns('/')
  end

  def test_respond_with_class
    post :with_class
    assert_equal '{"name":"joel","id":13}', @response.body
  end

  def test_respond_with_perform
    post :with_perform
    assert_equal '{"name":"joel","id":13}', @response.body
  end
end
