Event.create!([
  {venue_id: 1, name: "self.conference", about: "Self.conference is a mix of fantastic tech presentations and insightful soft talks in fabulous downtown Detroit. We're filling two whole days in the middle of May with mobile, web, hardware, software, process, and team talks to help you expand your knowledge, meet other technically-minded folk, and immerse yourself in Detroit's tech renaissance.", twitter: "selfconference", lanyard: "2015/selfconf", tickets_link: "http://selfconf2015.eventbrite.com", tickets_iframe_link: "//eventbrite.com/tickets-external?eid=15432000529&ref=etckt", start_date: "2016-05-20 13:00:00", end_date: "2016-05-21 23:00:00"}
])
Event::HABTM_Organizers.create!([
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
Venue.create!([
    {
      name: "MotorCity Casino",
      about: "MotorCity Casino is one of three luxury casino resort hotels in Detroit, and incorporates a historic building that once housed the Wagner Baking Company, makers of Wonder Bread. The complex houses a 100,000 square- foot casino with approximately 3,000 slot machines, 59 table games, and two poker rooms; D. Tour, a 13,000-square-foot spa with thermal whirlpools, steam rooms, and dry saunas; 67,000 square feet of meeting and convention space; Sound Board, a live music theater with a capacity of 2,400 people; and a luxury hotel with 400 guest rooms and suites.",
      maps_link: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2949.131682789498!2d-83.06965408464173!3d42.33971577918827!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x883b2d4d71da8bb1%3A0xe4a8072514ccbe55!2sMotorCity+Casino+Hotel!5e0!3m2!1sen!2sus!4v1453269868347",
      address: "2901 Grand River Avenue",
      events_id: 2,
    }
])
