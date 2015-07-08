# encoding: utf-8
I18n.locale = "en"
iTEC_template = Activity.create(
  name: 'iTEC template',
  description: 'This is a template to create iTEC-like activities.',
  template: 1
)
iTEC_template.save
I18n.locale = "gl"
iTEC_template.name = 'Plantilla de iTEC'
iTEC_template.description = 'Esta é unha plantilla para crear actividades iTEC.'
iTEC_template.template= 1
iTEC_template.save
I18n.locale = "en"
# Teacher motivation
teacher_motivations = Box.create(
  box_type: "left_half_box",
  position: 1
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "The teacher may look forward to...",
  position: 1
)
I18n.locale = "gl"
text.content = "O profesor pode desexar..."
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
teacher_motivations.components << header
teacher_motivations.components << itemize
iTEC_template.boxes << teacher_motivations
# Learner motivation
learner_motivations = Box.create(
  box_type: "right_half_box",
  position: 2
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "The students may learn...",
  position: 1
)
I18n.locale = "gl"
text.content = "Os estudantes poden aprender..."
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

learner_motivations.components << header
learner_motivations.components << itemize
iTEC_template.boxes << learner_motivations
#Horizontal rule
horizontal_rule_box = Box.create(
  box_type: "full_box",
  position: 3
)
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 1
)
horizontal_rule_box.components << horizontal_rule
iTEC_template.boxes << horizontal_rule_box
#Guidelines
guidelines_header_box = Box.create(
  box_type: "full_box",
  position: 4
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Guidelines",
  position: 1
)
header.texts << text
guidelines_header_box.components << header
iTEC_template.boxes << guidelines_header_box
#Guidelines introduction
guidelines_preparation_box = Box.create(
  box_type: "left_half_box",
  position: 5
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "1. Preparation",
  position: 1
)
I18n.locale = "gl"
text.content = "1. Preparación"
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
guidelines_preparation_box.components << header
guidelines_preparation_box.components << itemize
iTEC_template.boxes << guidelines_preparation_box
#Guidelines introduction
guidelines_introduction_box = Box.create(
  box_type: "right_half_box",
  position: 6
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "2. Introduction",
  position: 1
)
I18n.locale = "gl"
text.content = "2. Introducción"
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
guidelines_introduction_box.components << header
guidelines_introduction_box.components << itemize
iTEC_template.boxes << guidelines_introduction_box
#Guidelines development
guidelines_development_box = Box.create(
  box_type: "left_half_box",
  position: 7
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "3. Development",
  position: 1
)
I18n.locale = "gl"
text.content = "3. Desenrolo"
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
guidelines_development_box.components << header
guidelines_development_box.components << itemize
iTEC_template.boxes << guidelines_development_box
#Guidelines assessment
guidelines_assessment_box = Box.create(
  box_type: "right_half_box",
  position: 8
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "4. Assessment",
  position: 1
)
I18n.locale = "gl"
text.content = "4. Avaliación"
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
guidelines_assessment_box.components << header
guidelines_assessment_box.components << itemize
iTEC_template.boxes << guidelines_assessment_box
#Horizontal rule
horizontal_rule_box = Box.create(
  box_type: "full_box",
  position: 9
)
horizontal_rule = Component.create(
  component_type: "horizontal_rule",
  position: 1
)
horizontal_rule_box.components << horizontal_rule
iTEC_template.boxes << horizontal_rule_box
#Ideas
ideas_box = Box.create(
  box_type: "full_box",
  position: 10
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Ideas for using technology",
  position: 1
)
I18n.locale = "gl"
text.content = "Ideas para empregar tecnoloxía"
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
ideas_box.components << header
ideas_box.components << itemize
iTEC_template.boxes << ideas_box