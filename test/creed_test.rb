require "test_helper"

class CreedTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Creed::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end