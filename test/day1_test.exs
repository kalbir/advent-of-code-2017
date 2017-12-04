defmodule CaptchaTest do
  use ExUnit.Case

  test "No repeats" do
    assert Captcha.complete(1212) == 0
  end
  
  test "Repeating pairs" do
    assert Captcha.complete(1122) == 3
  end
  
  test "All repeats" do
    assert Captcha.complete(1111) == 4
  end
  
  test "Repeats at the top and tail" do
    assert Captcha.complete(91212129) == 9
  end
end
