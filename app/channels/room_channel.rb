class RoomChannel < Turbo::StreamsChannel
  def subscribed
    super
    visitors = Kredis.unique_list ['room', params[:room_id]].join
    visitors << session_user
    Turbo::StreamsChannel.broadcast_update_to(
      verified_stream_name_from_params,
      target: "room_#{params[:room_id]}_visitors_count",
      html: visitors.elements.count)
  end

  def unsubscribed
    super
    visitors = Kredis.unique_list ['room', params[:room_id]].join
    visitors.remove session_user
    Turbo::StreamsChannel.broadcast_update_to(
      verified_stream_name_from_params,
      target: "room_#{params[:room_id]}_visitors_count",
      html: visitors.elements.count)
  end
end