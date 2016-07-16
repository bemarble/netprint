class Picture < ActiveRecord::Base
  validates :print_num, presence: true
  validates :description, presence: true

  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end

end
