module Spree
  class Zipcode < ActiveRecord::Base
    has_one :zone_member, :as => :zoneable
    has_one :zone, :through => :zone_member
    validates_presence_of :zipcode
    validates_uniqueness_of :zipcode
    
    belongs_to :state # currently not linked to cities
    attr_accessible :zipcode, :city, :state_id
    
    before_create :set_state_abbr

    private
    
    def set_state_abbr
      self.state_abbr = self.state.abbr
    end
  end
end
