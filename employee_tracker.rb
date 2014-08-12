require 'active_record'
require 'pry'

require './lib/employee'
require './lib/division'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)


def welcome
  puts "Welcome to the Employee Tracker!"
  menu
end

def menu
  system("clear")
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add a employee, 'l' to list your employee."
    puts "Press 'ld' to list the divisions or 'le' to list employees by division"
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'd'
      add_division
    when 'l'
      list
    when 'ld'
      list_divisions
    when 'le'
      list_div_employees
    when 'x'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add
  puts "Who do you need to add?"
  employee_name = gets.chomp
  list_divisions
  puts "which division do they belong to?"
  new_division = gets.chomp
  division = Division.create({:name => new_division})
  employee = Employee.create({:name => employee_name, :division_id => division.id})
  puts "'#{employee_name}' has been added to your tracker."
end

def add_division
  puts "What division do you need to add?"
  division_name = gets.chomp
  division = Division.new({:name => division_name})
  division.save
  puts "'#{division_name}' has been added to your tracker."
end

def list_div_employees
  list_divisions
  puts "Choose a division number and see all its employees"
  user_select = gets.chomp.to_i
  results = Employee.divisions(user_select)
  results.each do |result|
    puts result.name
  end
end


def list
  puts "Here is everyone:"
  Employee.all.each { |employee| puts employee.name }
end

def list_divisions
  puts "Here are the divisions:"
  Division.all.each { |division| puts "#{division.id}. #{division.name}"}
end

welcome
