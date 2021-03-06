require 'set'
require 'readline'
require_relative './JSONHash.rb'
require_relative './helpers.rb'
require_relative './utils.rb'

ADD = 'add'
ACTIVATE = 'activate'
GET_CODE = 'get_code'

@options = Set.new([ADD, ACTIVATE, GET_CODE])
@json = JSONHash.new
@json = @json.reload('data.json')

def main()
  print_seperator()
  puts "What would you like to do? Options:"; print_options()
  command = get_input()

  until @options.include?(command)
    puts "The only commands avilable are"; print_options()
    command = get_input()
  end

  case command
  when ADD
    add()
  when ACTIVATE
    activate()
  when GET_CODE
    get_code()
  end

  print_seperator()
  @json.save('data.json')
  puts 'Operation successful! ✔️'
  puts ''
  puts 'Would you like to do another operation? (Y/N)'
  
  answer = get_yes_or_no()

  if answer == 'y'
    main()
  elsif answer == 'n'
    puts 'Goodbye!'
  end
end

### Setup READLINE start ###
LIST = @options.to_a.sort

comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/) }

Readline.completion_proc = comp
### Setup READLINE end ###

main()
