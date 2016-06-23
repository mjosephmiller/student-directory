def input_students
  puts "Please enter the names of the students"
  puts "To finsh, just hit return twice"

  students = []


  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

  name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end


def print(students)
@selected_students = []

  students.map do |student|
    if student[:name].length < 12
      @selected_students << student
      @selected_students.each  do |sel_student|
        puts "#{sel_student[:name]}, (#{sel_student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(students)
  puts "Looks like we have #{@selected_students.size} student(s) that have less than 12 characters in their names"
end

students = input_students
print(students)
print_footer(students)
