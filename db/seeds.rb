Reservation.destroy_all
Activity.destroy_all

@activity_1 = Activity.create(name: "Fetch the Stick", description: "Sticks are thrown far and dogs run to retrieve them", best_for_type: "energetic", best_for_size: "big", energy_usage: "high")
@activity_2 = Activity.create(name: "Solve the Puzzle", description: "Treats are available for the dog that can solve the puzzle", best_for_type: "smart", best_for_size: "medium", energy_usage: "low")
@activity_3 = Activity.create(name: "Obstacle Course", description: "Dogs run through, over, and around a bunch of different obstacles", best_for_type: "agile", best_for_size: "medium", energy_usage: "high")
@activity_4 = Activity.create(name: "Indoors Ball Bounce", description: "A bouncy ball is thrown indoors for the dog to chase and catch", best_for_type: "energetic", best_for_size: "small", energy_usage: "high")

@reservation_1 = Reservation.create(date: Date.new(2018, 3, 10), drop_off_time: Time.new(2018, 3, 10, 9, 0, 0), pick_up_time: Time.new(2018, 3, 10, 17, 0, 0))

ReservationActivity.create(duration: 60, reservation: @reservation_1, activity: @activity_1)
ReservationActivity.create(duration: 30, reservation: @reservation_1, activity: @activity_3)