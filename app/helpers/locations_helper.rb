module LocationsHelper
  def html_link_to(location)
    link_to location.address, location_path(location),
            class: 'underline text-sky-500 hover:text-sky-300 font-semibold', target: '_blank'
  end
end
