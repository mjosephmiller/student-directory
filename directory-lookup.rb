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
  puts 'Please enter the initial of the student you would like to print:'
  @initial = gets.chomp

  students.each do |student|
    if student[:name][0] == @initial
      @selected_students << student
      @selected_students.each  do |sel_student|
        puts "#{sel_student[:name]}, (#{sel_student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(students)
  puts "Looks like we have #{@selected_students.size} great student(s) that share(s) the initial #{@initial}"
end

students = input_students
print(students)
print_footer(students)
