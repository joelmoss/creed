# frozen_string_literal: true

Customer = Struct.new(:name, :id) do
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def to_js(_options = {})
    "name: #{name.inspect}"
  end
  alias_method :to_text, :to_js

  def errors
    []
  end

  def persisted?
    id.present?
  end
end
