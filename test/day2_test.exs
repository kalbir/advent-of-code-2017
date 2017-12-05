defmodule ChecksumTest do
  use ExUnit.Case

  test "Difference of max and min" do
    assert Checksum.difference([7,5,3])    == 4
    assert Checksum.difference([2,4,6,8])  == 6
    assert Checksum.difference([5,1,9,5])  == 8
  end

  test "Sum the differences" do
    assert Checksum.compute([["753", "2468", "5195"]])  == 4442 
  end
  
end
