defmodule BottomTest do
  use ExUnit.Case

  test "what is at the bottom" do
    assert Bottom.find("inputs/day7_input.txt") == "tknk"
  end

end
