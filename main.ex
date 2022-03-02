productos = [
  %{ producto: "chocolate", precio: 5},
  %{ producto: "chicle", precio: 1},
  %{ producto: "mazapan", precio: 8},
  %{ producto: "paleta tupsi", precio: 4}
]


IO.puts("El total es #{Enum.reduce(productos, 0, fn item, acc -> item.precio + acc end)}")
