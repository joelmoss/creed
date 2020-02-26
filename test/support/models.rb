# frozen_string_literal: true

class Customer < Struct.new(:name, :id)
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def to_js(_options = {})
    "name: #{name.inspect}"
  end
  alias to_text to_js

  def errors
    []
  end

  def persisted?
    id.present?
  end
end
