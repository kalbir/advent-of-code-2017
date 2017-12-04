defmodule CaptchaTest do
  use ExUnit.Case

  test "Repeating pairs" do
    assert Captcha.complete(1212) == 3
  end
end
