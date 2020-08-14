# frozen_string_literal: true

require 'test_helper'

class Creed::CommandTest < Minitest::Test
  class CreateUser < Creed::Command
    param :name

    def perform
      name
    end
  end

  def test_responds_to_perform
    assert CreateUser.respond_to?(:perform)
  end

  def test_undefined_arguments
    assert_raises(ArgumentError) { CreateUser.perform }
  end

  def test_return_value
    assert_equal 'joel', CreateUser.perform('joel')
  end
end
