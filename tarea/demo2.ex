tax_rates = %{ NC: 0.075, TX: 0.08 }


for n <- tax_rates do
  {key, _value} = n
  IO.puts(key)
end
