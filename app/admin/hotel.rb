ActiveAdmin.register Hotel do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :address, :city, :state, :zip_code, :phone_number
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  id_column
  column :name
  column :address
  column :city
  column :state
  column :zip_code
  column :phone_number
  column 'Rooms', sortable: :rooms_count do |hotel|
    hotel.rooms_count
  end
  actions
end

end
