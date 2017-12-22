defmodule BlockTest do
  use ExUnit.Case

  test "4 place blocks" do
    assert Block.process([0, 2, 7, 0]) == 5
  end

end
