# frozen_string_literal: true

require 'test_helper'

class Creed::CommandTest < Minitest::Test
  class CreateUser < Creed::Command
    param :name

    def perform
      name
    end
  end

  class CreateUserWithAge < Creed::Command
    param :name
    option :age

    def perform
      "#{name} (#{age})"
    end
  end

  def test_responds_to_perform
    assert CreateUser.respond_to?(:perform)
  end

  def test_undefined_arguments
    assert_raises(ArgumentError) { CreateUser.perform }
  end

  def test_unknown_option
    assert_raises(ArgumentError) { CreateUser.perform address: '??' }
  end

  def test_keyword_arguments
    assert_equal 'Joel (45)', CreateUserWithAge.perform('Joel', age: 45)
  end

  def test_required_option
    assert_raises(KeyError) { CreateUserWithAge.perform 'Joel' }
  end

  def test_return_value
    assert_equal 'joel', CreateUser.perform('joel')
  end
end
