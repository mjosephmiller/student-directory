require 'date'

@months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

def input_students
  puts "Please enter the names of the students"
  puts "To finsh, just hit return twice"

  students = []

  name = gets.chomp.split(/ |\_/).map(&:capitalize).join(" ")

  while !name.empty? do
    puts "Which cohort is #{name} in?"
    cohort = gets.chomp.downcase.to_sym
      cohort = "November" if cohort.empty?
      until @months.include?(cohort)
        puts "Please enter a valid month"
        cohort = gets.chomp.downcase.to_sym
      end
    puts "Using (dd/mm/yyyy) format, what is #{name}'s date of birth?"
    dob = gets.chomp
    puts "What is their country of birth?"
    country = gets.chomp.split(/ |\_/).map(&:capitalize).join(" ")
    puts "What is their favourite hobby?"
    hobby = gets.chomp.capitalize
    students << {name: name, dob: dob, country: country, hobby: hobby, cohort: cohort}
    puts "Now we have #{students.count} students"
    puts ""
    puts "Next student?"

  name = gets.chomp.split(/ |\_/).map(&:capitalize).join(" ")
  end

  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  i = 0
  while students.length > i do
    puts "#{i+1}. #{students[i][:name]}\n - DOB: #{students[i][:dob]}\n - Country of birth: #{students[i][:country]}\n - Favourite Hobby: #{students[i][:hobby]}\n - Cohort: (#{students[i][:cohort]})"
    i += 1
    puts ""
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print(students)
print_footer(students)
