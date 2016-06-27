require 'date'
@students = []

  def try_load_students
    filename = ARGV.first
    return if filename.nil?
    if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      puts "Sorry #{filename} doesn't exist."
      exit
    end
  end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort}
    end
    file.close
    puts "students loaded"
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  p @students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "students saved!"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # Exit the program
    else
      puts "I don't know what you mean. Please try again."
    end
  end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finsh, just hit return twice"

  @name = STDIN.gets.strip.split(/ |\_/).map(&:capitalize).join(" ")
  if @name.empty?
    puts  "The student directory is empty and this program has closed."
    exit
  end
  while !@name.empty? do
    cohort = get_cohort
    dob = get_dob
    country = get_country
    hobby = get_hobby
    @students << {name: @name, dob: dob, country: country, hobby: hobby, cohort: cohort}
    puts "Now we have #{@students.count} students"
    puts ""
    puts "Next student?"

  @name = STDIN.gets.strip.split(/ |\_/).map(&:capitalize).join(" ")
  end

  @students
end

def get_cohort
  puts "Which cohort is #{@name} in?"
  cohort = STDIN.gets.strip.downcase.to_sym
  return cohort
end

def get_dob
  puts "Using (dd/mm/yyyy) format, what is #{@name}'s date of birth?"
  dob = STDIN.gets.strip
  return dob
end

def get_country
  puts "What is their country of birth?"
  country = STDIN.gets.strip.split(/ |\_/).map(&:capitalize).join(" ")
  return country
end

def get_hobby
  puts "What is their favourite hobby?"
  hobby = STDIN.gets.strip.capitalize
  return hobby
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_list(students)
  i = 0
  while @students.length > i do
    @students.sort_by!{|student| student[:cohort]}
    puts "#{i+1}. #{@students[i][:name]}\n - DOB: #{@students[i][:dob]}\n - Country of birth: #{@students[i][:country]}\n - Favourite Hobby: #{@students[i][:hobby]}\n - Cohort: #{@students[i][:cohort]}"
    i += 1
    puts ""
  end
end


def print_footer(students)
  if @students.count > 1 || @students.count == 0
    puts "Overall, we have #{@students.count} students."
  else
    puts "Overall, we have #{@students.count} student."
  end
end

try_load_students
interactive_menu
