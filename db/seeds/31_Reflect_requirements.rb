# encoding: utf-8
I18n.locale = "en"
reflect = Activity.find_by_name("Reflect")

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "To manage reflections"
)
concrete_requirement.application = Application.find_by_name('ReFlex')
reflect.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "2",
  description: "To record teams' progress."
)
concrete_requirement.application = Application.find_by_name('TeamUp')
reflect.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "2",
  description: "Collaborative tool to make reflections and comments in several formats."
)
concrete_requirement.application = Application.find_by_name('VoiceThread')
reflect.concrete_requirements << concrete_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students and teachers record audio-visual reflections."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
reflect.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "Students need to share documents and maybe reflection files"
)
abstract_requirement.functionality = Functionality.find_by_name('communication and collaboration')
reflect.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students and the teacher record, post and share audio-visual reflections"
)
abstract_requirement.functionality = Functionality.find_by_name('stimulus and reflection')
reflect.abstract_requirements << abstract_requirement

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "2",
  description: "Annotation tools help teachers to assess their students' work and provide feedback"
)
abstract_requirement.functionality = Functionality.find_by_name('communication and collaboration')
reflect.abstract_requirements << abstract_requirement
