defmodule Captcha do

  def number_to_list(num) do
    Integer.digits(num)
  end

  def add_first_number_to_end([h | t]) do
    [h | t] ++ [h] 
  end

  def consecutive_same([]) do
    0 
  end
  
  def consecutive_same([ h1, h1 | t] ) do
    h1 + consecutive_same([ h1 | t])
  end

  def consecutive_same([ h | t] ) do
   0 + consecutive_same(t)
  end
  

end
