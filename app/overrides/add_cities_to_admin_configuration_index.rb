Deface::Override.new(
  :name => "add_cities_to_admin_configuration_menu",
  :virtual_path => "spree/admin/shared/_configuration_menu",
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => 
   "<%= configurations_sidebar_menu_item Spree.t(:cities), spree.admin_country_state_cities_path(Spree::Config[:default_country_id],Spree::State.find(:first, :conditions => {:country_id => Spree::Config[:default_country_id], :abbr => 'CA'})) %>"
)
