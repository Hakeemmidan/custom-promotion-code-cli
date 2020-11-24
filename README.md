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

## Hashing Algorithm
```Ruby
def create_prm_code(name)
  chars = ('!'..'~').to_a # 92 uniq chars
  chars[1] = 'A' ; chars[59] = 'B' # Removing chars that may cause form failure

  code = [*chars, *chars].sample(12).join('')
  code = name.split(' ')[0] + name.split(' ')[1][0] + '-' + code

  return code
end
```
The more you increease range of the sample size (i.e. `sample(n)`), the harder
it would be to crack your promotion code

`chars` has 92 unique characters and includes uppercase/lower letters, numbers, and special chars (not all possible special characters of course)
  
Through testing on [security.org](www.security.org), I found that it typically takes 10k+ years to crack these codes. But this is not a guarntee. You may want to [test it](https://www.security.org/how-secure-is-my-password/) yourself as well


## JSON Data Structure
```JSON
"<FirstName LastName>": {
  "code": "<generated promo code>",
  "activated": <Boolean>
}
```
