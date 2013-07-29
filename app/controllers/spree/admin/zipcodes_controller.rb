module Spree
  class Admin::ZipcodesController < Admin::ResourceController
    respond_to :html

    before_filter :load_states, :only => [:new, :edit]

    def index
      @search = Spree::Zipcode.order(:zipcode).ransack(params[:q])

      @zipcodes = @search.result.page(params[:page]).
        per(params[:per_page] || Spree::Config[:orders_per_page])
      respond_with(@zipcodes)
    end

    protected

    def load_states
      @states = Spree::State.order(:name)
    end      

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
