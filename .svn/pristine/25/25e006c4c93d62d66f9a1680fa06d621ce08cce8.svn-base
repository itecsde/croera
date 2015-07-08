# encoding: utf-8
I18n.locale = "en"
WQ_template = Activity.create(
  name: 'WebQuest template',
  description: "This is a template to create WebQuest-like activities.",
  template: 1
)
WQ_template.save
I18n.locale = "gl"
WQ_template.name = 'Plantilla de WebQuest'
WQ_template.description = 'Esta é unha plantilla para crear actividades WebQuest.'
WQ_template.template= 1
WQ_template.save
#Introduction
full_box = Box.create(
  box_type: "full_box",
  position: 1
)
header = Component.create(
  component_type: "header",
  position: 2
)
text = Text.create(
  content: "Introduction",
  position: 1
)
I18n.locale = "gl"
text.content = "Introducción"
I18n.locale = "en"
header.texts << text
textarea = Component.create(
  component_type: "textarea",
  position: 3
)
text = Text.create(
  content: "Write here the introduction",
  position: 1
)
I18n.locale = "gl"
text.content = "Escribe aquí a introducción"
I18n.locale = "en"
textarea.texts << text
full_box.components << header
full_box.components << textarea
#Task
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 4
)
header = Component.create(
  component_type: "header",
  position: 5
)
text = Text.create(
  content: "Tasks",
  position: 1
)
I18n.locale = "gl"
text.content = "Tarefas"
I18n.locale = "en"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 6
)
text = Text.create(
  content: "The first task",
  position: 1
)
I18n.locale = "gl"
text.content = "A primeira tarefa"
I18n.locale = "en"
itemize.texts << text
full_box.components << horizontal_rule
full_box.components << header
full_box.components << itemize
#Process
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 7
)
header = Component.create(
  component_type: "header",
  position: 8
)
text = Text.create(
  content: "Process",
  position: 1
)
I18n.locale = "gl"
text.content = "Proceso"
I18n.locale = "en"
header.texts << text
enumerate = Component.create(
  component_type: "enumerate",
  position: 9
)
text = Text.create(
  content: "The first item",
  position: 1
)
I18n.locale = "gl"
text.content = "O primeiro elemento"
I18n.locale = "en"
enumerate.texts << text
full_box.components << horizontal_rule
full_box.components << header
full_box.components << enumerate
#Assessment
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 10
)
header = Component.create(
  component_type: "header",
  position: 11
)
text = Text.create(
  content: "Assessment",
  position: 1
)
I18n.locale = "gl"
text.content = "Avaliación"
I18n.locale = "en"
header.texts << text
textarea = Component.create(
  component_type: "textarea",
  position: 12
)
text = Text.create(
  content: "Write here the assessment",
  position: 1
)
I18n.locale = "gl"
text.content = "Escribe aquí a avaliación"
I18n.locale = "en"
textarea.texts << text
full_box.components << horizontal_rule
full_box.components << header
full_box.components << textarea
#Conclusion
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 13
)
header = Component.create(
  component_type: "header",
  position: 14
)
text = Text.create(
  content: "Conclusion",
  position: 1
)
I18n.locale = "gl"
text.content = "Conclusión"
I18n.locale = "en"
header.texts << text
textarea = Component.create(
  component_type: "textarea",
  position: 15
)
text = Text.create(
  content: "Write here the conclusion",
  position: 1
)
I18n.locale = "gl"
text.content = "Escribe aquí a conclusión"
I18n.locale = "en"
textarea.texts << text
full_box.components << horizontal_rule
full_box.components << header
full_box.components << textarea




WQ_template.boxes << full_box

