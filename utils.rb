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

def print_main_options()
  @options.each do |opt|
    puts "> '#{opt}'"
  end
end

def get_input()
  puts ''
  line = Readline.readline('=> ', true)

  return line.downcase.strip
end