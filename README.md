# elixir-cheat-sheet

## Examples

### Enum.map

```elixir

```

### Enum.filter

```elixir

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
iex> Enum.sort_by(["some", "kind", "of", "monster"], &byte_size/1, :asc)
["monster", "some", "kind", "of"]
```

### all?
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

### zip

```elixir

```
### zip_with

```elixir

```

