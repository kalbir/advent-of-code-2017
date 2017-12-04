defmodule CaptchaTest do
  use ExUnit.Case

  test "No repeats" do
    assert Captcha.complete(1212) == 0
  end
  
  test "Repeating pairs" do
    assert Captcha.complete(1122) == 3
  end
end
