module Spree
  class Zipcode < ActiveRecord::Base
    has_one :zone_member, :as => :zoneable
    has_one :zone, :through => :zone_member
    validates_presence_of :zipcode
    validates_uniqueness_of :zipcode

    attr_accessible :zipcode
  end
end
