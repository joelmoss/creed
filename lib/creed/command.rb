# frozen_string_literal: true

require 'dry-initializer'
require 'dry-initializer-rails'

class Creed::Command
  extend Dry::Initializer[undefined: false]

  def self.perform(*context, &block)
    # Make sure that any given options have their keys symbolized, otherwise they will be ignored,
    # as Dry::Initializer requires keyword arguments or symbolized keys.
    options = context.extract_options!

    unless options.empty?
      options.symbolize_keys!

      # Raise on unknown options.
      unknown_keys = options.keys - dry_initializer.options.map(&:source)
      raise ArgumentError, "unknown keys: `#{unknown_keys.join '`, `'}`" if unknown_keys.any?

      context << options
    end

    new(*context).perform(&block)
  end

  def perform
    raise NotImplementedError
  end
end
