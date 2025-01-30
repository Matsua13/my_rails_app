class TaskDeadlineNotificationJob < ApplicationJob
  queue_as :default

  def perform
    tasks_near_deadline = Task.where("deadline <= ?", 1.hour.from_now)

    tasks_near_deadline.each do |task|
      # Afficher une notification simple dans la console
      puts "Attention ! La tâche '#{task.title}' approche de sa deadline : #{task.deadline}"
    end
  end
end
