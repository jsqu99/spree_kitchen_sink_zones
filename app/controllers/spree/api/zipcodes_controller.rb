module Spree
  module Api
    class ZipcodesController < Spree::Api::BaseController
      def index
        if params[:id]
          @zipcodes = Spree::Zipcode.where(:id => params[:id])
          # render 'spree/api/zipcodes/show' if @zipcode
        else
          # this was horrible, performance-wise
          # @zipcodes = Spree::Zipcode.scoped.ransack(params[:q]).result

          if params[:q][:zipcode_start].present?
            arel_table = Spree::Zipcode.arel_table
            @zipcodes = Spree::Zipcode.where(arel_table[:zipcode].matches("#{params[:q][:zipcode_start]}%"))
          else
            @zipcodes = Spree::Zipcode.scoped
          end
        end

        respond_with(@zipcodes)
      end

      def show
      	@zipcode = Spree::Zipcode.find(params[:id])
      	respond_with(@zipcode.to_arr) # lame, i know.  trying to make the javascript happy
      end

    end
  end
end
