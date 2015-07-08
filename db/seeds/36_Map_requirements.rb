# encoding: utf-8
I18n.locale = "en"
map = Activity.find_by_name("Map")

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "Online tool to make conceptual maps."
)
concrete_requirement.application = Application.find_by_name('Bubbl.us')
map.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "Tool to make conceptual maps."
)
concrete_requirement.application = Application.find_by_name('CmapTools')
map.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "Online tool to make conceptual maps."
)
concrete_requirement.application = Application.find_by_name('Popplet')
map.concrete_requirements << concrete_requirement

concrete_requirement = ConcreteRequirement.create(
  name: "",
  optionality: "1",
  description: "Online tool to make conceptual maps."
)
concrete_requirement.application = Application.find_by_name('MindMeister')
map.concrete_requirements << concrete_requirement
  
abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "To represent conceptual maps relating the main concepts and their relationships"
)
abstract_requirement.functionality = Functionality.find_by_name('presentation authoring and delivery')
map.abstract_requirements << abstract_requirement  

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "It is needed to capture images and audio clips. Students are entitled to provide reflections and observations. The teacher needs to provide feedback."
)
abstract_requirement.functionality = Functionality.find_by_name('multimedia authoring and capture')
map.abstract_requirements << abstract_requirement  

abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "0",
  description: "Students update their blogs with new posts and comments."
)
abstract_requirement.functionality = Functionality.find_by_name('text authoring and text and media publishing')
map.abstract_requirements << abstract_requirement 
  
abstract_requirement = AbstractRequirement.create(
  name: "",
  optionality: "1",
  description: "To annotate concept map"
)
abstract_requirement.functionality = Functionality.find_by_name('information gathering and organisation')
map.abstract_requirements << abstract_requirement   
