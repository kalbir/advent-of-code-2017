defmodule ChecksumTest do
  use ExUnit.Case

  test "Get the minimums" do
    assert Checksum.list_minimum(753)  == 3 
    assert Checksum.list_minimum(2468) == 2 
    assert Checksum.list_minimum(5195) == 1 
  end
  
  test "Get the maximums" do
    assert Checksum.list_maximum(753)  == 7 
    assert Checksum.list_maximum(2468) == 8 
    assert Checksum.list_maximum(5195) == 9 
  end
  
  test "Sum the differences" do
    assert Checksum.complete(753, 2468, 5195)  == 18 
  end
  
end
