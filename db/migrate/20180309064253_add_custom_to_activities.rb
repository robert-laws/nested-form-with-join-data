class AddCustomToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :custom, :boolean, default: false
  end
end
