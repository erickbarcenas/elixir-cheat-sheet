tax_rates = %{ NC: 0.075, TX: 0.08 }


orders = [
  %{ id: 123, ship_to: :NC, net_amount: 100.00 },
  %{ id: 124, ship_to: :OK, net_amount: 35.50 },
  %{ id: 125, ship_to: :TX, net_amount: 24.00 },
  %{ id: 126, ship_to: :TX, net_amount: 44.80 },
  %{ id: 127, ship_to: :NC, net_amount: 25.00 },
  %{ id: 128, ship_to: :MA, net_amount: 10.00 },
  %{ id: 129, ship_to: :CA, net_amount: 102.00 },
  %{ id: 120, ship_to: :NC, net_amount: 50.00 }
]


defmodule PragmaticBookshelf  do
  def get_by_ship_to(orders, ship_to) do
    Enum.filter(orders, fn item -> item.ship_to == ship_to end)
  end
end


# Se obtienen las llaves y valores
keys = Map.keys(tax_rates)
values = Map.values(tax_rates)
# se comprueba que tax_rates tenga longitud 2 (en sus llaves)
lenght = Enum.count(keys)


item_1 = Enum.at(keys, 0)
item_2 = Enum.at(keys, 1)

item_1_value = Enum.at(values, 0)
item_2_value = Enum.at(values, 1)

item_1_list = PragmaticBookshelf.get_by_ship_to(orders, item_1)
item_2_list = PragmaticBookshelf.get_by_ship_to(orders, item_2)


   
for element <- item_1_list do
  id = element.id
  net_amount = element.net_amount
  total_amount = net_amount + (net_amount * item_1_value)

  %{ id: id, ship_to: item_1, net_amount: net_amount, total_amount: total_amount }
end
