class AddNotifiedToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :notified, :boolean
  end
end
