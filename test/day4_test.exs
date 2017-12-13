defmodule PassphraseTest do
  use ExUnit.Case

  test "Valid passphrase returns vaild" do
    assert Passphrase.validate("aa bb cc dd ee") == {:ok, :valid}
  end

  test "Invalid passphrase returns invalid" do
    assert Passphrase.validate("aa bb cc dd aa") == {:error, :invalid}
  end

  test "Repeated subphrase is okay" do
    assert Passphrase.validate("aa bb cc dd aaa") == {:ok, :valid}
  end

end
