# encoding: utf-8
I18n.locale = "en"
dream = Activity.find_by_name("Dream")

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "Students or the teacher could create a blog to record their developments and proposals"
)
concrete_requirement.application = Application.find_by_name('Blogger')
dream.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "This tool is required for group formation and management"
)
concrete_requirement.application = Application.find_by_name('TeamUp')
dream.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "This tool is recommended for reflections management"
)
concrete_requirement.application = Application.find_by_name('ReFlex')
dream.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "2",
  description: "Student and teacher could use this tool to record their notes or reflections."
)
concrete_requirement.application = Application.find_by_name('Corkboard.me')
dream.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "This tool is recommended to collaborative editing and publishing."
)
concrete_requirement.application = Application.find_by_name('Google Sites')
dream.concrete_requirements << concrete_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "The teacher needs to provide feedback."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
dream.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "2",
  description: "Students could create a blog to record their reflections and to document their work online."
)
abstract_requirement.functionality = Functionality.find_by_name('text authoring and text and media publishing')
dream.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "2",
  description: "This type of functionality can be usefull to support students interaction and involvement."
)
abstract_requirement.functionality = Functionality.find_by_name('communication and collaboration')
dream.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students record a reflection and share it."
)
abstract_requirement.functionality = Functionality.find_by_name('stimulus and reflection')
dream.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "Students form teams. It's recommended a tool to manage forming teams."
)
abstract_requirement.functionality = Functionality.find_by_name('group and personal management')
dream.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "It's recommended for students to document their work"
)
abstract_requirement.functionality = Functionality.find_by_name('communication and collaboration')
dream.abstract_requirements << abstract_requirement
