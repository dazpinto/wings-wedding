# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|


  navigation.items do |primary|
    primary.dom_class = 'nav'

    primary.item :venue, 'Venue', venue_path
    primary.item :photos, 'Photos', photos_path
    primary.item :contact, 'Contact', contact_path
    primary.item :rsvps, 'RSVP', new_rsvp_path
    primary.item :requests, 'Song requests', song_requests_path
  end

end
