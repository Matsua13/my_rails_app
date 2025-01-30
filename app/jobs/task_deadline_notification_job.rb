class TaskDeadlineNotificationJob < ApplicationJob
  queue_as :default

  def perform
    tasks = Task.where("deadline <= ?", Time.now + 10.minutes).where(notified: false)
    tasks.each do |task|
      # Ici, tu peux envoyer un email, une notification push, ou juste un message
      # Exemple d'email :
      TaskNotifier.send_deadline_warning(task).deliver_later
      task.update(notified: true)
    end
  end
end
