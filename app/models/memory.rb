class Memory < ApplicationRecord
  belongs_to :user

  def start_time
    self.memory_date
  end

  with_options presence: true do
    validates :title
    validates :memory_date
  end
end
