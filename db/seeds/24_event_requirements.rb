# encoding: utf-8
event_requirement = EventRequirement.create(
  name: "Needs a workshop in the classroom",
  optionality: "2",
  description: "This activity needs a workshop in the classroom"
)
event_requirement.event_type = EventType.find_by_name('workshop')
event_requirement.event_place = EventPlace.find_by_name('classroom')

event_requirement = EventConcreteRequirement.create(
  name: "Event concrete requirement",
  optionality: "1",
  description: "This activity needs a concrete event"
)
event_requirement.event = Event.find_by_name('Lernfestival 2013')
