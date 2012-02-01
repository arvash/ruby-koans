require 'test/unit'

class FooTest < Test::Unit
def self.method_with_block_arguments
    yield("Jim")
  end

def test_foo

method_with_block_arguments { |argument|
  assert_equal "Jim", argument    
}

end
end
