require './lib/task'
require './lib/list'

@list = []
@list_arr = []

def main_menu
  loop do
    puts "Press 'n' to add a new list"
    puts "Press 'a' to add a task, 'l' to list all of your tasks"
    puts "Press 'c' to mark a task completed."
    puts "Press 's' to see all of your lists"
    puts "Press 'r' to remove a task, 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'n'
      add_list
    elsif main_choice == 'a'
      add_task
    elsif main_choice == 'l'
      list_tasks
    elsif main_choice == 's'
      show_list
    elsif main_choice == 'r'
      remove_task
    elsif main_choice == 'c'
      complete_task
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_list
  puts "Enter a list name"
  list_input = gets.chomp
  List.new(list_input).save
end

def show_list
  puts "Here are your lists:"
  List.all.each_with_index do |list, index|
    puts list.list_name + '  ' + index.to_s
  end
end

def add_task
  show_list
  puts "which list would you like to enter a task for?"
  puts "please enter the number of the list"
  marked_list = gets.chomp.to_i
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  newTask = Task.new(user_description)
  List.all[marked_list].add_task(newTask)
  puts "Task added.\n\n"
end

def list_tasks
  show_list
  puts "which list would you like to enter a task for?"
  puts "please enter the number of the list"
  marked_list = gets.chomp.to_i
  puts "Here are all of your tasks:"
  List.all[marked_list].tasks.each do |task|
    puts task.description
  end
  puts "\n"
end

def remove_task
  puts "Remove a task from your list"
  show_list
  puts "which list would you like to remove a task?"
  puts "please enter the number of the list"
  marked_list = gets.chomp.to_i
  List.all[marked_list].tasks.each_with_index do |task, index|
    puts task.description + '  ' + index.to_s
  end
  puts  "Enter the number of the task you would like to remove"
  marked_task = gets.chomp.to_i
  List.all[marked_list].tasks.delete_at(marked_task)
end

def complete_task
  show_list
  puts "Which list would you like to mark a task completed"
  marked_list = gets.chomp.to_i
  puts "Mark a task completed"
  List.all[marked_list].tasks.each_with_index do |task, index|
    puts task.description + '  ' + index.to_s
  end
  puts "Enter the number of the task you would like to mark as done"
  marked_task = gets.chomp.to_i
  puts List.all[marked_list].tasks[marked_task].description << '  done'
end
main_menu
