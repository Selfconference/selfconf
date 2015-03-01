motor_city = Venue.create!(
  name: "Motor City Casino",
  about: "MotorCity Casino is one of three luxury casino resort hotels in Detroit, and incorporates a historic building that once housed the Wagner Baking Company, makers of Wonder Bread. The complex houses a 100,000 square- foot casino with approximately 3,000 slot machines, 59 table games, and two poker rooms; D. Tour, a 13,000-square-foot spa with thermal whirlpools, steam rooms, and dry saunas; 67,000 square feet of meeting and convention space; Sound Board, a live music theater with a capacity of 2,400 people; and a luxury hotel with 400 guest rooms and suites.",
  maps_link: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2949.1478533042405!2d-83.06766400000001!3d42.339371000000014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x883b2d4d71da8bb1%3A0xe4a8072514ccbe55!2sMotorCity+Casino+Hotel!5e0!3m2!1sen!2sus!4v1421119388503",
  address: "Motor City Casino, 2901 Grand River Avenue"
)

event = motor_city.events.create!(
  name: "self.conference",
  about: "Self.conference is a mix of fantastic tech presentations and insightful soft talks in fabulous downtown Detroit. We're filling two whole days at the end of May with mobile, web, hardware, software, process, and team talks to help you expand your knowledge, meet other technically-minded folk, and immerse yourself in Detroit's tech renaissance.",
  twitter:"selfconference",
  lanyard: "2015/selfconf",
  start_date: "Fri, 29 May 2015 08:00:00 EST -05:00",
  end_date: "Sat, 30 May 2015 18:00:00 EST -05:00",
  tickets_link: "http://selfconf2015.eventbrite.com",
  tickets_iframe_link: "//eventbrite.com/tickets-external?eid=15432000529&ref=etckt"
)

ballroom = motor_city.rooms.create!(name: "Ballroom")
ballroom.update_attributes!(event_id: event.id)

mcc1 = motor_city.rooms.create!(name: "MCC1")
mcc1.update_attributes!(event_id: event.id)

mcc2 = motor_city.rooms.create!(name: "MCC2")
mcc2.update_attributes!(event_id: event.id)

mcc3 = motor_city.rooms.create!(name: "MCC3")
mcc3.update_attributes!(event_id: event.id)

amnesia = motor_city.rooms.create!(name: "Amnesia")
amnesia.update_attributes!(event_id: event.id)

searls = event.speakers.create!(
  name: "Justin Searls",
  twitter: "searls",
  photo: "http://s3.amazonaws.com/selfconf/speakers/justin-searls.jpg",
  bio: "Justin Searls has two professional passions: writing great software and sharing what he’s learned to help others write even greater software. He helped start a software agency called Test Double, whose crack team of double agents solve complex problems with clean and simple solutions."
)
talk = searls.sessions.create!(
  name: "The Social Coding Contract",
  abstract: "Social coding revolutionized how we share useful code with others. Bundler, npm, and Github made publishing and consuming code so convenient that our dependencies have become smaller and more numerous. Nowadays, most projects quickly resemble a Jenga tower, with layer upon layer of poorly understood single points of failure.<br /><br />Despite our progress, we'd benefit from pausing to reflect on our relationship with open source. Convenience and ego drive most open source adoption, but these shortsighted motivations raise long-term problems we need to clearly identify if we can ever hope to solve them."
)
talk.update_attributes!(event_id: event.id)

event.speakers.create!(
  name: "Brianna Wu",
  twitter: "spacekatgal",
  photo: "http://s3.amazonaws.com/selfconf/speakers/brianna-wu.jpg",
  bio: "Brianna Wu is the head of development at Giant Spacekat, a company specializing in cinematic experiences using the Unreal engine. She’s also a frequent speaker on women-in-tech issues. In the past, she’s worked as a journalist and a politico. When she’s not developing software, she enjoys racing motorcycles and running marathons."
)

coraline = event.speakers.create!(
  name: "Coraline Ehmke",
  twitter: "CoralineAda",
  photo: "http://s3.amazonaws.com/selfconf/speakers/coraline-ehmke.jpg",
  bio: "Coraline Ada Ehmke is a speaker, author, teacher, open source advocate and technologist with 20 years of experience in developing apps for the web. As a founding member of LGBTech, <a href=\"http://cultureoffset.org/\">CultureOffset.org</a> and <a href=\"http://contributor-covenant.org/\">contributor-covenant.org</a>, she works diligently to promote diversity and inclusivity in the tech industry. Her current interests include refactoring, code analytics and artificial intelligence."
)
talk = coraline.sessions.create!(
  name: "Aesthetics and the Evolution of Code",
  abstract: "Symmetry. Simplicity. Elegance. Patterns. Much of how we understand, describe, and value code is based on subjective criteria that are easy for us to grasp intuitively but almost impossible to define or communicate objectively. This talk expores the role that concepts such as beauty, sublimity, completeness and simplicity play in the way that we model reality in software, relate to our own and other people's code, and ultimately measure the value of our work as professionals."
)
talk.update_attributes!(event_id: event.id)

mike = event.speakers.create!(
  name: "Mike Lee",
  twitter: "bmf",
  photo: "http://s3.amazonaws.com/selfconf/speakers/mike-lee.jpg",
  bio: "Mike Lee is an Apple Design Award winning software engineer living in an impressionist painting in Amsterdam. He has worked on a bunch of apps, given a bunch of presentations, and been involved with a bunch of companies, some of which you've probably heard of."
)
talk = mike.sessions.create!(
  name: "Planetary Engineering",
  abstract: "Maybe it's naïve to start a company to do more than make money. Maybe it's arrogant to want to change the world. Still, the skills used to make a million-user iPhone game can also be used to make a toolbox for the supporters of a political candidate, or to help people with special needs.<br /><br />Our bright future has been hijacked by absurd greed and petty bickering. The information war and climate change have become impossible to ignore. Rich people have started building massive yachts. The internet got mean. The rising pressure to sell out or get beat up makes it hard not to become cynical or depressed. <br /><br />When others consider a problem unsolvable, engineers break them down into smaller problems until a team of experts and the necessary materials can be brought together to craft a solution. <br /><br />We have the power, as the creative class, to stand up and take responsibility for the future we are building. We have the power to achieve our potential, to live up to our dreams. We have the power to tackle planet-scale problems."
)
talk.update_attributes!(event_id: event.id)

event.sponsor_levels.create(name: "Platinum", order: 1)
event.sponsor_levels.create(name: "Gold", order: 2)
silver = event.sponsor_levels.create(name: "Silver", order: 3)
event.sponsor_levels.create(name: "Bronze", order: 4)
event.sponsor_levels.create(name: "Startup", order: 5)
indie = event.sponsor_levels.create(name: "Indie", order: 6)
diversity = event.sponsor_levels.create(name: "Diversity", order: 7)
event.sponsor_levels.create(name: "Attendee Party", order: 8)
lanyard = event.sponsor_levels.create(name: "Lanyard", order: 9)
event.sponsor_levels.create(name: "Breakfast", order: 10)
coffee = event.sponsor_levels.create(name: "Coffee", order: 11)
snack = event.sponsor_levels.create(name: "Snack", order: 12)

deque = event.sponsors.create!(
  name: "Deque",
  link: "http://www.deque.com/",
  photo: "http://s3.amazonaws.com/selfconf/sponsors/deque.png"
)
deque.sponsor_levels.push(silver)

bit = event.sponsors.create!(
  name: "Blacks in Technology",
  link: "http://www.blacksintechnology.net/",
  photo: "http://s3.amazonaws.com/selfconf/sponsors/bit.jpg"
)
bit.sponsor_levels.push(diversity)

labs = event.sponsors.create!(
  name: "Detroit Labs",
  link: "http://detroitlabs.com",
  photo: "http://s3.amazonaws.com/selfconf/sponsors/dl.png"
)
labs.sponsor_levels.push(diversity)
labs.sponsor_levels.push(diversity)
labs.sponsor_levels.push(lanyard)
labs.sponsor_levels.push(snack)

build_it_securely = event.sponsors.create!(
  name: "Build It Secure.ly",
  link: "http://builditsecure.ly/",
  photo: "http://s3.amazonaws.com/selfconf/sponsors/builditsecurely.png"
)
indie.sponsors.push(build_it_securely)

maitria = event.sponsors.create!(
  name: "Maitria",
  link: "http://maitria.com/",
  photo: "http://s3.amazonaws.com/selfconf/sponsors/maitria.png"
)
indie.sponsors.push(maitria)

penguicon = event.sponsors.create!(
  name: "Penguicon",
  link: "http://www.penguicon.org/",
  photo: "http://s3.amazonaws.com/selfconf/sponsors/penguicon.jpeg"
)
coffee.sponsors.push(penguicon)
coffee.sponsors.push(penguicon)

amber = event.organizers.create!(
  name: "Amber Conville",
  bio: "Amber Conville is a developer at <a href=\"http://testdouble.com\">Test Double</a>, and has been a software developer for 6 years. She loves code in lots of languages, tdd, craftsmanship, and the software community, and can be found helping out with user groups, conferences, and nerd gatherings whenever possible.",
  email: "amber@selfconference.org",
  twitter: "crebma",
  photo: "http://s3.amazonaws.com/selfconf/organizers/amber.jpg"
)

erika = event.organizers.create!(
  name: "Erika Carlson",
  bio: "Erika Carlson was studying clinical psychology in 2011, when she wrote her first line of Python code. She fell in love with programming, decided to change paths, and is now a software developer at <a href=\"http://detroitlabs.com\">Detroit Labs</a>.<br /><br />Erika teaches web development and gives introductory programming presentations at elementary and middle schools. She is passionate about the potential of technology to create positive change in the world, and is working to create more opportunities for technology education in Detroit.",
  email: "erika@selfconference.org",
  twitter: "eacarlson",
  photo: "http://s3.amazonaws.com/selfconf/organizers/erika.jpg"
)

chelsey = event.organizers.create!(
  name: "Chelsey Baker",
  bio: "Chelsey has been programming professionally since 2012 when she graduated from the University of Michigan-Dearborn, focusing on iOS since 2013. She loves Michigan football, Mexican food, and working out daily as much as the satisfaction of well written, properly formatted code.",
  email: "chelsey@selfconference.org",
  twitter: "_chelseybaker",
  photo: "http://s3.amazonaws.com/selfconf/organizers/chelsey.jpg"
)
