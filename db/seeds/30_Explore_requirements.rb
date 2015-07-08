# encoding: utf-8
I18n.locale = "en"
explore = Activity.find_by_name("Explore")

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "TeamUp is recommended to forming and manage teams"
)
concrete_requirement.application = Application.find_by_name('TeamUp')
explore.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "ReFlex is recommended to manage record reflections."
)
concrete_requirement.application = Application.find_by_name('ReFlex')
explore.concrete_requirements << concrete_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "It is needed to capture images and audio clips. Students are entitled to provide reflections and observations. The teacher needs to provide feedback."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
explore.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students need to share documents"
)
abstract_requirement.functionality = Functionality.find_by_name('communication and collaboration')
explore.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "Students update their blogs with new posts and comments."
)
abstract_requirement.functionality = Functionality.find_by_name('text authoring and text and media publishing')
explore.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "This type of functionality can be usefull to support students interaction and involvement."
)
abstract_requirement.functionality = Functionality.find_by_name('communication and collaboration')
explore.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "It's recommended for students to document their work."
)
abstract_requirement.functionality = Functionality.find_by_name('communication and collaboration')
explore.abstract_requirements << abstract_requirement

event_requirement = EventRequirement.create(
  name: "",
  optionality: "1",
  description: "Try to connect students with their community sending them to observe outside of school."
)
event_requirement.event_type = EventType.find_by_name('school event')
event_requirement.event_place = EventPlace.find_by_name('street') 
explore.event_requirements << event_requirement
