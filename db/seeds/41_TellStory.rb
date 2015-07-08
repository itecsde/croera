# encoding: utf-8
I18n.locale = "en"
TellStory = ActivitySequence.create(
name: "Tell a Story",
description: "This story’s unique quality is its focus on narration and digital storytelling. Learning how to tell a story, to eloquently convey a point or to convince an audience, for example parents or other adults, can be considered a general expert skill, relevant to all areas of interest. This learning story will convey storytelling as a meaningful learning experience and answers the question of how storytelling and narrative relate to all subject areas. Using digital storytelling may motivate students and allow for non-traditional tasks and activities.",
status: 'class'
)
I18n.locale = "gl"
TellStory.name = "Contar unha historia"
TellStory.description = "A calidade única desta historia é o seu enfoque na narración e no relato dixital de contos. Aprender como contar unha historia, transmitir un tema ou convencer a unha audiencia, por exemplo pais ou outros adultos pode ser considerada unha habilidade experta de carácter xeral, relevante para todas as áreas de interese. Esta secuencia transmitirá o relato de historias como unha experiencia educativa significativa e responde a pregunta de como o relato de historias e a narrativa se relacionan con todos os ámbitos temáticos. O uso do relato dixital de historias pode motivar aos alumnos e permitir tarefas e actividades non tradicionais."
TellStory.status="class"
TellStory.save
TellStory.trace_version = 1
TellStory.reload
TellStory.trace_id = TellStory.id
TellStory.save


I18n.locale = "en"
Dream = Activity.find_by_name("Dream")
Dream_cloned = Dream.clone_with_associations
Dream_cloned.status = "instance"
Dream_cloned.save
TellStory.activities << Dream_cloned
Reflect = Activity.find_by_name("Reflect")
Reflect_cloned = Reflect.clone_with_associations
Reflect_cloned.status = "instance"
Reflect_cloned.save
TellStory.activities << Reflect_cloned
Explore = Activity.find_by_name("Explore")
Explore_cloned = Explore.clone_with_associations
Explore_cloned.status = "instance"
Explore_cloned.save
TellStory.activities << Explore_cloned
Reflect = Activity.find_by_name("Reflect")
Reflect_cloned = Reflect.clone_with_associations
Reflect_cloned.status = "instance"
Reflect_cloned.save
TellStory.activities << Reflect_cloned
Map = Activity.find_by_name("Map")
Map_cloned = Map.clone_with_associations
Map_cloned.status = "instance"
Map_cloned.save
TellStory.activities << Map_cloned
Reflect = Activity.find_by_name("Reflect")
Reflect_cloned = Reflect.clone_with_associations
Reflect_cloned.status = "instance"
Reflect_cloned.save
TellStory.activities << Reflect_cloned
Make = Activity.find_by_name("Make")
Make_cloned = Make.clone_with_associations
Make_cloned.status = "instance"
Make_cloned.save
TellStory.activities << Make_cloned
Reflect = Activity.find_by_name("Reflect")
Reflect_cloned = Reflect.clone_with_associations
Reflect_cloned.status = "instance"
Reflect_cloned.save
TellStory.activities << Reflect_cloned
Ask = Activity.find_by_name("Ask")
Ask_cloned = Ask.clone_with_associations
Ask_cloned.status = "instance"
Ask_cloned.save
TellStory.activities << Ask_cloned
Reflect = Activity.find_by_name("Reflect")
Reflect_cloned = Reflect.clone_with_associations
Reflect_cloned.status = "instance"
Reflect_cloned.save
TellStory.activities << Reflect_cloned
Show = Activity.find_by_name("Show")
Show_cloned = Show.clone_with_associations
Show_cloned.status = "instance"
Show_cloned.save
TellStory.activities << Show_cloned
Reflect = Activity.find_by_name("Reflect")
Reflect_cloned = Reflect.clone_with_associations
Reflect_cloned.status = "instance"
Reflect_cloned.save
TellStory.activities << Reflect_cloned
