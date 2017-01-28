class Task < ActiveRecord::Base
  belongs_to :goal
 validates :goal_id, presence: true
  validates :name, presence: true, length: { maximum: 500 }
  validates :frequency, presence: true
  validates :completion_status, presence: true
 
  enum frequency: { daily: 0, weekly: 1, monthly: 2, yearly: 3 }
  enum completion_status: { incomplete: 0, complete: 1 }
  

end
