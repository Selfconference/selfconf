event = Event.all.first

talk = event.sessions.create!(
  name: "Inclusive Web: Getting started with Accessibility",
  abstract: "An inclusive Web means reaching all technology users, including those with with visual impairments, motor impairments, and more. This talk covers a range of topics on Web Accessibility from the basic to the advanced. Let’s make the Web more accessible together!<br /><br />We will start with a discussion of keyboard shortcuts:<br />How and why they are used<br />Case studies of highly usable sites, including Twitter and Facebook<br />Ways you can easily get started with keyboard shortcuts on your site<br /><br />From there, we will move to screen readers and accessibility for the visually impaired. We will demo using some popular websites with the screen turned off to learn how screen readers work. Next, we will look at some easy wins for making non-accessible websites more usable via semantic naming and ARIA attributes. Finally, we’ll cover several existing tools and best practices for developing Accessible UIs every time you code."
)

speaker = talk.speakers.create!(
  name: "Jonathan Kuperman",
  twitter: "jkup",
  bio: "I am a web developer at Twitter, currently living in San Francisco. I’m passionate about Open Source Software and the open web, and spend most of my free time learning, reading, blogging and teaching."
)
speaker.update_attributes!(event_id: event.id)
