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
  @options.each do |opt|
    puts "> '#{opt}'"
  end
end

def get_input()
  puts ''
  line = Readline.readline('=> ', true)

  return line.downcase.strip
end

def print_yellow(str)
  return "\e[33m#{str}\e[0m"
end

def format_name(name)
  return name.split(' ').map{|word| word.capitalize}.join(' ').strip
end

def create_prm_code(name)
  # Should take more than 1 century to crack (just counting hash section in 2020)
  sec1 = ('0'..'z').to_a.shuffle.join('') # 75 chars
  sec2 = ('0'..'z').to_a.shuffle.join('')

  hash = Digest::SHA2.new(512).hexdigest(sec1 + sec2)
  code = name.split(' ')[0] + name.split(' ')[1][0] + '-' + hash[0..11]

  return code
end