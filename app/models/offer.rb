class Offer < ActiveRecord::Base
  belongs_to :user
  
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
    
  
end
