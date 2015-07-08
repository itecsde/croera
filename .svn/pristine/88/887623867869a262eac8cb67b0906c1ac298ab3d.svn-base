# encoding: utf-8
I18n.locale = "en"
make = Activity.find_by_name("Make")

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "To document students prototypes in presentations with their media files."
)
concrete_requirement.application = Application.find_by_name('Prezi')
make.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "To record teams' progress."
)
concrete_requirement.application = Application.find_by_name('TeamUp')
make.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "To manage reflections"
)
concrete_requirement.application = Application.find_by_name('ReFlex')
make.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "2",
  description: "Scratch is a programming language that makes it easy to create interactive stories, animations, games, music,.. and share creations on the web."
)
concrete_requirement.application = Application.find_by_name('Scratch')
make.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "2",
  description: "3D editing to make better prototypes"
)
concrete_requirement.application = Application.find_by_name('SketchUp')
make.concrete_requirements << concrete_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "Students may need to use a tool with this functionality to develop prototypes."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
make.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students create documents with images and videos of their prototypes. In addition, students need to record their reflections when the activity is finished."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
make.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students update their blog with the new info. A new post can be included."
)
abstract_requirement.functionality = Functionality.find_by_name('text authoring and text and media publishing')
make.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "It's important to make reflections of students' prototypes."
)
abstract_requirement.functionality = Functionality.find_by_name('stimulus and reflection')
make.abstract_requirements << abstract_requirement

