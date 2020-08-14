# frozen_string_literal: true

require 'dry-initializer'
require 'dry-initializer-rails'

class Creed::Command
  extend Dry::Initializer[undefined: false]

  def self.perform(*context, &block)
    # Make sure that any given options have their keys symbolized, otherwise they will be ignored,
    # as Dry::Initializer requires keyword arguments or symbolized keys.
    options = context.extract_options!
    context << options.symbolize_keys unless options.empty?

    new(*context).perform(&block)
  end

  def perform
    raise NotImplementedError
  end
end
