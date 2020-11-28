def get_name()
  print_seperator()
  puts 'Pls enter name of person'
  puts "Format: 'FirstName LastName'"
  
  name = get_input()
  name = format_name(name)

  print_seperator()

  until name.split(' ').length == 2
    puts "Please make sure it's in following format:"
    puts 'FirstName LastName'

    name = get_input()
    name = format_name(name)

    print_seperator()
  end

  puts "'#{name}'? (Y/N)"
  
  answer = get_yes_or_no()

  if answer == 'y'
    name
  elsif answer == 'n'
    get_name()
  end
end

def print_seperator()
  puts ''
  puts '---------------------------------------------------'
end

def print_options()
  @options.each do |opt|
    puts "> '#{opt}'"
  end
end

def get_input()
  puts ''
  answer = Readline.readline('=> ', true)

  return answer.downcase.strip
end

def get_yes_or_no()
  answer = get_input()
  
  until answer == 'y' || answer == 'n'
    puts "Please enter 'Y' or 'N'"
    answer = get_input()
  end

  return answer
end

def print_yellow(str)
  return "\e[33m#{str}\e[0m"
end

def format_name(name)
  return name.split(' ').map{|word| word.capitalize}.join(' ').strip
end

def create_prm_code(name)
  chars = ('!'..'~').to_a # 92 uniq chars
  chars[1] = 'A' ; chars[59] = 'B' # Removing chars that may cause form failure

  code = [*chars, *chars].sample(12).join('')
  code = name.split(' ')[0] + name.split(' ')[1][0] + '-' + code

  return code
end
