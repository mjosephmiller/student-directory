require 'date'

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

def input_students
  puts "Please enter the names of the students"
  puts "To finsh, just hit return twice"

  students = []

  name = gets.strip.split(/ |\_/).map(&:capitalize).join(" ")
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
    students << {name: name, dob: dob, country: country, hobby: hobby, cohort: {month: cohort, num: @months[cohort]}}
    puts "Now we have #{students.count} students"
    puts ""
    puts "Next student?"

  name = gets.strip.split(/ |\_/).map(&:capitalize).join(" ")
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
    students.sort_by!{|student| student[:cohort][:num]}
    puts "#{i+1}. #{students[i][:name]}\n - DOB: #{students[i][:dob]}\n - Country of birth: #{students[i][:country]}\n - Favourite Hobby: #{students[i][:hobby]}\n - Cohort: #{students[i][:cohort][:month]}"
    i += 1
    puts ""
  end
end


def print_footer(students)
  if students.count > 1
    puts "Overall, we have #{students.count} great students."
  else
    puts "Overall, we have #{students.count} great student."
  end
end

students = input_students
print(students)
print_footer(students)
