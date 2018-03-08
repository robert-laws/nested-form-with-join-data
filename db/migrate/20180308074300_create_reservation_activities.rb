class CreateReservationActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_activities do |t|
      t.integer :duration
      t.belongs_to :reservation, foreign_key: true
      t.belongs_to :activity, foreign_key: true
    end
  end
end
