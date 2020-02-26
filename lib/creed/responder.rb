# frozen_string_literal: true

module Creed::Responder
  def initialize(controller, resources, options = {})
    super

    # If @resource is a Creed Command class, call #perform on it.
    @resource = @resource.perform if @resource.is_a?(Class) && @resource < Creed::Command
  end
end
