# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|  
  # Specify a custom renderer if needed. 
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # navigation.renderer = Your::Custom::Renderer
  
  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'
    
  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false
  
  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
 navigation.items do |primary|
  
 	 primary.item :contacts, 'Kontakty',contacts_path  do |sub_nav|
 	 	 sub_nav.item :list, 'Přehled', contacts_path 
    	sub_nav.item :new, 'New', new_contact_path
    	sub_nav.item :new, 'Statistic',:controller => 'contacts', :action => 'statistic'
    	
    end 
    primary.item :users, 'users', :controller => 'users', :action => 'current', :id => 'edit'  do |sub_nav|
    	sub_nav.item :new, 'new', new_user_path
    	sub_nav.item :new, 'Current', :controller => 'users', :action => 'current', :id => 'edit' 
    end 
  
	end
  
end