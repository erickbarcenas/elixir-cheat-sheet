# elixir-cheat-sheet

## Executable
elixir .\main.ex

## Examples


### Enum.map

```elixir
iex> Enum.map([1, 2, 3], fn x -> x * 2 end)
[2, 4, 6]
```

```elixir
iex> Enum.map([%{name: "Erick", songs: 2}, %{name: "Ivan",  songs: 12}], fn user -> user.songs > 0  end)
[true, true]
```

### Enum.filter
Filters the enumerable, i.e. returns only those elements for which fun returns a truthy value.

```elixir
iex> Enum.filter([1, 2, 3], fn x -> rem(x, 2) == 0 end)
[2]
```

```elixir
iex> users = [%{uid: "eeeee", name: "Erick", payments: 10}, %{uid: "hhhhhh", name: "Iván", payments: 0}]
iex> find = fn user -> user.payments > 0 end
iex> users |> Enum.filter(find)
[%{name: "Erick", payments: 10, uid: "eeeee"}]
```

### split

```elixir
iex> String.split("foo bar!", [" ", "!"])
["foo", "bar", ""]
```

```elixir
iex> String.split("Erick,Bárcenas", [","])
["Erick", "Bárcenas", ""]
```
### sort_by

```elixir
iex> Enum.sort_by(["some", "kind", "of", "monster"], &byte_size/1, :desc)
["monster", "some", "kind", "of"]
```

```elixir
iex> Enum.sort_by(["some", "kind", "of", "monster"], fn item -> byte_size(item) end, :asc)
["monster", "some", "kind", "of"]
```

### all?(enumerable)
Returns true if all elements in enumerable are truthy.
When an element has a falsy value (false or nil) iteration stops immediately and false is returned. In all other cases true is returned.

```elixir
iex> Enum.all?([1, 2, 3])
true
```

```elixir
iex> Enum.all?([-1, 2, 3])
true
```

```elixir
iex> Enum.all?([%{name: "Erick", birthday: "1998-08-24"}])
true
```

```elixir
iex> Enum.all?([%{name: "Erick", birthday: nil}, %{}])
true
```

### all?(enumerable, fun)
Returns true if fun.(element) is truthy for all elements in enumerable.

```elixir
iex> Enum.all?([2, 4, 6], fn x -> rem(x, 2) == 0 end)
true
```

```elixir
iex> Enum.all?([%{name: "Iván", alias: ""}, %{name: "Erick", alias: "Alchemist"}], fn item -> String.length(item.alias) > 0 end)
false
```

### zip(enumerables)
Zips corresponding elements from a finite collection of enumerables into a list of tuples.

```elixir
iex> Enum.zip([[1, 2, 3], [:a, :b, :c], ["foo", "bar", "baz"]])
[{1, :a, "foo"}, {2, :b, "bar"}, {3, :c, "baz"}]
```

```elixir
iex> list1 = [["Erick", "Iván", "Santiago"], [23, 23 , 9]]
iex> list1 |> Enum.zip()
[{"Erick", 23}, {"Iván", 23}, {"Santiago", 9}]
```

### zip(enumerable1, enumerable2)
Zips corresponding elements from two enumerables into a list of tuples.


```elixir
iex> Enum.zip([1, 2, 3], [:a, :b, :c])
[{1, :a}, {2, :b}, {3, :c}]
```


```elixir
iex> list1 = [1, 2, 3]
iex> list1 |> Enum.zip([:a, :b, :c])
[{1, :a}, {2, :b}, {3, :c}]
```

### zip_with(enumerables, zip_fun)

```elixir
Enum.zip_with([[1, 2], [3, 4]], fn [x, y] -> x + y end)
[4, 6]
```

```elixir
iex> sum_ = fn [name, complement] -> name <> " " <> complement end
Enum.zip_with([["Erick", "Dan"], ["Bárcenas", "Muñoz"]], sum_)
["Erick Bárcenas", "Dan Muñoz"]
```

```elixir
iex> a = [1, 2, 3]
iex> b = [4, 5, 6]
iex> Enum.zip_with([a,b], fn [a,b] -> a-b end)
[-3, -3, -3]
```

```elixir
iex> saludos = ["Hola", "Buen dia", "Saludos"]
iex> nombres = ["Juan", "Pedro", "Luis"]
iex> Enum.zip_with(saludos, nombres, fn x, y -> x <> " " <> y end)
["Hola Juan", "Buen dia Pedro", "Saludos Luis"]
```

```elixir
iex> listas = [["Hola", "¿Cómo estás?", "Hola"], ["Agus", "Ricardo", "Tania"]]
iex> listas |> Enum.zip_with(fn [h, n] -> h <> " " <> n <> ", ¡que te diviertas!" end)
```


### Enum.reduce

```elixir
Enum.reduce([1, 2, 3, 4, 5], 0, fn x, acc -> x + acc end)
```

```elixir
Enum.reduce([1, 2, 3, 4, 5], fn x, acc -> x * acc end)
```

```elixir
Enum.reduce(["Agus", "Erick", "Norberto"], "", fn x, acc -> acc <> "," <> x end)
```

```elixir
Enum.reduce(["Agus", "Erick", "Norberto"], fn x, acc -> acc <> "," <> x end)
```

### Mapas

```elixir
iex> m = %{"one" => 1, "two" => 2, "three" => 2}
iex> m["one"]
1
```

Todo en elixir son valores
los valores son inmutables, una vez se crearon no se pueden modificar
Ni una tupla, ni un string, etc. no pueden cambiar.

Creación de un nuevo mapa que se guarda en m1
```elixir
iex> m1 = Map.put(m, "four", 4)
iex> m1["one"]
```
Creación de un nuevo mapa que se guarda en m, reemplaza todo lo que tiene m
```elixir
iex> m1 = Map.put(m, "four", 4)
iex> m1["one"]
```

Eliminar llave y valor
```elixir
iex> m2 = Map.delete(m, "two")
```

```elixir
iex> %{} |> Map.put("one", 1) |> Map.put("two", 2)
%{"one" => 1, "two" => 2}
```

### Documentación

```elixir
iex> Map. # presionar tabulador
iex> h Map.put_new
```

```elixir
iex> %{:one => 1, :two => 2}
```

```elixir
iex> m = %{one: 1, two: 2}
iex> m.one # solo cuando son átomos y uno está seguro de que existe
iex> m[:one] # cuando no sabemos si existe la llave
```

# Actividad
Con reduce y mapas 
decir el valor total de la lista de productos


```elixir
productos = [
  %{ producto: "chocolate", precio: 5},
  %{ producto: "chicle", precio: 1},
  %{ producto: "mazapan", precio: 8},
  %{ producto: "paleta tupsi", precio: 4}
]
Enum.reduce(productos, fn item, 0 -> item.precio end)
```

Keyword.keys([a: 1, b: 2, a: 3])


# Update a map

```elixir
iex> m = %{one: 1, two: 2}
iex> %{m | two: "two"}

iex> m = %{"one" => 1, "two" => 2}
iex> %{m | two: "two"}
```

# Extract value from key

```elixir
m = %{one: 1, two: 2, three:3}
%{one: x, two: y} = m
%{one: _, two: y} = m
```


# para no usar la variable
```elixir
{:ok, _error, error_desc}
```

# Funciones anónimas
```elixir
mult = fn x, y -> x * y end
mult.(3, 5)
```

```elixir
Enum.reduce([1,2,3,4,5], fn x, y -> x * y end)

Enum.reduce([1,2,3,4,5], mult)
```


```elixir
multiplier = fn x ->
  fn y -> x * y end
end

doubler = multiplier.(2)
doubler.(10)
```


# Funciones de orden mayor
Funciones que reciben a otra función como parámetro
Funciones de funciones

Módulo con una función.
```elixir
defmodule Fib do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do fib(n-1) + fib(n-2)
end

Fib.fib(0)
Fib.fib(1)
Fib.fib(2)
Fib.fib(3)
```

## Recursión
```elixir
defmodule Fib do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do fib(n-1) + fib(n-2)
end
```

## Estructuras de control
```elixir
x = 10
y = 20
if x >=5 do
  IO.puts("greater")
else
  IO.puts("lesser")
end
```

```elixir
x = 10
y = 20
if x >=5 do
  {:ok, "greater"}
else
  {:error, "lesser"}
end
```


```elixir
x = 10
y = 20
if x >=5 do
  {:ok, "greater"}
end

#resultados
{:ok, "greater"} #entra en el if
nil # no entra en el if
```

```elixir
defmodule Foo do
  def bar(x) do
    if x > 5 do
      {:ok, "greater"}
    else
      {:error, "lesser"}
    end
  end
end
```


```elixir
  case x do
    5 -> "five"
    10 -> "ten"
    _-> "unknown"
  end
```


```elixir
defmodule Foo do
  def bar(x) do
    case x do
      {:ok, res} -> res
      {:ok, res} -> res  # claúsula, es es el cuerpo de la claúsula
      {:ok, _, res} -> res
      {:error, reason} -> "Error": #{reason}"
      _-> "unknown input"
    end
  end
end
```

```elixir
Foo.bar({:error, "no data"})
```

```elixir
Foo.bar({:ok, 10})
```

## Truco
```elixir
iex> 1..10//2 |> Enum.each(fn x -> IO.puts(x) end)
0
2
4
6
8
10
```
## Cond: funciona con expresiones booleanas

## Case: funciona con pattern matching
```elixir
x = 18
val = {rem(x,3), rem(x,5)}
{0, 3}

case val do
  {0,0} -> "FizzBuzz"
  {0,_} -> "Fizz"
  {_,0} -> "Buzz"
  {_,_} -> x
end

"Fizz"
```
