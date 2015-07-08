# encoding: utf-8
I18n.locale = "en"
scenario_template = Scenario.create(
  name: 'Scenario template',
  description: 'This is a template to create iTEC-like scenario.',
  template: 1
)
scenario_template.save
I18n.locale = "gl"
scenario_template.name = 'Plantilla do guión'
scenario_template.description = 'Esta é unha plantilla para crear guións de iTEC.'
scenario_template.template= 1
scenario_template.save

I18n.locale = "en"


##### Core purpose
core_purpose = Box.create(
  box_type: "full_box",
  position: 1
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Core purpose",
  position: 1
)
I18n.locale = "gl"
text.content = "Propósito principal"
I18n.locale = "en"
header.texts << text
textarea = Component.create(
  component_type: "textarea",
  position: 2
)
text = Text.create(
  content: "Write here the core purpose",
  position: 1
)
I18n.locale = "gl"
text.content = "Escribe aquí o proposito principal"
I18n.locale = "en"
textarea.texts << text
core_purpose.components << header
core_purpose.components << textarea
scenario_template.boxes << core_purpose

## Horizontal rule
horizontal_rule_box = Box.create(
  box_type: "full_box",
  position: 2
)
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 1
)
horizontal_rule_box.components << horizontal_rule
scenario_template.boxes << horizontal_rule_box

##### Narrative overview
narrative_overview = Box.create(
  box_type: "full_box",
  position: 3
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Narrative overview",
  position: 1
)
I18n.locale = "gl"
text.content = "Resumo narrativo"
I18n.locale = "en"
header.texts << text
textarea = Component.create(
  component_type: "textarea",
  position: 2
)
text = Text.create(
  content: "Write here the narrative overview",
  position: 1
)
I18n.locale = "gl"
text.content = "Escribe aquí o resumo narrativo"
I18n.locale = "en"
textarea.texts << text
narrative_overview.components << header
narrative_overview.components << textarea
scenario_template.boxes << narrative_overview


## Horizontal rule
horizontal_rule_box = Box.create(
  box_type: "full_box",
  position: 4
)
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 1
)
horizontal_rule_box.components << horizontal_rule
scenario_template.boxes << horizontal_rule_box


##### Trends
trends = Box.create(
  box_type: "full_box",
  position: 5
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Trend/s",
  position: 1
)
I18n.locale = "gl"
text.content = "Tendencia/s"
I18n.locale = "en"
header.texts << text
textarea = Component.create(
  component_type: "textarea",
  position: 2
)
text = Text.create(
  content: "Write here the trend/s",
  position: 1
)
I18n.locale = "gl"
text.content = "Escribe aquí as tendencias"
I18n.locale = "en"
textarea.texts << text
trends.components << header
trends.components << textarea
scenario_template.boxes << trends


## Horizontal rule
horizontal_rule_box = Box.create(
  box_type: "full_box",
  position: 6
)
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 1
)
horizontal_rule_box.components << horizontal_rule
scenario_template.boxes << horizontal_rule_box


##### Possible aproaches to teaching and assessment
teaching_assessment = Box.create(
  box_type: "left_half_box",
  position: 7
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Possible approaches to teaching and assessment",
  position: 1
)
I18n.locale = "gl"
text.content = "Posibles enfoques para o ensino e a evaluación"
I18n.locale = "en"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "",
  position: 1
)
itemize.texts << text
teaching_assessment.components << header
teaching_assessment.components << itemize
scenario_template.boxes << teaching_assessment


##### Environment
environment = Box.create(
  box_type: "right_half_box",
  position: 8
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Environment",
  position: 1
)
I18n.locale = "gl"
text.content = "Entorno"
I18n.locale = "en"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "",
  position: 1
)
itemize.texts << text

environment.components << header
environment.components << itemize
scenario_template.boxes << environment


## Horizontal rule
horizontal_rule_box = Box.create(
  box_type: "full_box",
  position: 9
)
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 1
)
horizontal_rule_box.components << horizontal_rule
scenario_template.boxes << horizontal_rule_box


##### People and roles
people_roles = Box.create(
  box_type: "full_box",
  position: 10
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "People and roles",
  position: 1
)
I18n.locale = "gl"
text.content = "Persoas e funcións"
I18n.locale = "en"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "",
  position: 1
)
itemize.texts << text
people_roles.components << header
people_roles.components << itemize
scenario_template.boxes << people_roles


## Horizontal rule
horizontal_rule_box = Box.create(
  box_type: "full_box",
  position: 11
)
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 1
)
horizontal_rule_box.components << horizontal_rule
scenario_template.boxes << horizontal_rule_box


##### Activities
activities = Box.create(
  box_type: "left_half_box",
  position: 12
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Activities",
  position: 1
)
I18n.locale = "gl"
text.content = "Actividades"
I18n.locale = "en"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "",
  position: 1
)
itemize.texts << text
activities.components << header
activities.components << itemize
scenario_template.boxes << activities


##### Resources
resources = Box.create(
  box_type: "right_half_box",
  position: 13
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Resources (Including technologies)",
  position: 1
)
I18n.locale = "gl"
text.content = "Recursos (Incluindo tencoloxías)"
I18n.locale = "en"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "",
  position: 1
)
itemize.texts << text
resources.components << header
resources.components << itemize
scenario_template.boxes << resources
