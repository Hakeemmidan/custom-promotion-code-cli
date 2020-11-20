require 'digest'
require_relative './JSONHash.rb'

def add(json)
  name = get_name()
  # hashing just to make it hard to guess
  json[:name] = Digest::SHA2.new(512).hexdigest 'Par is fantastic ' + name + ' and orcas are cool'
end


def activate(json)
  name = get_name()
  json[:name].is_activated = true
end

def get_name()
  puts 'Name of person you want to add/activate'
  name = gets.chomp
  puts "Is the name that you want to add/activate '#{name}''? (Y/N)"
  answer = gets.chomp
  
  until answer == 'Y' || answer == 'N'
    puts "Please enter 'Y' or 'N'"
    answer = gets.chomp
  end

  if answer == 'Y'
    name
  else
    get_name()
  end
end

json = JSONHash.from('data.json')

options = Set['add', 'activate']
puts 'What would you like to do?'
command = gets.chomp

until options.include?(command)
  puts "The only commands avilable are 'add' and 'activate'"
  command = gets.chomp
end

if (command == 'add')
  add(json)
else
  activate(json)
end

json.save
puts 'Operation successful! ✔️'