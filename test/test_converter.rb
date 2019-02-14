ENV["CONVERTER_ENV"] = "test"
require 'minitest/autorun'
require_relative '../lib/converter'
 

class ConverterTest < MiniTest::Test
	def setup
		@con = Converter.new
	end

	def test_validity
		assert_raises(RuntimeError) { @con.num_to_words("6799878765788") }
	end

	def test_num_to_words
		assert_equal [["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "amounts"], ["cat", "contour"], ["acta", "mounts"], "catamounts"], @con.num_to_words("2282668687")
		assert_equal [["noun", "struck"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"], @con.num_to_words("6686787825")
	end
end