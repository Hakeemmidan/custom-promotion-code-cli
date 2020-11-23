def add(json)
  name = get_name()

  if json[name]
    print_seperator()
    puts "#{name} is already added"

    return "Promo code: #{json[name]['code']}"
  end
  
  # hashing just to make it hard to guess
  hash = Digest::SHA2.new(512).hexdigest('Par is fantastic ' + name + ' and orcas are cool')
  code = name.split(' ')[0] + name.split(' ')[1][0] + '-' + hash[0..7]

  json[name] = {
    "code": code,
    "activated": false
  }
  
  print_seperator()
  puts "User added! ✔️"
  puts "Promo code: #{code}"
end

def activate(json)
  name = get_name()

  until json[name] != nil
    puts "Looks like the name you entered isn't in registeration list. Make sure spelling is right and that this person is in list"
    name = get_name()
  end

  if json[name]['activated']
    print_seperator()
    return puts "User already activated" 
  end

  json[name]['activated'] = true
end

def get_code(json)
  name = get_name()

  until json[name] != nil
    puts "Looks like the name you entered isn't in registeration list. Make sure spelling is right and that this person is in list"
    name = get_name()
  end
  
  print_seperator()
  puts "Promo code: #{json[name]['code']}"
end