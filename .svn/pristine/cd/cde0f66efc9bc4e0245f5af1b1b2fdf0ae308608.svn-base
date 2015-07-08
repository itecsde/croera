# encoding: utf-8
I18n.locale = "en"
collaborate = Activity.find_by_name("Collaborate")

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "0",
  description: "Students need a computer to do their work."
)
concrete_requirement.application = Device.find_by_name('Linux PC')
collaborate.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "With Facebook Groups students can collaborate with students from other schools."
)
concrete_requirement.application = Application.find_by_name('Facebook')
collaborate.concrete_requirements << concrete_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "They need collaborative tools to support international collaboration among schools."
)
abstract_requirement.functionality = Functionality.find_by_name('communication and collaboration')
collaborate.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "They need to capture images and audio for both students (reflections) and for teachers (feedback)."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
collaborate.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students share their work through blog entries."
)
abstract_requirement.functionality = Functionality.find_by_name('text authoring and text and media publishing')
collaborate.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "Students can communicate with colleagues from other schools."
)
abstract_requirement.functionality = Functionality.find_by_name('communication and collaboration')
collaborate.abstract_requirements << abstract_requirement

contributor_requirement = ContributorRequirement.create(
  name: "",
  optionality: "2",
  description: "It would be nice if one of the teachers who work in one of the schools acted as a coordinator to organize virtual meetings."
)
contributor_requirement.person_category = PersonCategory.find_by_name('teacher')
contributor_requirement.person_role = PersonRole.find_by_name('ICT coordinator')
collaborate.contributor_requirements << contributor_requirement

event_requirement = EventRequirement.create(
  name: "",
  optionality: "1",
  description: "It is recommended that students have virtual meetings with students of other schools to cooperate in their work."
)
event_requirement.event_type = EventType.find_by_name('virtual meeting')
event_requirement.event_place = EventPlace.find_by_name('virtual') 
collaborate.event_requirements << event_requirement
