class Event < ActiveRecord::Base
    belongs_to :tag 
    validates :start_at, uniqueness: true    
end
