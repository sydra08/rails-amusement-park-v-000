class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if too_short? && not_enough_tickets?
      "Sorry. " + ticket_issue + " " + height_issue
    elsif not_enough_tickets?
      "Sorry. " + ticket_issue
    elsif too_short?
      "Sorry. " + height_issue
    else
      current_tickets = user.tickets - attraction.tickets
      current_nausea = user.nausea + attraction.nausea_rating
      current_happiness = user.happiness + attraction.happiness_rating
      user.update(
        tickets: current_tickets,
        happiness: current_happiness,
        nausea: current_nausea
        )
      "Thanks for riding the #{attraction.name}!"
    end
  end
  
  def too_short?
    attraction.min_height > user.height
  end

  def not_enough_tickets?
    attraction.tickets > user.tickets
  end

  def ticket_issue
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def height_issue
    "You are not tall enough to ride the #{attraction.name}."
  end

end
