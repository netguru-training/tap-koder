class Offer < ActiveRecord::Base
  belongs_to :user
  cattr_accessor :date, :time
  validates :name,
    :presence => true
  validates :description,
    :presence => true
  validates :code_limit,
   :numericality => {
     :greater_than_or_equal_to => 0,
     :only_integer => true
    },
   :presence => true
  validates_date :start_date,
    :after => lambda { Time.current },
    :after_message => "Oops, wrong date"
  scope :active, ->{ where("start_date < ?", DateTime.current) }
  scope :pending, ->{ where("start_date >= ?", DateTime.current) }
end
