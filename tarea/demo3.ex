defmodule DemoAppend do
  def process(x) do
    x*2
  end

  def createList(list) do
    result = Enum.map(list, &DemoAppend.process/1)

    for n <- result do
      IO.puts(n)
    end
  end
end

DemoAppend.createList([1,1,1])
