defmodule ChecksumTest do
  use ExUnit.Case

  test "Difference of max and min" do
    assert Checksum.difference(753)  == 4
    assert Checksum.difference(2468) == 6
    assert Checksum.difference(5195) == 8
  end

  test "Sum the differences" do
    assert Checksum.complete(753, 2468, 5195)  == 18 
  end
  
end
