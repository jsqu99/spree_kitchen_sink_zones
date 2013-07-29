module Spree
  class Admin::ZipcodesController < Admin::ResourceController

    def index
      respond_with(@collection) do |format|
        format.html
        format.js  { render :partial => 'zipcode_list.html.erb' }
      end
    end

    protected

    def location_after_save
      admin_zipcodes_url
    end

    def collection_url
      admin_zipcodes_url
    end

    def collection
      super.order(:zipcode)
    end

  end
end
