Customized promo code generator that maps a name to a specific promo code

Built with native Ruby code (no external gems)

## Run
```
ruby main.rb
```

## File Anatomy
- `main.rb`
  - Main script
- `helpers.rb`
  - `main.rb`'s helper functions:
    - `add()`
    - `activate()`
    - `get_code()`
- `utils.rb`
  - Smaller repeated functions such `get_name()` and `print_seperator()`
- `data.json`
  - Where promotion code info gets stored

## JSON Data Structure
```JSON
"<FirstName LastName>": {
  "code": "<generated promo code>",
  "activated": <Boolean>
}
```