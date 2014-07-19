class Offer < ActiveRecord::Base
  belongs_to :user
  has_many :codes
  cattr_accessor :date, :time
  validates :name, presence: true
  validates :description, presence: true
  validates :code_limit, presence: true,
   numericality: {
     greater_than: 0,
     only_integer: true
    }
  validates_date :start_date,
    after: lambda { DateTime.current },
    after_message: "Oops, wrong date"
  scope :active, ->{ where("start_date < ?", DateTime.current) }
  scope :pending, ->{ where("start_date >= ?", DateTime.current) }
end
