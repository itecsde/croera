# encoding: utf-8
I18n.locale = "en"
CreateObject = ActivitySequence.create(
name: "Create an object",
description: "This unique quality of this story is its relation to hacker and maker cultures that are finding their way from hobbyist environments to formal learning spaces. Opening up schools to maker cultures and fabrication practices may foster entrepreneurial and inventor spirits in students, and may expose teachers to possibilities for developing, for example, pedagogical, technical and organizational competences. Students will learn about mass customization and its potential impact on current economic and environmental practices. This learning story encourages to build connections to national Fabrication Laboratories and Hackerspaces as a way of connecting schools with other aspects of society. The connection to workshops outside of school can give access to expert builders and makers whose support can save you time.",
trace_version: 1,
status: 'class'
)
CreateObject.reload
CreateObject.trace_id = CreateObject.id
CreateObject.save

I18n.locale = "gl"
CreateObject.name = "Crear un obxecto"
CreateObject.description = "A calidade única desta historia é a súa relación coas culturas hacker e maker que veñen dos entornos infomais (hobby) aos espazos formais de aprendizaxe. Abrir as escolas as culturas maker e aos espazos de fabricación pode fomentar o espírito emprendedor e inventor nos estudantes, e pode expor aos profesores a novas posibilidades de desenvolver, por exemplo, competencias pedagóxicas, técnicas, e organizativas. Os estudantes aprenderán sobre a personalización masiva e o seu impacto potencial nas actuais prácticas económicas e medio-ambientais. Esta secuencia anima a construír conexións con Laboratorios de Fabricación nacionais e Hackerspaces como unha maneira de conectar as escolas con outros aspectos da sociedade. A conexión con talleres fora da escola pode dar acceso a expertos construtores e makers, e a súa axuda pódeche aforrar tempo."
CreateObject.status="class"
CreateObject.save


I18n.locale = "en"
LearningActivity = Activity.find_by_name("Dream")
LearningActivity = LearningActivity.clone_with_associations
LearningActivity.status="instance"
CreateObject.activities << LearningActivity

I18n.locale = "en"
LearningActivity = Activity.find_by_name("Explore")
LearningActivity = LearningActivity.clone_with_associations
LearningActivity.status="instance"
CreateObject.activities << LearningActivity

I18n.locale = "en"
LearningActivity = Activity.find_by_name("Map")
LearningActivity = LearningActivity.clone_with_associations
LearningActivity.status="instance"
CreateObject.activities << LearningActivity

I18n.locale = "en"
LearningActivity = Activity.find_by_name("Make")
LearningActivity = LearningActivity.clone_with_associations
LearningActivity.status="instance"
CreateObject.activities << LearningActivity

I18n.locale = "en"
LearningActivity = Activity.find_by_name("Ask")
LearningActivity = LearningActivity.clone_with_associations
LearningActivity.status="instance"
CreateObject.activities << LearningActivity

I18n.locale = "en"
LearningActivity = Activity.find_by_name("Make")
LearningActivity = LearningActivity.clone_with_associations
LearningActivity.status="instance"
CreateObject.activities << LearningActivity

I18n.locale = "en"
LearningActivity = Activity.find_by_name("Show")
LearningActivity = LearningActivity.clone_with_associations
LearningActivity.status="instance"
CreateObject.activities << LearningActivity











