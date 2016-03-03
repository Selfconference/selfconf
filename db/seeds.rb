venue = Venue.create! name: "MotorCity Casino",
                      about: "about this venue!",
                      maps_link: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2949.131682789498!2d-83.06965408464173!3d42.33971577918827!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x883b2d4d71da8bb1%3A0xe4a8072514ccbe55!2sMotorCity+Casino+Hotel!5e0!3m2!1sen!2sus!4v1453269868347",
                      address: "MotorCity Casino, 2901 Grand River Avenue"

event = Event.create! venue: venue,
              name: "event name",
              about: "about this conference",
              twitter: "twitter",
              lanyard: "2015/selfconf",
              tickets_link: "http://selfconf2015.eventbrite.com",
              tickets_iframe_link: "//eventbrite.com/tickets-external?eid=15432000529&ref=etckt",
              start_date: "2016-05-20 13:00:00",
              end_date: "2016-05-21 23:00:00"

event.slots.create! [
  { time: Date.parse("Fri, 20 May 2016 14:00:00 UTC +00:00") },
  { time: Date.parse("Fri, 20 May 2016 15:00:00 UTC +00:00") },
  { time: Date.parse("Fri, 20 May 2016 16:00:00 UTC +00:00") },
  { time: Date.parse("Fri, 20 May 2016 18:00:00 UTC +00:00") },
  { time: Date.parse("Fri, 20 May 2016 19:00:00 UTC +00:00") },
  { time: Date.parse("Fri, 20 May 2016 20:00:00 UTC +00:00") },
  { time: Date.parse("Fri, 20 May 2016 21:00:00 UTC +00:00") },
  { time: Date.parse("Sat, 21 May 2016 14:00:00 UTC +00:00") },
  { time: Date.parse("Sat, 21 May 2016 15:00:00 UTC +00:00") },
  { time: Date.parse("Sat, 21 May 2016 16:00:00 UTC +00:00") },
  { time: Date.parse("Sat, 21 May 2016 18:00:00 UTC +00:00") },
  { time: Date.parse("Sat, 21 May 2016 19:00:00 UTC +00:00") },
  { time: Date.parse("Sat, 21 May 2016 20:00:00 UTC +00:00") },
  { time: Date.parse("Sat, 21 May 2016 21:00:00 UTC +00:00") }
]

event.organizers.create! name: "your name",
                              bio: "things about you",
                              email: "you@email.com",
                              twitter: "twitter",
                              photo: "http://placekitten.com/200/200"

venue.rooms.create! [
  {name: "Big Room", event_id: event.id, order: 0},
  {name: "Breakout 1", event_id: event.id, order: 1},
  {name: "Breakout 2", event_id: event.id, order: 2},
  {name: "Breakout 3", event_id: event.id, order: 3}
]

event.sponsor_levels.create! [
  {name: "Platinum", order: 1},
  {name: "Gold", order: 2},
  {name: "Silver", order: 3},
  {name: "Bronze", order: 4}
]
