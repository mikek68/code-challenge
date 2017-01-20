class BookingSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :end, :url

  def url
    view_context.booking_path(object.id)
  end

  def start
    object.check_in_date
  end

  def end
    object.check_out_date
  end

  def title
    "#{object.hotel.name} - Room #{object.room.room_number} (#{object.room.room_type.name})"
  end
end
