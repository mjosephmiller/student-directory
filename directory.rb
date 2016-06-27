require 'date'
@students = []
@months = {january: 1,
  february: 2,
  march: 3,
  april: 4,
  may: 5,
  june: 6,
  july: 7,
  august: 8,
  september: 9,
  october: 10,
  november: 11,
  december: 12}

def load_students
  file = File.open("students.csv", "r")
  if File.exists?("students.csv")
    puts "Loaded file from students.csv"
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort}
    end
    file.close
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  p @students
  @students.each do |student|
    student_data = [student[:name], student[:cohort][:month]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
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
    process(gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finsh, just hit return twice"

  name = gets.strip.split(/ |\_/).map(&:capitalize).join(" ")
  if name.empty?
    puts  "The student directory is empty and this program has closed."
    exit
  end
  while !name.empty? do
    puts "Which cohort is #{name} in?"
    cohort = gets.strip.downcase.to_sym
      cohort = "November" if cohort.empty?
      until @months.include?(cohort)
        puts "Please enter a valid month"
        cohort = gets.strip.downcase.to_sym
      end
    puts "Using (dd/mm/yyyy) format, what is #{name}'s date of birth?"
    dob = gets.strip
    puts "What is their country of birth?"
    country = gets.strip.split(/ |\_/).map(&:capitalize).join(" ")
    puts "What is their favourite hobby?"
    hobby = gets.strip.capitalize
    @students << {name: name, dob: dob, country: country, hobby: hobby, cohort: {month: cohort, num: @months[cohort]}}
    puts "Now we have #{@students.count} students"
    puts ""
    puts "Next student?"

  name = gets.strip.split(/ |\_/).map(&:capitalize).join(" ")
  end

  @students
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

interactive_menu
