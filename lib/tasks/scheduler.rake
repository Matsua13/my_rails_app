namespace :tasks do
  desc "Look for the tasks close to their deadline"
  task notify: :environment do
    puts "Execution of job for notification..."
    TaskDeadlineNotificationJob.perform_now
    puts "Job done!"
  end
end
