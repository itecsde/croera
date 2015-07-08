# encoding: utf-8
I18n.locale = "en"
ask = Activity.find_by_name("Ask")

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students need to record their expert meetings and proposals."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
ask.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students update their blog with the new info from meetings with experts."
)
abstract_requirement.functionality = Functionality.find_by_name('text authoring and text and media publishing')
ask.abstract_requirements << abstract_requirement

contributor_requirement = ContributorRequirement.create(
  name: "",
  optionality: "1",
  description: "Students show their prototypes to domain experts. Students also make questions to experts and ask for their help and support. University students could be invited to participate in 'workshops' in schools to support your students during working."
)
contributor_requirement.person_category = PersonCategory.find_by_name('expert')
contributor_requirement.person_role = PersonRole.find_by_name('other')
ask.contributor_requirements << contributor_requirement

event_requirement = EventRequirement.create(
  name: "",
  optionality: "1",
  description: "Students are taken to an event where they can show their prototypes and meet with people (specially experts)."
)
event_requirement.event_type = EventType.find_by_name('workshop')
event_requirement.event_place = EventPlace.find_by_name('street') 
ask.event_requirements << event_requirement
