require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class Foo
  def self.method_with_block_arguments
    yield("Jim")
  end
end

class AboutArrays < EdgeCase::Koan
  def test_foo
    res = Foo.method_with_block_arguments { |argument|
      assert_equal "Jim", argument
    }
    assert res
  end

end
