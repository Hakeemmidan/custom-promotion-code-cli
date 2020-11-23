require 'set'
require 'digest'
require 'readline'
require_relative './JSONHash.rb'
require_relative './helpers.rb'
require_relative './utils.rb'

ADD = 'add'
ACTIVATE = 'activate'
GET_CODE = 'get_code'

@options = Set.new([ADD, ACTIVATE, GET_CODE])

def main()
  json = JSONHash.new
  json = json.reload('data.json')

  print_seperator()
  puts "What would you like to do? Options:"; print_main_options()
  command = get_input()

  until @options.include?(command)
    puts "The only commands avilable are"; print_main_options()
    command = get_input()
  end

  case command
  when ADD
    add(json)
  when ACTIVATE
    activate(json)
  when GET_CODE
    get_code(json)
  end

  print_seperator()
  json.save('data.json')
  puts 'Operation successful! ✔️'
  puts ''
end

### Setup READLINE start ###
LIST = @options.to_a.sort

comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/) }

Readline.completion_append_character = " "
Readline.completion_proc = comp
### Setup READLINE end ###

main()
