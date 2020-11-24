def add()
  name = get_name()

  if @json[name]
    print_seperator()
    puts "#{name} is already added"

    return puts "Promo code: " + print_yellow(@json[name]['code'])
  end
  
  code = create_prm_code(name)

  @json[name] = {
    "code": code,
    "activated": false
  }
  
  print_seperator()
  puts "User added! ✔️"
  puts "Promo code: " + print_yellow(code)
end

def activate()
  name = get_name()

  until @json[name] != nil
    puts "Looks like the name you entered isn't in registeration list. Make sure spelling is right and that this person is in list"
    name = get_name()
  end

  if @json[name]['activated']
    print_seperator()
    return puts "User already activated" 
  end

  @json[name]['activated'] = true
end

def get_code()
  name = get_name()

  until @json[name] != nil
    puts "Looks like the name you entered isn't in registeration list. Make sure spelling is right and that this person is in list"
    name = get_name()
  end
  
  print_seperator()
  puts "Promo code: " + print_yellow(@json[name]['code'])
end