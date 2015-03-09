event = Event.all.first

talk = event.sessions.create!(
  name: "Everything is fine. Nothing is fine. Lessons learned from transitioning roles.",
  abstract: "A look at failures and successes for anyone interested in making the jump from one part of the organization to another. Whether you're a UX designer that secretly loves programming or a product manager needing something more, this session reflects on lessons learned and delightful missteps in the wacky world of software development.<br /><br />In this talk we'll look at why the hunger to learn and continued exploration can lead to a bumpy path, and why that path is so important. We'll explore key takeaways from folks that have made a career transition and lived to tell the tale."
)

speaker = talk.speakers.create!(
  name: "Ashley Hathaway",
  twitter: "ash_hathaway",
  bio: "Ashley Hathaway is a product manager who believes great design is great business. She excels in telling stories that distill large ideas into executable visions. Her previous role as a UX designer and front-end developer help her develop the product vision from holistic idea to tactile execution. Her process is rooted in scalability and collaboration while always maintaining a sense of humor.<br /><br />Ashley is currently working for IBM Watson as part of the IBM Design Studio in Austin, Texas."
)
speaker.update_attributes!(event_id: event.id)
