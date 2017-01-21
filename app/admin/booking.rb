ActiveAdmin.register Booking do

  actions :index, :show

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
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
  column :check_in_date
  column :check_out_date
  column :stay_description
  column 'Hotel' do |booking|
    booking.hotel.name
  end
  column 'Charges' do |booking|
    "$#{booking.total_charges}"
  end
  column 'Paid?' do |booking|
    booking.charge.present?
  end
  actions
end


end
