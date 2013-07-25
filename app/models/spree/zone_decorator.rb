module Spree
  Zone.class_eval do

    # Returns the matching zone with the highest priority zone type (State, Country, Zone.)
    # Returns nil in the case of no matches.
    def self.match(address)

      return unless matches = self.includes(:zone_members).
        order('zone_members_count', 'created_at').
        select { |zone| zone.include? address }

      ['city', 'state', 'country'].each do |zone_kind|
        if match = matches.detect { |zone| zone_kind == zone.kind }
          return match
        end
      end
      matches.first
    end

    def include?(address)
      return false unless address

      # NOTE: This is complicated by the fact that include? for HMP is broken in Rails 2.1 (so we use awkward index method)
      members.any? do |zone_member|
        case zone_member.zoneable_type
        when "Spree::Zone"
          zone_member.zoneable.include?(address)
        when "Spree::Country"
          zone_member.zoneable_id == address.country_id
        when "Spree::City"
          result = false
          address_city = find_city(address)

          if address_city.present?
            result = (zone_member.zoneable_id == address_city.id)
          end

          result
        when "Spree::State"
          zone_member.zoneable_id == address.state_id
        else
          false
        end
      end
    end

    def country_list
      members.map {|zone_member|
        case zone_member.zoneable_type
        when "Spree::Zone"
          zone_member.zoneable.country_list
        when "Spree::Country"
          zone_member.zoneable
        when "Spree::State"
          zone_member.zoneable.country
        when "Spree::City"
          zone_member.zoneable.country_list
        else
          nil
        end
      }.flatten.compact.uniq
    end

    def find_city(address)
      address_city = nil
      if address.city.present? && address.state.present?
        address_city = City.find(
          :first,
          :conditions => [
            'UPPER(name) = :name and state_id = :state_id',
            { :name => address.city.upcase, :state_id => address.state.id }
        ]
        )
      end
      address_city
    end
  end
end
