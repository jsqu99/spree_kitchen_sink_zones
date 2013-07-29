Deface::Override.new(
  :name => "add_zipcodes_to_admin_configuration_menu",
  :virtual_path => "spree/admin/shared/_configuration_menu",
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => 
   "<%= configurations_sidebar_menu_item Spree.t(:zipcodes), spree.admin_zipcodes_path %>"
)
