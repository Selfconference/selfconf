Event.create!([
  {venue_id: 1, name: "self.conference", about: "Self.conference is a mix of fantastic tech presentations and insightful soft talks in fabulous downtown Detroit. We're filling two whole days in the middle of May with mobile, web, hardware, software, process, and team talks to help you expand your knowledge, meet other technically-minded folk, and immerse yourself in Detroit's tech renaissance.", twitter: "selfconference", lanyard: "2015/selfconf", tickets_link: "http://selfconf2015.eventbrite.com", tickets_iframe_link: "//eventbrite.com/tickets-external?eid=15432000529&ref=etckt", start_date: "2016-05-13 13:00:00", end_date: "2016-05-14 23:00:00"}
])
Event::HABTM_Organizers.create!([
  {event_id: 2, organizer_id: 1}
])
Organizer::HABTM_Events.create!([
  {event_id: 2, organizer_id: 1}
])
Room.create!([
  {name: "Ballroom", event_id: 2, venue_id: 1},
  {name: "MCC1", event_id: 2, venue_id: 1},
  {name: "MCC2", event_id: 2, venue_id: 1},
  {name: "MCC3", event_id: 2, venue_id: 1},
  {name: "MCC 4", event_id: 2, venue_id: 1},
  {name: "Amnesia", event_id: 2, venue_id: 1}
])
SponsorLevel.create!([
  {name: "Platinum", event_id: 2, order: 1},
  {name: "Gold", event_id: 2, order: 2},
  {name: "Silver", event_id: 2, order: 3},
  {name: "Bronze", event_id: 2, order: 4},
  {name: "Startup", event_id: 2, order: 5},
  {name: "Indie", event_id: 2, order: 6},
  {name: "Diversity", event_id: 2, order: 7},
  {name: "Attendee Party", event_id: 2, order: 8},
  {name: "Lanyard", event_id: 2, order: 9},
  {name: "Breakfast", event_id: 2, order: 10},
  {name: "Coffee", event_id: 2, order: 11},
  {name: "Snack", event_id: 2, order: 12}
])
