class VisitorsChannel < Turbo::StreamsChannel
  def subscribed
    super
    visitors = Kredis.unique_list 'visitors'
    visitors << session_user
    Turbo::StreamsChannel.broadcast_update_to(
      verified_stream_name_from_params,
      target: 'visitors_count',
      html: visitors.elements.count)
  end

  def unsubscribed
    super
    visitors = Kredis.unique_list 'visitors'
    visitors.remove session_user
    Turbo::StreamsChannel.broadcast_update_to(
      verified_stream_name_from_params,
      target: 'visitors_count',
      html: visitors.elements.count)
  end
end