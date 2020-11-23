require 'set'
require 'digest'
require_relative './JSONHash.rb'

def add(json)
  name = get_name()

  if json[name]
    print_seperator()
    return puts "#{name} is already added" 
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

def main()
  json = JSONHash.new
  json = json.reload('data.json')

  options = Set['add', 'activate', 'get_code']

  print_seperator()
  puts "What would you like to do? Options:"; print_options()
  command = get_input()

  until options.include?(command)
    puts "The only commands avilable are"; print_options()
    command = get_input()
  end

  case command
  when 'add'
    add(json)
  when 'activate'
    activate(json)
  when 'get_code'
    get_code(json)
  end

  print_seperator()
  json.save('data.json')
  puts 'Operation successful! ✔️'
  puts ''
end

### Helpers start ###
def get_name()
  print_seperator()
  puts 'Pls enter name of person'
  puts "Format: 'FirstName LastName'"
  
  name = get_input()
  name = name.split(' ').map{|word| word.capitalize}.join(' ')

  print_seperator()

  puts "'#{name}''? (Y/N)"
  
  answer = get_input()
  
  until answer == 'y' || answer == 'n'
    puts "Please enter 'Y' or 'N'"
    answer = get_input()
  end

  if answer == 'y'
    name
  else
    get_name()
  end
end

def print_seperator()
  puts ''
  puts '---------------------------------------------------'
end

def print_options()
  puts "> 'add'"
  puts "> 'activate"
  puts "> 'get_code'"
end

def get_input()
  puts ''
  print '=> '
  return gets.chomp.downcase.strip
end
### Helpers end ###

main()
