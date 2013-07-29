module Spree
  Admin::ZonesController.class_eval do
    before_filter :load_cities, :except => [:index]
    before_filter :load_zipcodes, :except => [:index]

    protected

    def load_cities
      @cities = City.order(:name)
    end

    def load_zipcodes
      @zipcodes = Zipcode.order(:zipcode)
    end

  end
end
