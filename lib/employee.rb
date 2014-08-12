class Employee <ActiveRecord::Base

  belongs_to(:division)

  def self.divisions(input)
    where({:division_id => input})
  end
end
