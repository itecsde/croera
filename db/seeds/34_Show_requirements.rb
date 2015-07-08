# encoding: utf-8
I18n.locale = "en"
show = Activity.find_by_name("Show")

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "Video publication and sharing."
)
concrete_requirement.application = Application.find_by_name('YouTube')
show.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "2",
  description: "To record teams' progress."
)
concrete_requirement.application = Application.find_by_name('TeamUp')
show.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "2",
  description: "To manage reflections"
)
concrete_requirement.application = Application.find_by_name('ReFlex')
show.concrete_requirements << concrete_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students have to edit and create videos. They can add subtitles."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
show.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students create a video describing the activities they have done."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
show.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "Students could post their videos to blogs. In this way they would get a larger audience"
)
abstract_requirement.functionality = Functionality.find_by_name('text authoring and text and media publishing')
show.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "Students could make a presentations to their classmates"
)
abstract_requirement.functionality = Functionality.find_by_name('presentation authoring and delivery')
show.abstract_requirements << abstract_requirement

