# elixir-cheat-sheet

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

