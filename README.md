# Evi Language (Evil)

**WIP**

Evi is functional, dynamic language that mix syntax of Elixir and Javascript
while use idea of Rust in background.

## Idea

I love syntax of Elixir, less variables more functions. However, syntax of list,
map and tuple feel strange to me, I think JS has more natural syntax for these
things.

At compiler aspect, Rust has impressive idea so I want Evi work this way too.

Few other notes:

- Maybe support both Actor and CSP natively
- Support macro like Elixir

## Syntax

### Module

```text
mod Module do
    fn function_name() do
        "Hello world"
        |> IO.print()
    end
end
```

### Variable

```text
mod Module do
    fn function_name() do
        integer = 1
        float = 1.1
        boolean = true
        string = "Hello world"
        array = [1, 1.1, "Hello world"]
        object = {"a": 1, "b": 1.1, "c": "Hello world"}
        tuple = ("ok", 1)
        function = (a, b) => a + b end
        binary = <178, 196, 255, 0>
    end
end
```

### Pipe operator

```text
"John"
|> format(12, "UK")
|> IO.print()

12
|> format("John", _, "UK")
|> IO.print()

("John", "UK")
|> format(_, 12, _)
|> IO.print()
```

### Anonymous function

```text
a => a + 1 end
(a, b) => a + b end
```

### Flow

```text
"SGVsbG8gd29ybGQ="
|> Base.decode64()
|> match do
    ("ok", v) => v end
    ("error", e) => e |> IO.print() end
end

cond do
    1 > 2 => "This is never true" end
    true => "This is always true" end
end
```

### Enum

```text
[1, 2, 3]
|> Enum.map(i => 2 * i end)
|> Enum.filter(i => i > 2 end)

{"a": 1, "b": 1.1, "c": "Hello world", "d": [1, 2, 3]}
|> Enum.map((k, v) =>
    k
    |> match do
        "a" => "Integer" end
        "b" => "Float" end
        v => "#{v} is Combine" end
    end
    |> IO.print()

    v |> IO.print()
end)
```

### Import

```text
import (encode, decode) from XML
import (encode, decode) from JSON
```

## Contributing

Pull requests are welcome. For major changes,
please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
