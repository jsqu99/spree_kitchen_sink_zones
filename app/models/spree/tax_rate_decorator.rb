module Spree
  TaxRate.class_eval do
    # Gets the array of TaxRates appropriate for the specified order
    def self.match(order)
      return [] unless order.tax_zone
      [where(:zone_id => order.tax_zone.id).first].compact
    end
  end
end
