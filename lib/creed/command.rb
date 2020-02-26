# frozen_string_literal: true

require 'dry-initializer'

class Creed::Command
  extend Dry::Initializer[undefined: false]

  def self.perform(*context)
    new(*context).perform
  end

  def perform
    raise NotImplementedError
  end
end
