# frozen_string_literal: true

require 'dry-initializer'
require 'dry-initializer-rails'

class Creed::Command
  extend Dry::Initializer

  def self.perform(*context)
    new(*context).perform
  end

  def perform
    raise NotImplementedError
  end
end
