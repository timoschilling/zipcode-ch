require 'minitest/autorun'
require 'zipcode-ch'
require 'set'

class TestZipCodeCH < MiniTest::Test
  class << self
    def setup
      @loaded ||= ZipCode::DB.for(:ch).load
    end
  end

  def setup
    self.class.setup
  end

  def test_search_by_word_prefix
    results = ZipCode::DB.for(:ch).search(:name, 'OBER')
    assert_equal(80, results.count)
  end

  def test_search_by_first_word_prefix
    results = ZipCode::DB.for(:ch).search(:name, 'DAV')
    assert_equal(8, results.count)
    assert_equal(Set.new(%w(6964 7260 7265 7270 7272 7276 7277 7278)),
                 Set.new(results.map { |e| e[:zip] }))
  end

  def test_search_by_last_word_prefix
    results = ZipCode::DB.for(:ch).search(:name, 'GALL')
    assert_equal(11, results.count)
    assert_equal('5224', results.first[:zip])
  end

  def test_search_by_full_name
    results = ZipCode::DB.for(:ch).search(:name, 'LAUSANNE')
    assert_equal(11, results.count)
    assert_equal('1000', results.first[:zip])
  end

  def test_search_by_full_name_with_space
    results = ZipCode::DB.for(:ch).search(:name, 'BAD RAGAZ')
    assert_equal(1, results.count)
    assert_equal('7310', results.first[:zip])
  end
end
