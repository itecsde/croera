# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Creates iTEC activities
I18n.locale = "gl"

Dream = Activity.create(
icon: 'dream.png', 
timeToComplete: '1',
name: 'Soñar',
locale: 'gl', 
description: 'Como profesor presente unha proposición de deseño aos alumnos vinculada co plan de estudos, sen deixar espazo para a interpretación. Debe inspirar aos estudantes proporcionándolles a motivación para dar o mellor de si mesmos e falándolle da propiedade e a liberdade sobre a tarefa. Presente o proceso de actividades educativas e o calendario destas aos alumnos e negocie os criterios de avaliación cos estudantes. Os estudantes forman equipos, discuten, cuestionan e familiarízanse coas instrucións de deseño. Os equipos refinan o seu escrito do deseño, particularmente en relación de quen / para que están a deseñar, os retos de deseño iniciais e os posibles resultados de deseño. Os estudantes gravan unha reflexión e documentan o seu traballo en liña.'
)

tm1 = TeacherMotivation.create(name: 'Motivar os alumnos deixándoos dar forma á súa propia tarefa.')
tm2 = TeacherMotivation.create(name: 'Motivar os alumnos deixándolles certo grao de liberdade e propiedade do seu traballo.')
tm3 = TeacherMotivation.create(name: 'Utilizar ferramentas non familiares.')
Dream.teacher_motivations << tm1
Dream.teacher_motivations << tm2
Dream.teacher_motivations << tm3

lm1 = LearnerMotivation.create(name: 'Comprometerse seriamente nun deseño mentalmente esixente.')
lm2 = LearnerMotivation.create(name: 'Negociar obxectivos e criterios de avaliación.')
lm3 = LearnerMotivation.create(name: 'Cuestionar e mellorar tarefas dadas.')
Dream.learner_motivations << lm1
Dream.learner_motivations << lm2
Dream.learner_motivations << lm3

thm1 = TechnicalMotivation.create(name: 'Requirida: reflexión.')
thm2 = TechnicalMotivation.create(name: 'Importante: formación do equipo, edición colaboradora, publicación.')
thm3 = TechnicalMotivation.create(name: 'Desexable: Utilizar blogs.')
Dream.technical_motivations << thm1
Dream.technical_motivations << thm2
Dream.technical_motivations << thm3

gi_d1 = GuidelineItem.create(name: '', description: 'Prepare unha proposición de deseño mediante a elección dunha historia educativa ou axustándoa aos requisitos do seu plan de estudos ou ao seu calendario escolar.')
gi_d2 = GuidelineItem.create(description: 'Planee as fases do proceso de deseño completo.')
gi_d3 = GuidelineItem.create(description: 'Localice exemplos concretos que mostren porque é importante producir deseños "intelixentes". Ver: http://bit.ly/design-inspiration.')
gi_d4 = GuidelineItem.create(description: 'Prepare unha lista de criterios de avaliación que reflicta os requisitos do plan de estudos.')
gi_d5 = GuidelineItem.create(description: 'Presente o seu informe de deseño, exemplos, todas as actividades e o seu horario á súa clase.')
gi_d6 = GuidelineItem.create(description: 'Asegure que todo o mundo está a bordo rendendo o informe de deseño como un obxectivo compartido que se refire ao contexto individual dos estudantes.')
gi_d7 = GuidelineItem.create(description: 'Discuta os seus criterios de avaliación cos estudantes e estea de acordo sobre eles.')
gi_d8 = GuidelineItem.create(description: 'Forme equipos de 4 a 5 estudantes. Vostede pode pedir aos aprendices que definen papeis iniciais. Máis información: Actividade de Aprendizaxe "Traballo en equipo". Consideración detallada de formacións de equipo para previr free-riding.')
gi_d9 = GuidelineItem.create(description: 'Vostede pode contactar con xente máis alá da clase sendo proactivo sobre compartir o seu informe de deseño con outros profesores polo grupo de iTEC facebook e a comunidade de profesores de iTEC.')
gi_d10 = GuidelineItem.create(description: 'Como os equipos de estudantes discuten o que deseñarán e como refinar o informe de deseño impulsar equipos individuais con cuestións que os sosteñen para elaborar as súas eleccións.')
gi_d11 = GuidelineItem.create(description: 'Anime estudantes a cuestionar o seu informe de deseño. Fágalles cuestións rematadas abertas, como (un) Quen é o deseño para? (b) Como pode descubrir vostede acerca da xente que vostede está a deseñar para? (c) Que reto vostede está a dirixir e como? (d) Quen é responsable para que? (e) Como presentaría vostede o seu proceso de creación e o seu deseño?')
gi_d12 = GuidelineItem.create(description: 'Confusión inicial é parte da beleza de deseño. Non hai ningunha necesidade de responder a todas as cuestións axiña. Vostede e os estudantes comprenderedes as respostas mentres vostede vai.')
gi_d13 = GuidelineItem.create(description: 'Adestre os equipos para atopar unha audiencia específica para os deseños que planean crear.')
gi_d14 = GuidelineItem.create(description: 'Exercite a súa competencia educativa, e empurre estudantes máis alá das súas zonas de alivio, se vostede se dá conta de que o tema non está a desafiar abondo.')
gi_d15 = GuidelineItem.create(description: 'Apoie os estudantes con exemplos en caso de que se metan de cheo.')
gi_d16 = GuidelineItem.create(description: 'Encourage experienced students to share their knowledge across all teams. For example, asking them to record messages for others using TeamUp, or assigning experienced students to perform the role of assistant teachers, who help others.')
gi_d17 = GuidelineItem.create(description: 'Estudantes rexistran unha reflexión (vexa actividade de reflexión). Explique que as gravacións desempeñan un papel importante na súa avaliación e en realimentación de recepción de vostede, outros equipos, pais e a xente que están a deseñar para.')
gi_d18 = GuidelineItem.create(description: 'Máis alá de escola: Cada equipo fixa cara arriba dun blog de proxecto (ou servizo comparable) e envía o URL a vostede e ao grupo de iTEC facebook. No blog, os equipos describen o seu proxecto e deseño refinado curtos. Envían esquemas iniciais do que están a planear deseñar.')
gi_d19 = GuidelineItem.create(description: 'Revise o traballo de cada equipo, as súas gravacións de reflexión e entradas de blog, entón rexistre realimentación audiovisual para eles. A súa realimentación podería incluír suxestións e cuestións.')
gi_d20 = GuidelineItem.create(description: 'Vostede podería valorar a capacidade dos estudantes de cuestionar a tarefa proporcionada a eles, especialmente os seus chans para cambios que introducen.')




Dream.guidelines_preparation_items << gi_d1
Dream.guidelines_preparation_items << gi_d2
Dream.guidelines_preparation_items << gi_d3
Dream.guidelines_preparation_items << gi_d4
Dream.guidelines_introduction_items << gi_d5
Dream.guidelines_introduction_items << gi_d6
Dream.guidelines_introduction_items << gi_d7
Dream.guidelines_introduction_items << gi_d8
Dream.guidelines_introduction_items << gi_d9
Dream.guidelines_activity_items << gi_d10
Dream.guidelines_activity_items << gi_d11
Dream.guidelines_activity_items << gi_d12
Dream.guidelines_activity_items << gi_d13
Dream.guidelines_activity_items << gi_d14
Dream.guidelines_activity_items << gi_d15
Dream.guidelines_activity_items << gi_d16
Dream.guidelines_activity_items << gi_d17
Dream.guidelines_activity_items << gi_d18
Dream.guidelines_assessment_items << gi_d19
Dream.guidelines_assessment_items << gi_d20

I18n.locale = "en"
tm1.name = "Motivate students by letting them shape their own task"
tm1.save
tm2.name = "Motivate students by giving them a certain degree of freedom and ownership of their work"
tm2.save
tm3.name = "Using unfamiliar tools"
tm3.save

lm1.name = "Seriously commit themselves to thoughtful design."
lm1.save
lm2.name = "Negotiate on goals and assessment criteria."
lm2.save
lm3.name = "Question and improve given tasks." 
lm3.save

thm1.name = "Required: reflection."
thm1.save
thm2.name = "Important: team formation, collaborative editing and publishing."
thm2.save
thm3.name = "Nice to have: blogging."
thm3.save

gi_d1.description = "Prepare a design brief, by choosing a Learning Story and adjusting it to match curriculum requirements and school schedule."
gi_d1.save
gi_d2.description = "Plan and schedule the Learning Activities of the entire design process. Design activities can cause unexpected delay. Include a buffer lesson to the course schedule."
gi_d2.save
gi_d3.description = "Through preparation you have the opportunity to expand your competence and expertise, for example, by locating concrete examples that show why it is important to design thoughtful outcomes."
gi_d3.save
gi_d4.description = "Prepare an initial list of assessment criteria that reflect the curriculum requirements."
gi_d4.save
gi_d5.description = "Present your design brief, examples, all activities and your schedule to your class."
gi_d5.save
gi_d6.description = "Ensure that everyone is on board by rendering the design brief as a shared goal that relates to the students’ personal context."
gi_d6.save
gi_d7.description = "Discuss your assessment criteria with the students and agree on them."
gi_d7.save
gi_d8.description = "Form teams of 4 to 5 students. You may ask the learners to define initial roles. More info: Learning Activity “Teamwork”. Careful consideration of team formations to prevent free-riding."
gi_d8.save
gi_d9.description = "You may reach people beyond the classroom by being proactive about sharing your design brief with other teachers through the iTEC facebook group and the iTEC teacher community."
gi_d9.save
gi_d10.description = "As the student teams discuss what they will design and how to refine the design brief prompt individual teams with questions that support them to elaborate their choices."
gi_d10.save
gi_d11.description = "Encourage students to question your design brief. Ask them open ended questions, such as (a) Who is the design for? (b) How can you find out about the people you are designing for? (c) What challenge are you addressing and how? (d) Who is responsible for what? (e) How would you present your creation process and your design?"
gi_d11.save
gi_d12.description = "Initial confusion is part of the beauty of design. There is no need to answer all questions right away. You and the students will figure out the answers as you go along."
gi_d12.save
gi_d13.description = "Coach the teams to find a specific audience for the designs they plan to create."
gi_d13.save
gi_d14.description = "Exercise your educational expertise, and push students beyond their comfort zones, if you notice that the topic is not challenging enough."
gi_d14.save
gi_d15.description = "Support the students with examples in case they get stuck."
gi_d15.save
gi_d16.description = "Encourage experienced students to share their knowledge across all teams. For example, asking them to record messages for others using TeamUp, or assigning experienced students to perform the role of assistant teachers, who help others."
gi_d16.save
gi_d17.description = "Students record a reflection (see reflection activity). Explain that the recordings play an important role in their assessment and in receiving feedback from you, other teams, parents and the people they are designing for."
gi_d17.save
gi_d18.description = "Beyond school: Each team sets up a project blog (or comparable service) and send the URL to you and to the iTEC facebook group. On the blog, the teams describe their project and refined design brief. They post initial sketches of what they are planning to design."
gi_d18.save
gi_d19.description = "Review the work of each team, their reflection recordings and blog entries, then record audiovisual feedback for them. Your feedback might include suggestions and questions."
gi_d19.save
gi_d20.description = "You could assess the students’ ability to question the task provided to them, in particular their grounds for introducing changes."
gi_d20.save

I18n.locale = "gl"



interesting = Tag.create(name: 'interesante')
creative = Tag.create(name: 'creativo')
Dream.tags << interesting
Dream.tags << creative

Explore = Activity.create(
icon: 'explore.png', 
timeToComplete: '2',
name: 'Explorar: Observación',
locale: 'gl', 
description: 'Os equipos de estudantes exploran o contexto do seu deseño mediante a observación das prácticas ou ámbitos pertinentes utilizando cámaras dixitais, ordenadores portátiles e micrófonos. O obxecto da observación depende da quen se está a deseñar, para o que están a deseñar e os retos iniciais que queren abordar. Os estudantes comparten os seus arquivos e analízanos. Sobre a base da información recollida e a súa análise, os estudantes refinan a súa proposta de deseño, sobre todo os problemas de deseño e os resultados de deseño. A continuación, gravan unha reflexión e actualizan o seu blog. '
)

# Add the teacherMotivation
I18n.locale = "en"
tm_e1 = TeacherMotivation.create(name: "Connecting school and students with their community sending them to observe outside of school.")
Explore.teacher_motivations << tm_e1
I18n.locale = "gl"
tm_e1.name = "Conectar a escola e os estudantes coa comunidade enviándoos a observar fóra da escola."
tm_e1.save
I18n.locale = "es"
tm_e1.name = ""
tm_e1.save


I18n.locale = "en"
tm_e2 = TeacherMotivation.create(name: "Engage students to use all of their senses.")
I18n.locale = "gl"
tm_e2.name = "Conseguir que os alumnos utilicen todos os seus sentidos."
tm_e2.save
I18n.locale = "es"
tm_e2.name = ""
tm_e2.save
Explore.teacher_motivations << tm_e2

I18n.locale = "en"
tm_e3 = TeacherMotivation.create(name: "Using novel tools.")
I18n.locale = "gl"
tm_e3.name = "Utilizar novas ferramentas."
tm_e3.save
I18n.locale = "es"
tm_e3.name = ""
tm_e3.save
Explore.teacher_motivations << tm_e3

I18n.locale = "en"
tm_e4 = TeacherMotivation.create(name: "Finding dozens of innovative designs from around the world.")
I18n.locale = "gl"
tm_e4.name = "Encontrar doceas de deseños innovadores arredor do mundo."
tm_e4.save
I18n.locale = "es"
tm_e4.name = ""
tm_e4.save
Explore.teacher_motivations << tm_e4

# Add the learner motivation
I18n.locale = "en"
lm_e1 = LearnerMotivation.create(name: "Observe and record natural phenomena and/or people.")
Explore.learner_motivations << lm_e1
I18n.locale = "gl"
lm_e1.name = "Observe e rexistre fenómenos naturais e/ou xente."
lm_e1.save
I18n.locale = "es"
lm_e1.name = "Observar y registrar los fenómenos naturales y/o personas."
lm_e1.save
Explore.learner_motivations << lm_e1

I18n.locale = "en"
lm_e2 = LearnerMotivation.create(name: "Empathize with others.")
Explore.learner_motivations << lm_e2
I18n.locale = "gl"
lm_e2.name = "Empatizar con outros."
lm_e2.save
I18n.locale = "es"
lm_e2.name = "Empatizar con otros."
lm_e2.save
Explore.learner_motivations << lm_e2

I18n.locale = "en"
lm_e3 = LearnerMotivation.create(name: "Identify real world design challenges.")
Explore.learner_motivations << lm_e3
I18n.locale = "gl"
lm_e3.name = "Identificar retos nos deseños do mundo real."
lm_e3.save
I18n.locale = "es"
lm_e3.name = "Identificar retos en los diseños del mundo real."
lm_e3.save
Explore.learner_motivations << lm_e3

I18n.locale = "en"
lm_e4 = LearnerMotivation.create(name: "Question and improve tasks given to them.")
Explore.learner_motivations << lm_e4
I18n.locale = "gl"
lm_e4.name = "Preguntar e mellorar as tarefas que se lles dan."
lm_e4.save
I18n.locale = "es"
lm_e4.name = "Preguntar y mejorar las tareas que se les dan."
lm_e4.save
Explore.learner_motivations << lm_e4

I18n.locale = "en"
lm_e5 = LearnerMotivation.create(name: "Find and evaluate designs of various fields.")
Explore.learner_motivations << lm_e5
I18n.locale = "gl"
lm_e5.name = "Encontrar e evaluar deseños de varios campos."
lm_e5.save
I18n.locale = "es"
lm_e5.name = "Encontrar y evaluar diseños de varios campos."
lm_e5.save
Explore.learner_motivations << lm_e5

# Add technical motivations
I18n.locale = "en"
thm_e1 = TechnicalMotivation.create(name: "Required: media recorder, camera, note taking equipment.")
Explore.technical_motivations << thm_e1
I18n.locale = "gl"
thm_e1.name = "Requerido: grabadora audiovisual, camara, equipamento para tomar notas."
thm_e1.save
I18n.locale = "es"
thm_e1.name = "Requerido: grabadora audiovisual, camara, equipamiento para tomar notas."
thm_e1.save
Explore.technical_motivations << thm_e1

I18n.locale = "en"
thm_e1 = TechnicalMotivation.create(name: "Important: collaborative editing, bookmarking.")
Explore.technical_motivations << thm_e1
I18n.locale = "gl"
thm_e1.name = "Importante: edición colaborativa, marcadores."
thm_e1.save
I18n.locale = "es"
thm_e1.name = "Importante: edición colaborativa, marcadores."
thm_e1.save
Explore.technical_motivations << thm_e1

I18n.locale = "en"
thm_e1 = TechnicalMotivation.create(name: "Tools: TeamUp, ReFlex, iTEC Widget Store.")
Explore.technical_motivations << thm_e1
I18n.locale = "gl"
thm_e1.name = "Ferramentas: TeamUp, ReFlex, iTEC Widget Store."
thm_e1.save
I18n.locale = "es"
thm_e1.name = "Herramientas: TeamUp, ReFlex, iTEC Widget Store."
thm_e1.save
Explore.technical_motivations << thm_e1


# Add the guidelines
I18n.locale = "en"
gi_e1 = GuidelineItem.create(
description: 'Listen carefully to the student comments, and shape the activity according to their needs and interests.'
)
I18n.locale = "gl"
gi_e1.description = "Escoite coidadosamente os comentarios de estudantes, e forme a actividade segundo as súas necesidades e intereses."
gi_e1.save
I18n.locale = "es"
gi_e1.description = "Escuche con atención los comentarios de los estudiantes, y dar forma a la actividad de acuerdo con sus necesidades e intereses."
gi_e1.save

I18n.locale = "en"
gi_e2 = GuidelineItem.create(
description: "Expand your competence and expertise, by identifying online resources, locations and events where observation can be carried out, or people that could be interviewed for each team. See: ‘Design Inspiration for School’"
)
I18n.locale = "gl"
gi_e2.description = "Expanda a súa competencia e competencia, identificando recursos en liña, lugares e acontecementos onde observación pode ser realizada, ou xente que poderían ser entrevistados para cada equipo. Vexa: 'Inspiración de Deseño para Escola'"
gi_e2.save
I18n.locale = "es"
gi_e2.description = "Ampliar su competencia y experiencia, mediante la identificación de los recursos en línea, lugares y eventos donde la observación se pueden llevar a cabo, o las personas que podrían ser entrevistadas para cada equipo. Véase: 'Diseño La inspiración para la escuela'"
gi_e2.save

I18n.locale = "en"
gi_e3 = GuidelineItem.create(
description: "Describe the activity to the students and inspire them by showing online resources that they could browse through."
)
I18n.locale = "gl"
gi_e3.description = "Describa a actividade aos estudantes e inspíreos demostrando a recursos en liña que poderían follear completamente."
gi_e3.save
I18n.locale = "es"
gi_e3.description = "Describa la actividad a los estudiantes e inspirarlos, mostrando los recursos en línea que puedan navegar a través."
gi_e3.save

I18n.locale = "en"
gi_e4 = GuidelineItem.create(
description: "Ensure that all teams know what kind of examples they are looking for, what to observe and where."
)
I18n.locale = "gl"
gi_e4.description = "Asegure que todos os equipos saben que tipo de exemplos están a buscar, que observar e onde."
gi_e4.save
I18n.locale = "es"
gi_e4.description = "Asegúrese de que todos los equipos saben qué tipo de ejemplos que están buscando, qué observar y dónde."
gi_e4.save

I18n.locale = "en"
gi_e5 = GuidelineItem.create(
description: "Describe the activity to the students and inspire them by showing locations where observations can be carried out."
)
I18n.locale = "gl"
gi_e5.description = "Describa a actividade aos estudantes e inspíreos por lugares de exhibición onde observacións poden ser realizadas."
gi_e5.save
I18n.locale = "es"
gi_e5.description = "Describa la actividad a los estudiantes e inspirarlos, mostrando los lugares donde las observaciones se pueden realizar."
gi_e5.save

I18n.locale = "en"
gi_e6 = GuidelineItem.create(
description: "Check that each team is equipped with cameras, notebooks, microphones etc."
)

I18n.locale = "gl"
gi_e6.description = "Consulte que cada equipo é equipado con cámaras, libretas, micrófonos etc."
gi_e6.save
I18n.locale = "es"
gi_e6.description = "Compruebe que cada equipo está equipado con cámaras, portátiles, micrófonos, etc"
gi_e6.save

I18n.locale = "en"
gi_e7 = GuidelineItem.create(
description: "Teams plan how much time they want to spend searching, evaluating and comparing. Coach them by remind them about time management."
)
I18n.locale = "gl"
gi_e7.description = "Equipos planean canto tempo queren dedicar a buscar, avaliar e comparar. Adéstreos preto recordarlles sobre xestión de tempo."
gi_e7.save
I18n.locale = "es"
gi_e7.description = "Equipos planificar cuánto tiempo quieren pasar búsqueda, evaluación y comparación. El entrenador les recordarles acerca de la gestión del tiempo."
gi_e7.save

I18n.locale = "en"
gi_e8 = GuidelineItem.create(
description: "Teams search for comparable designs and discuss them. They select the 10 examples that are most relevant to their project. Support them with resources and relevant examples in case they get stuck."
)
I18n.locale = "gl"
gi_e8.description = "Equipos buscan deseños comparables e discútenos. Seleccionan os 10 exemplos que son a maior parte pertinentes para o seu proxecto. Apóieos con recursos e exemplos pertinentes en caso de que se metan de cheo."
gi_e8.save
I18n.locale = "es"
gi_e8.description = "Equipos búsqueda de diseños similares y discutirlas. Seleccionan los 10 ejemplos que son más relevantes para su proyecto. Apoyar con recursos y ejemplos pertinentes en caso de que se atascan."
gi_e8.save

I18n.locale = "en"
gi_e9 = GuidelineItem.create(
description: "Students perform observations in teams or individually. Coach and support them to find meaningful observations."
)
I18n.locale = "gl"
gi_e9.description = "Estudantes realizan observacións en equipos ou individualmente. Adéstreos e apóieos para atopar observacións significativas."
gi_e9.save
I18n.locale = "es"
gi_e9.description = "Los estudiantes realizan observaciones en equipos o individualmente. El entrenador y los apoyan para encontrar observaciones significativas."
gi_e9.save

I18n.locale = "en"
gi_e10 = GuidelineItem.create(
description: "The learning activities culminate towards a design. Some students may be overwhelmed by the multitude and quality of benchmarked examples and find it difficult to proceed productively. Remind them that many examples they see are made by companies with large budgets."
)
I18n.locale = "gl"
gi_e10.description = "As actividades de aprendizaxe rematan cara a un deseño. Algúns estudantes poden ser agoniados pola multitude e calidade de exemplos de benchmarked e achado iso difícil avanzar de forma produtiva. Recórdelles que moitos exemplos que ven son feitos por compañías con presupostos grandes."
gi_e10.save
I18n.locale = "es"
gi_e10.description = "Las actividades de aprendizaje culminará hacia un diseño. Algunos estudiantes pueden sentirse abrumados por la gran cantidad y calidad de ejemplos como punto de referencia y les resulta difícil proceder de manera productiva. Recuérdeles que muchos ejemplos que ven son fabricados por empresas con grandes presupuestos."
gi_e10.save

I18n.locale = "en"
gi_e11 = GuidelineItem.create(
description: "Slow Internet connection? Try to schedule the use of the Internet for each team to avoid Internet traffic congestion. See if some teams could perform their activity beyond school,  using the Internet connection of their homes, after school clubs, or public libraries."
)
I18n.locale = "gl"
gi_e11.description = "Conexión de Internet lenta? Intente programar o uso da Internet para que cada equipo evite conxestión de tráfico de Internet. Vexa se algúns equipos poderían realizar a súa actividade máis alá de escola, utilizando a conexión de Internet das súas casas, despois de clubs de escola, ou bibliotecas públicas."
gi_e11.save
I18n.locale = "es"
gi_e11.description = "Reduzca la velocidad de conexión a Internet? Trate de programar el uso de Internet por cada equipo para evitar la congestión de tráfico en Internet. A ver si algunos equipos pueden desarrollar su actividad después de la escuela, utilizando la conexión a Internet de sus hogares, después de clubes escolares o bibliotecas públicas."
gi_e11.save

I18n.locale = "en"
gi_e12 = GuidelineItem.create(
description: "Teams view and annotate their collected media files."
)
I18n.locale = "gl"
gi_e12.description = "Equipos ven e comentan os seus arquivos de medios de comunicación recollidos."
gi_e12.save
I18n.locale = "es"
gi_e12.description = "Equipos ver y anotar sus recogidas archivos multimedia."
gi_e12.save

I18n.locale = "en"
gi_e13 = GuidelineItem.create(
description: "Teams record a reflection. This reflection can be used for sharing their ideas with other teams."
)
I18n.locale = "gl"
gi_e13.description = "Equipos rexistran unha reflexión. Esta reflexión pode ser utilizada para compartir as súas ideas con outros equipos."
gi_e13.save
I18n.locale = "es"
gi_e13.description = "Equipos grabar una reflexión. Esta reflexión se puede utilizar para compartir sus ideas con otros equipos."
gi_e13.save

I18n.locale = "en"
gi_e14 = GuidelineItem.create(
description: "Beyond school: Teams post their findings to their blogs, including drawings of design ideas. Teams may identify more relevant information, for example by visiting a library or by browsing the Internet."
)
I18n.locale = "gl"
gi_e14.description = "Máis alá de escola: Equipos envían os seus descubrimentos aos seus blogs, incluíndo debuxos de ideas de deseño. Equipos poden identificar máis información pertinente, por exemplo visitando unha biblioteca ou folleando a Internet."
gi_e14.save
I18n.locale = "es"
gi_e14.description = "Más allá de la escuela: Equipos publicar sus hallazgos en sus blogs, incluyendo dibujos de ideas de diseño. Los equipos pueden identificar la información más relevante, por ejemplo al visitar una biblioteca o navegar por Internet."
gi_e14.save

I18n.locale = "en"
gi_e15 = GuidelineItem.create(
description: "Teachers found that this activity presents an opportunity for reflecting about the pros and cons of using ICT tools in school. Why not try the same with your students? Ask your students to critically assess the activity and their value to school learning. Then, the students record a reflection."
)
I18n.locale = "gl"
gi_e15.description = "Profesores atopaban que esta actividade presenta unha oportunidade para reflectirse sobre os pros e estafa de ferramentas de ICT que utilizan en escola. Por que non probar igual cos seus estudantes? Pida aos seus estudantes que criticamente valoran a actividade e o seu valor a aprendizaxe de escola. Entón, os estudantes rexistran unha reflexión."
gi_e15.save
I18n.locale = "es"
gi_e15.description = "Los profesores encontraron que esta actividad representa una oportunidad para reflexionar sobre los pros y los contras del uso de las herramientas TIC en la escuela. ¿Por qué no intentar lo mismo con sus alumnos? Pida a sus estudiantes para evaluar críticamente la actividad y su valor para el aprendizaje escolar. A continuación, los alumnos que registren una reflexión."
gi_e15.save

I18n.locale = "en"
gi_e16 = GuidelineItem.create(
description: "Review the work of each team, their reflection recordings and blog entries, then record audiovisual feedback for them. Your feedback might include suggestions and questions."
)
I18n.locale = "gl"
gi_e16.description = "Revise o traballo de cada equipo, as súas gravacións de reflexión e entradas de blog, entón rexistre realimentación audiovisual para eles. A súa realimentación podería incluír suxestións e cuestións."
gi_e16.save
I18n.locale = "es"
gi_e16.description = "Revisar el trabajo de cada equipo, sus grabaciones reflexión y entradas de blog, a continuación, registrar información audiovisual para ellos. Sus comentarios podrían incluir sugerencias y preguntas."
gi_e16.save

I18n.locale = "en"
gi_e17 = GuidelineItem.create(
description: "You could assess the breadth of identified examples and the teams’ ability to identify examples that are related to their design briefs."
)
I18n.locale = "gl"
gi_e17.description = "Vostede podería valorar o ancho de exemplos identificados e a capacidade dos equipos de identificar exemplos que son relacionados cos seus deseños."
gi_e17.save
I18n.locale = "es"
gi_e17.description = "Se podría evaluar la amplitud de ejemplos identificados y la capacidad de los equipos para identificar ejemplos que están relacionados con sus diseños."
gi_e17.save

Explore.guidelines_preparation_items << gi_e1
Explore.guidelines_preparation_items << gi_e2
Explore.guidelines_introduction_items << gi_e3
Explore.guidelines_introduction_items << gi_e4
Explore.guidelines_introduction_items << gi_e5
Explore.guidelines_introduction_items << gi_e6
Explore.guidelines_activity_items << gi_e7
Explore.guidelines_activity_items << gi_e8
Explore.guidelines_activity_items << gi_e9
Explore.guidelines_activity_items << gi_e10
Explore.guidelines_activity_items << gi_e11
Explore.guidelines_activity_items << gi_e12
Explore.guidelines_activity_items << gi_e13
Explore.guidelines_activity_items << gi_e14
Explore.guidelines_activity_items << gi_e15
Explore.guidelines_assessment_items << gi_e16
Explore.guidelines_assessment_items << gi_e17

Map = Activity.create(
icon: 'map.png', 
timeToComplete: '1',
name: 'Representar nun mapa',
locale: 'gl', 
description: 'Os equipos analizan os seus achados utilizando técnicas de representación en mapas mentais. Identifican relacións, semellanzas e diferenzas entre os exemplos e/ou os ficheiros media recollidos. Sobre a base da información recollida e á análise, os equipos refinan as súas propostas de deseño, especialmente as necesidades de deseño, resultados de deseño e audiencia. Despois os equipos gravan unha reflexión.',
)

# Add teacher motivation
I18n.locale = "en"
tm_m1 = TeacherMotivation.create(name: "Hands-on active and visual engagement with collected information and data.")
Map.teacher_motivations << tm_m1
I18n.locale = "gl"
tm_m1.name = "Implicación directa activa e visual con información e datos recollidos."
tm_m1.save
I18n.locale = "es"
tm_m1.name = "Implicación directa activa y visual con información y datos recogidos."
tm_m1.save

I18n.locale = "en"
tm_m2 = TeacherMotivation.create(name: "Progressive data analysis.")
Map.teacher_motivations << tm_m2
I18n.locale = "gl"
tm_m2.name = "Análise de datos progresiva."
tm_m2.save
I18n.locale = "es"
tm_m2.name = "Análisis de datos progresivo."
tm_m2.save

I18n.locale = "en"
tm_m3 = TeacherMotivation.create(name: "Using novel tools.")
Map.teacher_motivations << tm_m3
I18n.locale = "gl"
tm_m3.name = "Utilizar novas ferramentas."
tm_m3.save
I18n.locale = "es"
tm_m3.name = "Utilizar nuevas herramientas."
tm_m3.save

# Add learner motivation
I18n.locale = "en"
lm_m1 = LearnerMotivation.create(name: "To professionally analyze information collaboratively.")
Map.learner_motivations << lm_m1
I18n.locale = "gl"
lm_m1.name = "Analizar información profesionalmente e de forma colaborativa."
lm_m1.save
I18n.locale = "es"
lm_m1.name = "Analizar información profesionalmente y de forma colaborativa."
lm_m1.save

I18n.locale = "en"
lm_m2 = LearnerMotivation.create(name: "More in-depth understanding about their topic.")
Map.learner_motivations << lm_m2
I18n.locale = "gl"
lm_m2.name = "Comprensión máis en profundidade sobre o seu tema."
lm_m2.save
I18n.locale = "es"
lm_m2.name = "Comprensión más en profundidad sobre su tema."
lm_m2.save

I18n.locale = "en"
lm_m3 = LearnerMotivation.create(name: "To recognize relationships between findings.")
Map.learner_motivations << lm_m3
I18n.locale = "gl"
lm_m3.name = "Recoñecer relacións entre achados."
lm_m3.save
I18n.locale = "es"
lm_m3.name = "Reconocer relaciones entre descubrimientos."
lm_m3.save

# Add teacher motivation
I18n.locale = "en"
thm_m1 = TechnicalMotivation.create(name: "Required: mind-mapping.")
Map.technical_motivations << thm_m1
I18n.locale = "gl"
thm_m1.name = "Requerido: mind-mapping."
thm_m1.save
I18n.locale = "es"
thm_m1.name = ""
thm_m1.save
Explore.technical_motivations << thm_m1

I18n.locale = "en"
thm_m2 = TechnicalMotivation.create(name: "Tools: post-it notes, Bubbl.us, CmapTools, Popplet, Mindmeister, Freemind, TeamUp, ReFlex.")
Map.technical_motivations << thm_m2
I18n.locale = "gl"
thm_m2.name = "Ferramentas: post-it notes, Bubbl.us, CmapTools, Popplet, Mindmeister, Freemind, TeamUp, ReFlex."
thm_m2.save
I18n.locale = "es"
thm_m2.name = ""
thm_m2.save
Explore.technical_motivations << thm_m2

# Add guidelines
I18n.locale = "en"
gi_map1 = GuidelineItem.create(description: "Listen carefully to the student comments, and shape the activity according to their needs and interests.")
Map.guidelines_preparation_items << gi_map1
I18n.locale = "gl"
gi_map1.description = "Escoite detidamente os comentarios dos estudantes e de forma á actividade de acordo ás súas necesidades e intereses."
gi_map1.save
I18n.locale = "es"
gi_map1.description = ""
gi_map1.save

I18n.locale = "en"
gi_map2 = GuidelineItem.create(description: "Expand your competence and expertise, by exploring digital mind-mapping tools and ensuing students can easily add their media files to the tool.")
Map.guidelines_preparation_items << gi_map2
I18n.locale = "gl"
gi_map2.description = "Expanda as súas competencias e coñecementos explorando ferramentas de representación en mapas metais (mind-mapping) dixitais e asegurando que os estudantes poden engadir ficheiros media á ferramenta de forma doada."
gi_map2.save
I18n.locale = "es"
gi_map2.description = ""
gi_map2.save

I18n.locale = "en"
gi_map3 = GuidelineItem.create(description: "Arrange pens, paper, post-it notes, tape, scissors and glue. Set up the space by arranging walls or large papers for students to group and stick their paper notes on.")
Map.guidelines_preparation_items << gi_map3
I18n.locale = "gl"
gi_map3.description = "Proporcione lapis, papel, notas post-it, celo, tesoiras e pegamento. Prepare a aula con papeis nas paredes para que os estudantes se poidan reunir en grupos e pegar as súas notas nas ditos papeis."
gi_map3.save
I18n.locale = "es"
gi_map3.description = ""
gi_map3.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "Engage in a pedagogically meaningful conversation with the students about the data they collected: What did they collect, and how is the information meaningful for their project?")
Map.guidelines_introduction_items << gi_map
I18n.locale = "gl"
gi_map.description = "Promova nunha conversación con sentido pedagóxico cos estudantes sobre os datos que recolleron: que recolleron? De que forma é a información significativa para o seu proxecto?"
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "For easy access, ask the students to move all of their information and data into one location and share it with everyone.")
Map.guidelines_introduction_items << gi_map
I18n.locale = "gl"
gi_map.description = "Para facilitar o acceso, pida aos seus estudantes que movan toda a súa información e datos a unha mesma localización ou que identifiquen todas as súas fontes."
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "Students write all information and data in the form of headlines, short sentences or figures on post-it notes or small pieces of paper, and group their notes. Alternatively they may use the digital mind-mapping tool you set up. Coach them how to best represent some of their findings by drawing the initial notes or making supportive suggestions.")
Map.guidelines_activity_items << gi_map
I18n.locale = "gl"
gi_map.description = "Os estudantes escriben toda a información e datos a xeito de titulares ou frases curtas ou con debuxos en notas post-it ou en pequenos anacos de papel e agrupan as súas notas. De forma alternativa poden utilizar ferramentas de representación en mapas mentais que ti lle proporcionas. Entrenelos na mellor forma de representar algúns dos seus achados debuxando as notas iniciais ou facendo recomendacións."
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "Support the teams to visually present relationships between the notes when grouping the data, for example, by drawing lines between information, placing notes hierarchically, or other spatial arrangements.")
Map.guidelines_activity_items << gi_map
I18n.locale = "gl"
gi_map.description = "Apoie os equipos para que presenten de forma visual as relacións entre as notas cando agrupen os datos, por exemplo, debuxando liñas entre información, situando notas de forma xerárquica ou noutras disposicións espaciais."
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "View and discuss the relations with the students. Ask open ended questions to challenge their assumptions, for example, (a) what are the similarities and differences between the examples they found? (b) What additional challenges can you recognize?; (c) what would you like to adopt or try out? (d) what would make your design unique? (e) Does the design brief need refinement? How does it need to be refined?; (f) How does the exploration relate to the design? (g) What design decisions would result from the exploration? (f) What are emerging project ideas?")
Map.guidelines_activity_items << gi_map
I18n.locale = "gl"
gi_map.description = "Vexa e discuta as relacións cos estudantes. Formule preguntas abertas para cuestionar as súas suposicións, por exemplo (a) cales son as semellanzas e as diferenzas entre os exemplos que encontraron?; (b) Que necesidades adicionais podedes recoñecer?; (c) Que te gustaría adoptar ou intentar?; (d) Como farías o teu deseño único?; (e) Necesita refinarse a proposta de deseño? Como necesita ser refinada?; (f) Como se relaciona a exploración co deseño?; (g) Que decisións de deseño se obterían da exploración?; (h) Que ideas do proxecto xurdiron?"
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "A more full-body involvement of mapping ideas can be achieved through spatial grouping of ideas and collected information. This can might support learners to focus, as they can stretch their arms to place a post-it note to a specific location dedicated to e.g. challenges")
Map.guidelines_activity_items << gi_map
I18n.locale = "gl"
gi_map.description = ""
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "Teams list identified similarities and differences, and update their design briefs, particularly in relation to design challenges, design results and audience.")
Map.guidelines_activity_items << gi_map
I18n.locale = "gl"
gi_map.description = "Os equipos enumeran as semellanzas e diferenzas identificadas e actualizan as súas propostas de deseño, resultados de deseño e a audiencia."
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "They document their findings on their blog, including sketches of emerging project ideas and record a reflection. You can record a reflection for each team providing feedback and evaluative comments to each student work. Their reflections can be used for assessment and for staying focussed on the task.")
Map.guidelines_activity_items << gi_map
I18n.locale = "gl"
gi_map.description = "Documentan os seus achados no seu blog, incluíndo sketches ou ideas que xorden no proxecto e gravan unha reflexión."
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "Review the work of each team, their reflection recordings and blog entries, to ensure everyone explored and collected examples and/or media files. Then record audiovisual feedback for them. Your feedback might include suggestions and questions about how successful the technique was implemented, how it could be used for future projects, and how it could be done better next time.")
Map.guidelines_assessment_items << gi_map
I18n.locale = "gl"
gi_map.description = "Revise o traballo de cada equipo, as súas reflexións e entradas no blog para asegurarte que todo o mundo explorou e recolleu exemplos e/ou ficheiros media. Despois grave unha realimentación audiovisual para eles. A túa realimentación podería incluír recomendacións e preguntas el éxito da implementación da técnica, sobre como podería ser utilizada en proxectos futuros e como podería facerse mellor a próxima vez."
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "You could assess the teams’ ability to identify design challenges, to draw relationships between observations and examples")
Map.guidelines_assessment_items << gi_map
I18n.locale = "gl"
gi_map.description = "Poderías avaliar a habilidade dos equipos para identificar necesidades de deseño, para establecer relacións entre observacións e exemplos."
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save

I18n.locale = "en"
gi_map = GuidelineItem.create(description: "You could also ask the students to grade their teammates’ contributions, using the student grades to help form your own assessment.")
Map.guidelines_assessment_items << gi_map
I18n.locale = "gl"
gi_map.description = "Tamén poderías pedir aos estudantes que avaliasen as contribucións dos seus compañeiros de equipo, utilizando as devanditas avaliacións para axudarlle a formar a súa propia avaliación."
gi_map.save
I18n.locale = "es"
gi_map.description = ""
gi_map.save


Reflect = Activity.create(
icon: 'reflect.png', 
timeToComplete: '1',
name: 'Reflexionar',
locale: 'gl', 
description: 'Os estudantes e o profesor rexistran, publican e comparten gravacións audiovisuais dos seus progresos, dificultades e plans futuros no proxecto. Os estudantes constrúen pouco a pouco unha base de datos compartida entre a clase con estratexias educativas que poden utilizarse despois do proxecto.',

guidelinesPreparation: 'Desenvolva as súas competencias e coñecementos explorando con que frecuencia e quen reflexiona e proporciona realimentación que podería ser utilizada na historia de aprendizaxe e polo tanto decidir que ferramenta de reflexión queres preparar e utilizar.
Antes de gravar outra realimentación ou reflexión escoite a anterior.',
guidelinesIntroduction: 'Motive os estudantes a que reflexionen sobre o seu traballo indicando os beneficios e as razóns da reflexión, por exemplo é máis doada a revisión dos últimos pasos, retomar o fío despois dunha ausencia, recibir realimentación directa do profesor.
Dígalle os seus estudantes que en proxectos de aprendizaxe relacionados con deseño a reflexión de forma regular pode axudar avanzar dende ideas iniciais, non moi boas, e desenvolver o sentimento de propiedade.',
guidelinesActivity: 'Os equipos reflexionan sobre o que fixeron, que planean facer a continuación e sobre calquera dificultade que encontrasen ou que prevexan.
As primeiras reflexionen poden resultar difíciles de gravar. Adestre os estudantes para que superen os seus temores iniciais de frustración ou inconveniencia. Estea seguro que tras gravar algunhas reflexións poderá recoñecer os froitos do seu investimento.
Os equipos escoitan as gravacións doutros e gravan preguntas ou suxestións para eles. Adestre e apóieos para que o sigan facendo.
Escoite as gravacións e adapte o seu labor como profesor ás necesidades dos estudantes.
Sobre a base das reflexións dos alumnos, grave realimentación audiovisual para os equipos incluíndo preguntas e recomendacións que poidan inspirar aos equipos a pensar máis alá.
Os expertos poden participar gravando realimentación para os equipos de estudantes. A súa realimentación pode ser ubicua e unha fonte de inspiración para os estudantes de próximos anos. ',
guidelinesAssessment: 'Pode avaliar o traballo en equipo a partir da habilidade do estudante para escoitar e reaccionar aos seus comentarios construtivos, ou sobre a base da profundidade ou relevancia das súas reflexións.')

# Add teacher motivation
I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Reviewing team progress quickly and comfortably.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Revisar o progreso do equipo de forma rápida e cómoda."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Providing personal feedback to teams.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Proporcionar realimentación persoal aos equipos."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "A more fair distribution of support beyond the classroom.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Unha forma máis xusta de distribución de axuda máis alá da aula."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Spending less time recording feedback for students.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Gastar menos tempo gravando realimentación para os estudantes."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Providing students with personal feedback through gestures, tone of voice, background information (your home, garden etc.).")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Proporcionar aos estudantes con realimentación persoal a través de xestos, o ton de voz, información sobre o contexto (a túa casa, xardín etc.)."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Using the recordings to better communicate with parents about school activities.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Usar as gravacións para mellorar a comunicación cos pais sobre actividades escolares."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Developing a collection of comments to your students.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Desenvolver e recoller comentarios dos teus estudantes."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Building a resource of reflections made by students.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Construír un recurso de reflexións feitas por estudantes."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Using novel tools.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Usar novas ferramentas."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Develop technical, organizational and pedagogical competences.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Desarrollar competencias técnicas, organizacionais e pedagóxicas."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

I18n.locale = "en"
tm_r1 = TeacherMotivation.create(name: "Acquire a repertoire of using reflection for multiple purposes.")
Reflect.teacher_motivations << tm_r1
I18n.locale = "gl"
tm_r1.name = "Adquirir un repertorio do uso da reflexión para múltiples propósitos."
tm_r1.save
I18n.locale = "es"
tm_r1.name = ""
tm_r1.save

# Add learner motivation
I18n.locale = "en"
lm_r1 = LearnerMotivation.create(name: "To summarize, communicate, present and plan their work in progress.")
Reflect.learner_motivations << lm_r1
I18n.locale = "gl"
lm_r1.name = "Resumir, comunicar, presentar e planear o traballo que están a realizar."
lm_r1.save
I18n.locale = "es"
lm_r1.name = ""
lm_r1.save

I18n.locale = "en"
lm_r1 = LearnerMotivation.create(name: "To reflect on their work.")
Reflect.learner_motivations << lm_r1
I18n.locale = "gl"
lm_r1.name = "Reflexionar sobre o seu traballo."
lm_r1.save
I18n.locale = "es"
lm_r1.name = ""
lm_r1.save

I18n.locale = "en"
lm_r1 = LearnerMotivation.create(name: "To provide and receive criticism.")
Reflect.learner_motivations << lm_r1
I18n.locale = "gl"
lm_r1.name = "Proporcionar e recibir críticas."
lm_r1.save
I18n.locale = "es"
lm_r1.name = ""
lm_r1.save

# Add technical motivation
I18n.locale = "en"
thm_r1 = TechnicalMotivation.create(name: "Required: audio/video reflection.")
Reflect.technical_motivations << thm_r1
I18n.locale = "gl"
thm_r1.name = "Requirido: reflexión audio/video."
thm_r1.save
I18n.locale = "es"
thm_r1.name = ""
thm_r1.save

I18n.locale = "en"
thm_r1 = TechnicalMotivation.create(name: "Tools: TeamUp, ReFlex, Redpentool, Voicethread")
Reflect.technical_motivations << thm_r1
I18n.locale = "gl"
thm_r1.name = "Ferramentas: TeamUp, ReFlex, Redpentool, Voicethread."
thm_r1.save
I18n.locale = "es"
thm_r1.name = ""
thm_r1.save

# Add preparation guidelines
I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "Develop your competence and expertise, by exploring how often and by whom reflection and feedback could be used in the learning story and by decide on the reflection tool that you would like to set up and use.")
Reflect.guidelines_preparation_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Desenvolva as súas competencias e coñecementos explorando con que frecuencia e quen reflexiona e proporciona realimentación que podería ser utilizada na historia de aprendizaxe e polo tanto decidir que ferramenta de reflexión queres preparar e utilizar."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "Before recording another feedback or reflection listen to the previous one.")
Reflect.guidelines_preparation_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Antes de gravar outra realimentación ou reflexión escoite a anterior."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

# Add introduction guidelines
I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "Motivate the students to reflect on their work by expressing the benefits and reasons for reflection, for example easier review of the last steps, catching up after an absence, receiving direct feedback from the teacher.")
Reflect.guidelines_introduction_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Motive os estudantes a que reflexionen sobre o seu traballo indicando os beneficios e as razóns da reflexión, por exemplo é máis doada a revisión dos últimos pasos, retomar o fío despois dunha ausencia, recibir realimentación directa do profesor."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "Tell your students that in design related learning projects, regular reflection can support letting go of initial, not very good, ideas and to develop the feeling of ownership.")
Reflect.guidelines_introduction_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Dígalle os seus estudantes que en proxectos de aprendizaxe relacionados con deseño a reflexión de forma regular pode axudar avanzar dende ideas iniciais, non moi boas, e desenvolver o sentimento de propiedade."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

# Add guidelines activity
I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "Teams reflect on what they did, what they plan to do and the challenges they encountered or can foresee.")
Reflect.guidelines_activity_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Os equipos reflexionan sobre o que fixeron, que planean facer a continuación e sobre calquera dificultade que encontrasen ou que prevexan."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "The first reflections may be difficult to record smoothly. Coach students to overcome initial feelings of frustration or inconvenience.  Be assured, after recording a few reflections, you will start to recognize the value of your investment.")
Reflect.guidelines_activity_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "As primeiras reflexionen poden resultar difíciles de gravar. Adestre os estudantes para que superen os seus temores iniciais de frustración ou inconveniencia. Estea seguro que tras gravar algunhas reflexións poderá recoñecer os froitos do seu investimento."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "Teams listen to the recordings by others and record questions and tips for them. Coach and support them in doing so.")
Reflect.guidelines_activity_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Os equipos escoitan as gravacións doutros e gravan preguntas ou suxestións para eles. Adestre e apóieos para que o sigan facendo."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "Listen to the recordings and adopt your teaching to the needs of the students.")
Reflect.guidelines_activity_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Escoite as gravacións e adapte o seu labor como profesor ás necesidades dos estudantes."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "Record audio-visual feedback for the teams, including questions and suggestions that may inspire the teams to think further, based on the student reflections.")
Reflect.guidelines_activity_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Sobre a base das reflexións dos alumnos, grave realimentación audiovisual para os equipos incluíndo preguntas e recomendacións que poidan inspirar aos equipos a pensar máis alá."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "Experts may be invited to record feedback to the student teams. Their feedback is may become ubiquitous, and a source of inspiration for the students in the years to come.")
Reflect.guidelines_activity_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Os expertos poden participar gravando realimentación para os equipos de estudantes. A súa realimentación pode ser ubicua e unha fonte de inspiración para os estudantes de próximos anos."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save

# Add guidelines assessment
I18n.locale = "en"
gi_reflect1 = GuidelineItem.create(description: "You may assess based on the student’s ability to listen and react to your constructive comments, or based on the depth or relevance of their reflections.")
Reflect.guidelines_assessment_items << gi_reflect1
I18n.locale = "gl"
gi_reflect1.description = "Pode avaliar o traballo en equipo a partir da habilidade do estudante para escoitar e reaccionar aos seus comentarios construtivos, ou sobre a base da profundidade ou relevancia das súas reflexións."
gi_reflect1.save
I18n.locale = "es"
gi_reflect1.description = ""
gi_reflect1.save


Make = Activity.create(
icon: 'make.png', 
timeToComplete: '2',
name: 'Realizar',
locale: 'gl', 
description: '﻿Sobre a base da súa proposta de deseño refinada e ás ideas iniciais os equipos de estudantes empezan a facer. Crean o seu primeiro prototipo e discuten sobre el. A discusión versará especialmente sobre o ben que o deseño resolve as necesidades formuladas. Os estudantes poden reflexionar e documentar as súas actividades.',
teacherMotivation: 'Inspirar os estudantes para que sexan creativos e imaxinativos na súa utilización de tecnoloxía dixital.
Ir máis alá da túa zona de seguridade/confort e guiar os estudantes para que fagan o mesmo.
Ver como xorden diferentes proxectos dunha mesma proposta inicial.
Utilizar novas ferramentas.' ,
learnerMotivation: 'Transformar as súas ideas en prototipos concretos.
Identificar novas formas de abordar necesidades.
Facer un prototipo en papel.
Utilizar ferramentas de autoría dixitais.
É reconfortante para os estudantes completar un proxecto.',
technicalMotivation: 'Importante: edición media Desexable: Kit DIY (fágao vostede mesmo), ámbito de programación, kit de construción edición 3D, impresión 3D.',
guidelinesPreparation: 'Escoite coidadosamente os comentarios dos estudantes e prepare a actividade tendo en conta as súas necesidades e intereses.
Expanda as súas competencias e coñecemento mediante a preparación de material, softare e tecnoloxía necesaria para a realización.',
guidelinesIntroduction: 'Inspire os estudantes para que cren prototipos que poderían utilizar outros e que se ocupen en especial das necesidades identificadas
Exercicios de creación de equipos, como a participación en xogos, a resolución de problemas ou tomar un xeado xuntos, pode axudar a mellorar a cooperación e colaboración cara ao obxectivo compartido.',
guidelinesActivity: 'Os equipos desenvolven prototipos. Adéstreos para que se ocupen das necesidades de deseño identificadas e para que teñan en conta toda a información recollida recordándolles os seus plans.
Recorde aos equipos que as actividades se suceden para a consecución dun artefacto. Se aprecias que os equipos se estancan ou se debaten durante demasiado tempo, interveña e axúdeos con recomendacións directas para unha decisión.
Os equipos preparan os seus prototipos na clase e discuten con outros equipos, en particular como e se os seus prototipos se ocupan das necesidades identificadas.
Os equipos engaden documentación de su(s) prototipo(s) de deseño no blog e descríbeno utilizando debuxos, vídeos ou fotografías dixitais dos seus prototipos. Despois, gravan un reflexión.',
guidelinesAssessment: 'Revise o traballo de cada equipo, as súas reflexións e entradas no blog, para asegurarse que todo o mundo explorou e recolleu exemplos e/ou ficheiros media. Despois grávelles realimentación audiovisual. A súa realimentación podería incluír recomendacións e preguntas.
Os bos prototipos ilustran como podería utilizarse un deseño como podería funcionar. Os prototipos poden ser rudos e inacabados, mentres axuden na comunicación. Un concepto simple pero ben pensado pode resultar unha experiencia de aprendizaxe tan boa como unha execución tecnicamente complexa. Sexa coidadoso na avaliación de prototipos.
Tamén poderías pedir aos estudantes que poñan nota ás contribucións dos seus compañeiros de clase e utilizar as devanditas notas como axuda para a túa propia avaliación.')

# Add teacher motivation
I18n.locale = "en"
tm_make1 = TeacherMotivation.create(name: "Inspiring students to be creative and imaginative in their use of digital technology.")
Make.teacher_motivations << tm_make1
I18n.locale = "gl"
tm_make1.name = "Inspirar os estudantes para que sexan creativos e imaxinativos na súa utilización de tecnoloxía dixital."
tm_make1.save
I18n.locale = "es"
tm_make1.name = ""
tm_make1.save

I18n.locale = "en"
tm_make1 = TeacherMotivation.create(name: "Stepping beyond your comfort zone and guiding students to do the same.")
Make.teacher_motivations << tm_make1
I18n.locale = "gl"
tm_make1.name = "Ir máis alá da túa zona de seguridade/confort e guiar os estudantes para que fagan o mesmo."
tm_make1.save
I18n.locale = "es"
tm_make1.name = ""
tm_make1.save

I18n.locale = "en"
tm_make1 = TeacherMotivation.create(name: "Seeing different projects emerge from the same initial assignment.")
Make.teacher_motivations << tm_make1
I18n.locale = "gl"
tm_make1.name = "Ver como xorden diferentes proxectos dunha mesma proposta inicial."
tm_make1.save
I18n.locale = "es"
tm_make1.name = ""
tm_make1.save

I18n.locale = "en"
tm_make1 = TeacherMotivation.create(name: "Using novel tools.")
Make.teacher_motivations << tm_make1
I18n.locale = "gl"
tm_make1.name = "Utilizar novas ferramentas."
tm_make1.save
I18n.locale = "es"
tm_make1.name = ""
tm_make1.save

# Add learner motivation
I18n.locale = "en"
lm_make1 = LearnerMotivation.create(name: "Transform their ideas into concrete prototypes.")
Make.learner_motivations << lm_make1
I18n.locale = "gl"
lm_make1.name = "Transformar as súas ideas en prototipos concretos."
lm_make1.save
I18n.locale = "es"
lm_make1.name = ""
lm_make1.save

I18n.locale = "en"
lm_make1 = LearnerMotivation.create(name: "Identify new ways of addressing challenges.")
Make.learner_motivations << lm_make1
I18n.locale = "gl"
lm_make1.name = "Identificar novas formas de abordar necesidades."
lm_make1.save
I18n.locale = "es"
lm_make1.name = ""
lm_make1.save

I18n.locale = "en"
lm_make1 = LearnerMotivation.create(name: "Do paper prototyping.")
Make.learner_motivations << lm_make1
I18n.locale = "gl"
lm_make1.name = "Facer un prototipo en papel."
lm_make1.save
I18n.locale = "es"
lm_make1.name = ""
lm_make1.save

I18n.locale = "en"
lm_make1 = LearnerMotivation.create(name: "Use digital authoring tools.")
Make.learner_motivations << lm_make1
I18n.locale = "gl"
lm_make1.name = "Utilizar ferramentas de autoría dixitais."
lm_make1.save
I18n.locale = "es"
lm_make1.name = ""
lm_make1.save

I18n.locale = "en"
lm_make1 = LearnerMotivation.create(name: "It is rewarding for students to complete a project.")
Make.learner_motivations << lm_make1
I18n.locale = "gl"
lm_make1.name = "É reconfortante para os estudantes completar un proxecto."
lm_make1.save
I18n.locale = "es"
lm_make1.name = ""
lm_make1.save

# Add technical motivation
I18n.locale = "en"
thm_make1 = TechnicalMotivation.create(name: "Important: media editing (Prezi), reflecting (TeamUp, ReFlex).")
Make.technical_motivations << thm_make1
I18n.locale = "gl"
thm_make1.name = "Importante: edición de medios dixitais (Prezi), reflexionar (TeamUp, ReFlex)."
thm_make1.save
I18n.locale = "es"
thm_make1.name = ""
thm_make1.save

I18n.locale = "en"
thm_make1 = TechnicalMotivation.create(name: "Nice to have: DIY kit, programming environment (Scratch, iTEC Widget Store), construction kit, 3d editing (Sketchup), 3d printing.")
Make.technical_motivations << thm_make1
I18n.locale = "gl"
thm_make1.name = "Desexable: Kit DIY (fágao vostede mesmo), entorno de programación (Scratch, iTEC Widget Store), kit de construción, edición 3D  (Sketchup), impresión 3D."
thm_make1.save
I18n.locale = "es"
thm_make1.name = ""
thm_make1.save

# Add guidelines preparation
I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Listen carefully to the student comments, and shape the activity according to their needs and interests.")
Make.guidelines_preparation_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Escoite coidadosamente os comentarios dos estudantes e prepare a actividade tendo en conta as súas necesidades e intereses."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Expand your competence and expertise by preparing the material, software and technology needed for making.")
Make.guidelines_preparation_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Expanda as súas competencias e coñecemento mediante a preparación de material, softare e tecnoloxía necesaria para a realización."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

# Add guidelines introduction
I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Inspire students to create prototypes that could be used by their audience and that address the identified challenges.")
Make.guidelines_introduction_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Inspire os estudantes para que cren prototipos que poderían utilizar outros e que se ocupen en especial das necesidades identificadas."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Team building exercises, such as playing games, solving puzzles or having ice-cream together, can support cooperation and collaboration towards a shared goal.")
Make.guidelines_introduction_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Exercicios de creación de equipos, como a participación en xogos, a resolución de problemas ou tomar un xeado xuntos, pode axudar a mellorar a cooperación e colaboración cara ao obxectivo compartido."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

# Add guidelines activity
I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Teams develop prototypes. Coach them to address the identified design challenges and to take all collected information into consideration by reminding them of their plans.")
Make.guidelines_activity_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Os equipos desenvolven prototipos. Adéstreos para que se ocupen das necesidades de deseño identificadas e para que teñan en conta toda a información recollida recordándolles os seus plans."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Remind the teams that the activities cumulate towards the creation of an artifact. If you notice teams stalling and debating for too long, step in and support them with hands-on suggestions towards a decision.")
Make.guidelines_activity_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Recorde aos equipos que as actividades se suceden para a consecución dun artefacto. Se aprecias que os equipos se estancan ou se debaten durante demasiado tempo, interveña e axúdeos con recomendacións directas para unha decisión."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Teams set up their prototypes in the classroom and discuss them with other teams, in particular how and if their prototypes address the identified challenges.")
Make.guidelines_activity_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Os equipos preparan os seus prototipos na clase e discuten con outros equipos, en particular como e se os seus prototipos se ocupan das necesidades identificadas."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Teams add the documentation of their design prototype(s) to the blog and describe it, using drawings, videos or digital photographs of their prototypes. Then, they record a reflection. You listen to their reflections and prepare comments for each team.")
Make.guidelines_activity_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Os equipos engaden documentación de su(s) prototipo(s) de deseño no blog e descríbeno utilizando debuxos, vídeos ou fotografías dixitais dos seus prototipos. Despois, gravan un reflexión."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

# Add guidelines assessment
I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Review the work of each team, their reflection recordings and blog entries, to ensure everyone explored and collected examples and/or media files. Then record audiovisual feedback for them. Your feedback might include suggestions and questions.")
Make.guidelines_assessment_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Revise o traballo de cada equipo, as súas reflexións e entradas no blog, para asegurarse que todo o mundo explorou e recolleu exemplos e/ou ficheiros media. Despois grávelles realimentación audiovisual. A súa realimentación podería incluír recomendacións e preguntas."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "Good prototypes illustrate how a design could be used or how it could work. Prototypes can be rough and unfinished, as long as they help in communication. A simple, yet well thought out concept can be as much of a learning experience as a technically intricate execution. Be careful in your assessment of prototypes.")
Make.guidelines_assessment_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Os bos prototipos ilustran como podería utilizarse un deseño como podería funcionar. Os prototipos poden ser rudos e inacabados, mentres axuden na comunicación. Un concepto simple pero ben pensado pode resultar unha experiencia de aprendizaxe tan boa como unha execución tecnicamente complexa. Sexa coidadoso na avaliación de prototipos."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save

I18n.locale = "en"
gi_make1 = GuidelineItem.create(description: "You could also ask the students to grade their teammates’ contributions, using the student grades to help form your own assessment.")
Make.guidelines_assessment_items << gi_make1
I18n.locale = "gl"
gi_make1.description = "Tamén poderías pedir aos estudantes que poñan nota ás contribucións dos seus compañeiros de clase e utilizar as devanditas notas como axuda para a túa propia avaliación."
gi_make1.save
I18n.locale = "es"
gi_make1.description = ""
gi_make1.save


Ask = Activity.create(
icon: 'ask.png', 
timeToComplete: '3',
name: 'Preguntar',
locale: 'gl', 
description: '﻿Os equipos reúnense con 2-4 persoas que poderían ser usuarios futuros dos prototipos e ensínanlles os seus prototipos e ideas de deseño utilizando escritos, debuxos ou modelos. Considérase que estes participantes teñen un entendemento experto do dominio no que se sitúan os deseños dos estudantes. A capacidade experta pode ser interpretada de forma ampla, por exemplo, un traballador da construción podería considerarse que ofrece un coñecemento profundo das prácticas diarias das persoas da construción. Promóvese que os participantes expertos utilicen bolígrafos e notas post-it para modificar e comentar sobre o prototipo. Despois de taller os estudantes analizan os comentarios e deciden como interpretalos para o seu re-deseño. Despois refinan a súa proposta de deseño, especialmente en relación ás necesidades de deseño, contexto e valor engadido do resultado, gravan unha reflexión e actualizan a súa documentación.',
teacherMotivation: 'Deixar que os estudantes se ocupen de levar a cabo o taller.
Coñecer mellor os seus estudantes.
Considerar coidadosamente os participantes apropiados para o taller.
Establecer colaboracións con expertos externos.
conectar a escola con outras partes da sociedade.
Proporcionar aos estudantes a oportunidade de que os alumnos se ocupen dos seus propios intereses persoais.
Aproveitar as oportunidades que pode proporcionar a realidade e actuar de forma creativa no devandito contexto.' ,
learnerMotivation: 'Empatizar con outros e traballar con xente diferente.
Contactar con expertos e pedir colaboración.
Presentar ideas a xente que non seguiu a progresión do proxecto.
Discutir e negociar con profesores e expertos.
Recibir críticas e incorporar ideas de expertos nos seus proxectos.
Crear prototipos en papel.',
technicalMotivation: 'Requirido: gravador media, tomar notas',
guidelinesPreparation: 'Escoite coidadosamente os comentarios dos alumnos e de forma á actividade tendo en conta as súas necesidades e intereses.
Desenvolva a súa competencia e experiencia utilizando as ideas que obtén de escoitar as gravacións coas reflexións para identificar xente adecuada á que preguntar sobre os prototipos.
Os docentes universitarios adoitan ter un horario flexible e encontran motivador transmitir o seu coñecemento experto a alumnos novos. Quizais tamén poida considerar contactar e invitar estudantes universitarios.',
guidelinesIntroduction: 'Propoña a realización dun taller aos estudantes.
Os equipos propoñen expertos posibles aos que poderían invitar e preguntas abertas que lles poderían facer. Se non se lles ocorre ningún lles faga algunhas suxestións.
Cada equipo invita a 3-4 persoas ao seu tallar e organiza o lugar e o tempo para iso. É importante pensar de forma seria e a fondo os participantes apropiados e ser capaz de indicar como cada participante pode informar do proxecto. Os talleres poden realizarse fóra da escola, por exemplo nunha oficina dunha organización no, nunha casa da terceira idade, etc.
Podería ser interesante que os alumnos contactasen cos expertos. Practique cos equipos como aproximarse aos participantes potenciais.',
guidelinesActivity: 'Adestre os equipos mediante a práctica do taller e proporcionándolles as guías de taller do proxecto iTEC como un exemplo desta actividade dentro dun proxecto europeo a grande escala. Axude aos estudantes que mostren dificultades.
Asegúrese que cada equipo ten acceso ao material para o taller (cámaras, libretas, micrófonos, notas post-it e bolígrafos) e os seus prototipos (ou unha representación destes).
Os estudantes presentan as súas propostas de deseño e o deseño do prototipo aos participantes e pídenlles os seus comentarios e ideas. A xente pode alterar os prototipos ou debuxar sobre eles para expresarse mellor. Os estudantes toman notas e fan debuxos das actividades e a discusión.
Os equipos analizan as súas notas e os debuxos da xente. Para iso deben utilizar a actividade "Representar nun mapa". Formule aos alumnos preguntas abertas e intente levalos máis alá do obvio.
Os equipos deciden os cambios no seu prototipo e proposta de deseño sobre a base dos seus comentarios.
Os equipos gravan unha reflexión e documentan o seu progreso en liña.',
guidelinesAssessment: 'Revise o traballo de cada equipo, as súas gravacións con reflexións e as entradas no blog, para asegurarse que todo o mundo vai na dirección correcta. Despois grave realimentación audiovisual para eles. A súa realimentación pode incluír recomendacións e preguntas.
Se o experto seguiu a progresión do traballo do equipo, a súa visión experta sobre os resultados do alumno deberían ser considerados. O experto podería involucrarse na definición dos criterios de avaliación. Poderíase pedir aos participantes que gravaran unha mensaxe audiovisual para os estudantes despois de re-deseñar os seus prototipos sobre a base das recomendacións dos participantes.')

# Add teacher motivation
I18n.locale = "en"
tm_ask1 = TeacherMotivation.create(name: "Let students be in charge of facilitating a workshop.")
Ask.teacher_motivations << tm_ask1
I18n.locale = "gl"
tm_ask1.name = "Deixar que os estudantes se ocupen de levar a cabo o taller."
tm_ask1.save
I18n.locale = "es"
tm_ask1.name = ""
tm_ask1.save

I18n.locale = "en"
tm_ask1 = TeacherMotivation.create(name: "Get to know your students better.")
Ask.teacher_motivations << tm_ask1
I18n.locale = "gl"
tm_ask1.name = "Coñecer mellor os seus estudantes."
tm_ask1.save
I18n.locale = "es"
tm_ask1.name = ""
tm_ask1.save

I18n.locale = "en"
tm_ask1 = TeacherMotivation.create(name: "Thoroughly consider the appropriate participants for the workshop.")
Ask.teacher_motivations << tm_ask1
I18n.locale = "gl"
tm_ask1.name = "Considerar coidadosamente os participantes apropiados para o taller."
tm_ask1.save
I18n.locale = "es"
tm_ask1.name = ""
tm_ask1.save

I18n.locale = "en"
tm_ask1 = TeacherMotivation.create(name: "Building collaboration with outside experts.")
Ask.teacher_motivations << tm_ask1
I18n.locale = "gl"
tm_ask1.name = "Establecer colaboracións con expertos externos."
tm_ask1.save
I18n.locale = "es"
tm_ask1.name = ""
tm_ask1.save

I18n.locale = "en"
tm_ask1 = TeacherMotivation.create(name: "Connecting school to other parts of society.")
Ask.teacher_motivations << tm_ask1
I18n.locale = "gl"
tm_ask1.name = "Conectar a escola con outras partes da sociedade."
tm_ask1.save
I18n.locale = "es"
tm_ask1.name = ""
tm_ask1.save

I18n.locale = "en"
tm_ask1 = TeacherMotivation.create(name: "Providing students with the opportunity the learners how their personal interests matter.")
Ask.teacher_motivations << tm_ask1
I18n.locale = "gl"
tm_ask1.name = "Proporcionar aos estudantes a oportunidade de que os alumnos se ocupen dos seus propios intereses persoais."
tm_ask1.save
I18n.locale = "es"
tm_ask1.name = ""
tm_ask1.save

I18n.locale = "en"
tm_ask1 = TeacherMotivation.create(name: "Taking advantage of the opportunities reality may provide and acting creatively with the context.")
Ask.teacher_motivations << tm_ask1
I18n.locale = "gl"
tm_ask1.name = "Aproveitar as oportunidades que pode proporcionar a realidade e actuar de forma creativa no devandito contexto."
tm_ask1.save
I18n.locale = "es"
tm_ask1.name = ""
tm_ask1.save

# Add learner motivation
I18n.locale = "en"
lm_ask1 = LearnerMotivation.create(name: "Empathize with others and work with different people.")
Ask.learner_motivations << lm_ask1
I18n.locale = "gl"
lm_ask1.name = "Empatizar con outros e traballar con xente diferente."
lm_ask1.save
I18n.locale = "es"
lm_ask1.name = ""
lm_ask1.save

I18n.locale = "en"
lm_ask1 = LearnerMotivation.create(name: "Contact experts and ask for collaboration.")
Ask.learner_motivations << lm_ask1
I18n.locale = "gl"
lm_ask1.name = "Contactar con expertos e pedir colaboración."
lm_ask1.save
I18n.locale = "es"
lm_ask1.name = ""
lm_ask1.save

I18n.locale = "en"
lm_ask1 = LearnerMotivation.create(name: "Present ideas to people who have not followed the project progression.")
Ask.learner_motivations << lm_ask1
I18n.locale = "gl"
lm_ask1.name = "Presentar ideas a xente que non seguiu a progresión do proxecto."
lm_ask1.save
I18n.locale = "es"
lm_ask1.name = ""
lm_ask1.save

I18n.locale = "en"
lm_ask1 = LearnerMotivation.create(name: "Discuss and negotiate with teachers and experts.")
Ask.learner_motivations << lm_ask1
I18n.locale = "gl"
lm_ask1.name = "Discutir e negociar con profesores e expertos."
lm_ask1.save
I18n.locale = "es"
lm_ask1.name = ""
lm_ask1.save

I18n.locale = "en"
lm_ask1 = LearnerMotivation.create(name: "Receive criticism and incorporate expert views into their project.")
Ask.learner_motivations << lm_ask1
I18n.locale = "gl"
lm_ask1.name = "Recibir críticas e incorporar ideas de expertos nos seus proxectos."
lm_ask1.save
I18n.locale = "es"
lm_ask1.name = ""
lm_ask1.save

I18n.locale = "en"
lm_ask1 = LearnerMotivation.create(name: "Create paper prototypes.")
Ask.learner_motivations << lm_ask1
I18n.locale = "gl"
lm_ask1.name = "Crear prototipos en papel."
lm_ask1.save
I18n.locale = "es"
lm_ask1.name = ""
lm_ask1.save

# Add technical motivation
I18n.locale = "en"
thm_ask1 = TechnicalMotivation.create(name: "Required: media recorder, note taking.")
Ask.technical_motivations << thm_ask1
I18n.locale = "gl"
thm_ask1.name = "Requirido: gravador media, tomar notas."
thm_ask1.save
I18n.locale = "es"
thm_ask1.name = ""
thm_ask1.save

I18n.locale = "en"
thm_ask1 = TechnicalMotivation.create(name: "Tools: audio recorder, video recorder, post-it notes")
Ask.technical_motivations << thm_ask1
I18n.locale = "gl"
thm_ask1.name = "Ferramentas: gravador de audio, gravador de video, notas post-it."
thm_ask1.save
I18n.locale = "es"
thm_ask1.name = ""
thm_ask1.save

# Add guidelines preparation
I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Listen carefully to the student comments, and shape the activity according to their needs and interests.")
Ask.guidelines_preparation_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Escoite coidadosamente os comentarios dos estudantes e prepare a actividade tendo en conta as súas necesidades e intereses."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Develop your competence and expertise by using the insights you learned from listening to the reflection recordings for identifying suitable people to ask to comment on the prototypes.")
Ask.guidelines_preparation_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Desenvolva a súa competencia e experiencia utilizando as ideas que obtén de escoitar as gravacións coas reflexións para identificar xente adecuada á que preguntar sobre os prototipos."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "People working in academia often have a flexible schedule and find it motivating to pass their expert knowledge on to young learners. You may also consider to contact and invite university students.")
Ask.guidelines_preparation_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Os docentes universitarios adoitan ter un horario flexible e encontran motivador transmitir o seu coñecemento experto a alumnos novos. Quizais tamén poida considerar contactar e invitar estudantes universitarios."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

# Add guidelines introduction
I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Introduce the activity of facilitating a workshop to the students.")
Ask.guidelines_introduction_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Propoña a realización dun taller aos estudantes."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Teams brainstorm possible experts to invite and open ended questions to ask them. In case they cannot think of anyone, make a few suggestions.")
Ask.guidelines_introduction_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Os equipos propoñen expertos posibles aos que poderían invitar e preguntas abertas que lles poderían facer. Se non se lles ocorre ningún lles faga algunhas suxestións."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Each team invites 3–4 people to their workshop and arranges a place and time for it. It is important to thoroughly and seriously consider appropriate participants, and to be able to say how each participant can inform the project. The workshops may happen outside of school, for example at the office of a non-governmental organization, an elderly home etc.")
Ask.guidelines_introduction_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Cada equipo invita a 3-4 persoas ao seu tallar e organiza o lugar e o tempo para iso. É importante pensar de forma seria e a fondo os participantes apropiados e ser capaz de indicar como cada participante pode informar do proxecto. Os talleres poden realizarse fóra da escola, por exemplo nunha oficina dunha organización no, nunha casa da terceira idade, etc."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "It might be exciting for the students to contact the experts. Practice with the teams how to approach potential participants.")
Ask.guidelines_introduction_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Podería ser interesante que os alumnos contactasen cos expertos. Practique cos equipos como aproximarse aos participantes potenciais."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

# Add guideline activity
I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Coach the teams by practicing the workshop and providing the them with the workshop guidelines of the iTEC project as an example of this activity within a large scale European project. Support students that exhibit difficulties.")
Ask.guidelines_activity_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Adestre os equipos mediante a práctica do taller e proporcionándolles as guías de taller do proxecto iTEC como un exemplo desta actividade dentro dun proxecto europeo a grande escala. Axude aos estudantes que mostren dificultades."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Ensure that each team has access to workshop material (cameras, notebooks, microphone, post-it notes and pens) and their prototype (or a representation of it).")
Ask.guidelines_activity_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Asegúrese que cada equipo ten acceso ao material para o taller (cámaras, libretas, micrófonos, notas post-it e bolígrafos) e os seus prototipos (ou unha representación destes)."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Students present their design brief and prototype design to the participants and ask for their comments and ideas. The people may alter the prototypes or draw on them to express themselves better. Students take notes and pictures of the activities and the discussion.")
Ask.guidelines_activity_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Os estudantes presentan as súas propostas de deseño e o deseño do prototipo aos participantes e pídenlles os seus comentarios e ideas. A xente pode alterar os prototipos ou debuxar sobre eles para expresarse mellor. Os estudantes toman notas e fan debuxos das actividades e a discusión."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "The teams analyse their notes and the drawings of the people. They may use the MAP activity for this. Prompt them with open ended questions and coach them to go beyond the obvious.")
Ask.guidelines_activity_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Os equipos analizan as súas notas e os debuxos da xente. Para iso deben utilizar a actividade 'Representar nun mapa'. Formule aos alumnos preguntas abertas e intente levalos máis alá do obvio."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "The teams decide how their prototype and design brief should change based on the analysis.")
Ask.guidelines_activity_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Os equipos deciden os cambios no seu prototipo e proposta de deseño sobre a base dos seus comentarios."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Review the work of each team, their reflection recordings and blog entries, to ensure everyone is on the right track. Then record audiovisual feedback for them. Your feedback might include suggestions and questions.")
Ask.guidelines_activity_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Os equipos gravan unha reflexión e documentan o seu progreso en liña."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

# Add guideline assessment
I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "Review the work of each team, their reflection recordings and blog entries, to ensure everyone is on the right track. Then record audiovisual feedback for them. Your feedback might include suggestions and questions.")
Ask.guidelines_assessment_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Revise o traballo de cada equipo, as súas gravacións con reflexións e as entradas no blog, para asegurarse que todo o mundo vai na dirección correcta. Despois grave realimentación audiovisual para eles. A súa realimentación pode incluír recomendacións e preguntas."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save

I18n.locale = "en"
gi_ask1 = GuidelineItem.create(description: "In case the expert followed the progression of the teamwork, their expert view on the learners’ performance should be considered. The expert may be involved in defining the assessment criteria. The participants may be asked to record an audio-visual message to the students after redesign their prototypes with the suggestions of the participants in mind.")
Ask.guidelines_assessment_items << gi_ask1
I18n.locale = "gl"
gi_ask1.description = "Se o experto seguiu a progresión do traballo do equipo, a súa visión experta sobre os resultados do alumno deberían ser considerados. O experto podería involucrarse na definición dos criterios de avaliación. Poderíase pedir aos participantes que gravaran unha mensaxe audiovisual para os estudantes despois de re-deseñar os seus prototipos sobre a base das recomendacións dos participantes."
gi_ask1.save
I18n.locale = "es"
gi_ask1.description = ""
gi_ask1.save


Show = Activity.create(
icon: 'show.png', 
timeToComplete: '2',
name: 'Mostrar',
locale: 'gl', 
description: '﻿Os estudantes crean un vídeo cos subtítulos en inglés presentando o seu proceso e resultados de deseño así como os logros de aprendizaxe e posibles pasos futuros. Eles comparten esta documentación con outros estudantes iTEC ao longo de Europa, cos seus pais e a audiencia que identificaron para transferir a súa aprendizaxe, para comunicar os fundamentos do proxecto, para que os outros poidan coñecer e reutilizar o seu traballo, e para recibir realimentación coa que mellorar.',
teacherMotivation: 'Estudantes que se poñen no papel de expertos.
Sesións de realimentación e reflexión entre persoas utilizando o traballo dos estudantes como referencia.
Aprender sobre actividades ben realizadas e actividades que os estudantes necesitan practicar máis.
Ilustrar actividades de aprendizaxe esclar aos colegas e aos pais.
Recibir material para inspirar a futuros cursos e aos teus colegas.
Mostrar prototipos deseñados polos teus estudantes.',
learnerMotivation: 'Habilidades de edición multimedia.
Colaboración nun proxecto.
Priorizar aspectos de información.
Documentar, comunicar e resumir o proceso de aprendizaxe, os resultados e a importancia dun tema a outros.
Sobre os proxectos, datos e temas nos que outros estiveron a traballar.',
technicalMotivation: 'Necesario: edición de video, gravación de medios de comunicación (Audacia), publicación de vídeo (YouTube, Vimeo, dotSub), reflexión (TeamUp, ReFlex).
Importante: Compartición de información Media (Tenda de iTEC Widget).',
guidelinesPreparation: 'Desenvolva as súas competencias e coñecementos sobre os beneficios e inconvenientes de diferentes formas de documentación (por exemplo: animacións, vídeo, etc.) e prepare unha presentación para os seus estudantes. Familiarícese tamén con diferentes plataformas de intercambio de vídeo.',
guidelinesIntroduction: 'Inspire aos estudantes para que creen unha presentación que documente o seu proceso de aprendizaxe e os resultados utilizando un rango variado de elementos media, marcando así as diferentes formas en que os seus proxectos poden resultar impactantes. Fale cos estudantes sobre o proceso de produción, os pasos planeados e os requisitos.',
guidelinesActivity: 'Adestre os estudantes na elección do propósito, a audiencia e do medio para a súa presentación.
Os equipos preparan os seus prototipos na aula e móstranllelos aos outros.
Estudantes individuais ou os equipos crean guións gráficos para planear a narración da presentación e decidir que ficheiros dos que recolleron, tales como fotos, vídeo clips, gravacións de voz de entrevistas, etiquetas geolocalizadas ou animacións, utilizan para representar as súas conclusións e proceso dunha forma comprensible. Axúdelles mediante a presentación dos beneficios e inconvenientes dos diferentes media e trate sobre técnicas de representación e discurso, así como formas de convencer unha audiencia.
Os estudantes crean un vídeo con subtítulos en inglés presentando os seus resultados de deseño e documentan os seus logros de aprendizaxe e posibles pasos no futuro. Soben o seu vídeo a unha páxina en liña para aloxamento de vídeos e comarten o enlace co grupo de facebook de iTEC, os seus pais e participantes na actividade PREGUNTAR. Axúdelles proporcionándolles acceso a plataformas de intercambio de vídeo.
De forma adicional, pode organizar un evento Maker informal ao que invita pais, participantes da actividade PREGUNTAR e outros estudantes.
Ao final do pre-piloto comparta tamén as propostas de deseño modificadas dos seus estudantes coa comunidade iTEC mediante a publicación dunha entrada no blog de participación de iTEC ou pida aos seus estudantes que o publiquen eles.',
guidelinesAssessment: 'Revise todas as presentacións. Compare as actualizacións do progreso de cada un coas súas presentacións e comprobe se todos os pasos importantes foron incluídos na presentación (vexa a actividade REFLEXIÓN).
O traballo do estudante pode ser utilizado para dar realimentación aberta ou en sesións de reflexión.
Podería avaliar as documentacións de acordo ao seu valor como recursos para a preparación do exame.')

# Add teacher motivation
I18n.locale = "en"
tm_show1 = TeacherMotivation.create(name: "Students stepping into the role of experts.")
Show.teacher_motivations << tm_show1
I18n.locale = "gl"
tm_show1.name = "Estudantes que se poñen no papel de expertos."
tm_show1.save
I18n.locale = "es"
tm_show1.name = ""
tm_show1.save

I18n.locale = "en"
tm_show1 = TeacherMotivation.create(name: "Feedback and reflection sessions between people using the student work as reference.")
Show.teacher_motivations << tm_show1
I18n.locale = "gl"
tm_show1.name = "Sesións de realimentación e reflexión entre persoas utilizando o traballo dos estudantes como referencia."
tm_show1.save
I18n.locale = "es"
tm_show1.name = ""
tm_show1.save

I18n.locale = "en"
tm_show1 = TeacherMotivation.create(name: "Learning about well performed activities and activities students need to practice more.")
Show.teacher_motivations << tm_show1
I18n.locale = "gl"
tm_show1.name = "Aprender sobre actividades ben realizadas e actividades que os estudantes necesitan practicar máis."
tm_show1.save
I18n.locale = "es"
tm_show1.name = ""
tm_show1.save

I18n.locale = "en"
tm_show1 = TeacherMotivation.create(name: "Illustrating school learning activities to colleagues and parents.")
Show.teacher_motivations << tm_show1
I18n.locale = "gl"
tm_show1.name = "Ilustrar actividades de aprendizaxe esclar aos colegas e aos pais."
tm_show1.save
I18n.locale = "es"
tm_show1.name = ""
tm_show1.save

I18n.locale = "en"
tm_show1 = TeacherMotivation.create(name: "Receiving material to inspire future courses and your colleagues.")
Show.teacher_motivations << tm_show1
I18n.locale = "gl"
tm_show1.name = "Recibir material para inspirar a futuros cursos e aos teus colegas."
tm_show1.save
I18n.locale = "es"
tm_show1.name = ""
tm_show1.save

I18n.locale = "en"
tm_show1 = TeacherMotivation.create(name: "Showcasing prototypes designed by your students.")
Show.teacher_motivations << tm_show1
I18n.locale = "gl"
tm_show1.name = "Mostrar prototipos deseñados polos teus estudantes."
tm_show1.save
I18n.locale = "es"
tm_show1.name = ""
tm_show1.save

# Add learner motivation
I18n.locale = "en"
lm_show1 = LearnerMotivation.create(name: "Multimedia editing skills.")
Show.learner_motivations << lm_show1
I18n.locale = "gl"
lm_show1.name = "Habilidades de edición multimedia."
lm_show1.save
I18n.locale = "es"
lm_show1.name = ""
lm_show1.save

I18n.locale = "en"
lm_show1 = LearnerMotivation.create(name: "Collaboration on a project.")
Show.learner_motivations << lm_show1
I18n.locale = "gl"
lm_show1.name = "Colaboración nun proxecto."
lm_show1.save
I18n.locale = "es"
lm_show1.name = ""
lm_show1.save

I18n.locale = "en"
lm_show1 = LearnerMotivation.create(name: "To prioritize aspects of information.")
Show.learner_motivations << lm_show1
I18n.locale = "gl"
lm_show1.name = "Priorizar aspectos de información."
lm_show1.save
I18n.locale = "es"
lm_show1.name = ""
lm_show1.save

I18n.locale = "en"
lm_show1 = LearnerMotivation.create(name: "To document, communicate and summarize learning process, results and the importance of a topic to others.")
Show.learner_motivations << lm_show1
I18n.locale = "gl"
lm_show1.name = "Documentar, comunicar e resumir o proceso de aprendizaxe, os resultados e a importancia dun tema a outros."
lm_show1.save
I18n.locale = "es"
lm_show1.name = ""
lm_show1.save

I18n.locale = "en"
lm_show1 = LearnerMotivation.create(name: "About the projects, data, and topics others have been working on.")
Show.learner_motivations << lm_show1
I18n.locale = "gl"
lm_show1.name = "Sobre os proxectos, datos e temas nos que outros estiveron a traballar."
lm_show1.save
I18n.locale = "es"
lm_show1.name = ""
lm_show1.save

# Technical motivation
I18n.locale = "en"
thm_show1 = TechnicalMotivation.create(name: "Required: video editing, media recording (Audacity), video publication (YouTube, Vimeo, dotSub), reflection (TeamUp, ReFlex).")
Show.technical_motivations << thm_show1
I18n.locale = "gl"
thm_show1.name = "Necesario: edición de video, gravación de medios de comunicación (Audacia), publicación de vídeo (YouTube, Vimeo, dotSub), reflexión (TeamUp, ReFlex)."
thm_show1.save
I18n.locale = "es"
thm_show1.name = ""
thm_show1.save

I18n.locale = "en"
thm_show1 = TechnicalMotivation.create(name: "Important: media sharing (iTEC Widget Store).")
Show.technical_motivations << thm_show1
I18n.locale = "gl"
thm_show1.name = "Importante: Compartición de información Media (Tenda de iTEC Widget)."
thm_show1.save
I18n.locale = "es"
thm_show1.name = ""
thm_show1.save

# Add guidelines preparation
I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Develop your competence and expertise by researching the benefits and drawbacks of different forms of documentation, e.g. animation, video etc. and by preparing a presentation for your students. Also get familiar with different video sharing platforms.")
Show.guidelines_preparation_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Desenvolva as súas competencias e coñecementos sobre os beneficios e inconvenientes de diferentes formas de documentación (por exemplo: animacións, vídeo, etc.) e prepare unha presentación para os seus estudantes. Familiarícese tamén con diferentes plataformas de intercambio de vídeo."
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

# Add guidelines introduction
I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Inspire the students to create a presentation that documents their learning process and results using a diverse range of media, by pointing out the different ways their project can reach impact this way. Speak with the students about the production process, planned steps, and requirements.")
Show.guidelines_introduction_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Inspire aos estudantes para que creen unha presentación que documente o seu proceso de aprendizaxe e os resultados utilizando un rango variado de elementos media, marcando así as diferentes formas en que os seus proxectos poden resultar impactantes. Fale cos estudantes sobre o proceso de produción, os pasos planeados e os requisitos."
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

# Add guidelines activity
I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Coach the students in choosing a purpose, an audience, and a medium for their presentation.")
Show.guidelines_activity_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Adestre os estudantes na elección do propósito, a audiencia e do medio para a súa presentación."
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Teams set up their prototypes in the classroom and demonstrate them to others.")
Show.guidelines_activity_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Os equipos preparan os seus prototipos na aula e móstranllelos aos outros."
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Individual students or teams create storyboards to plan the narrative of the presentation, and decide which collected files, such as photos, video clips, voice recordings of interviews, geotags, or animations to use to represent their conclusions and process in a meaningful way. Support them by presenting the benefits and drawbacks of different media to students, and discuss speech and performance techniques, as well as ways of convincing an audience.")
Show.guidelines_activity_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Estudantes individuais ou os equipos crean guións gráficos para planear a narración da presentación e decidir que ficheiros dos que recolleron, tales como fotos, vídeo clips, gravacións de voz de entrevistas, etiquetas geolocalizadas ou animacións, utilizan para representar as súas conclusións e proceso dunha forma comprensible. Axúdelles mediante a presentación dos beneficios e inconvenientes dos diferentes media e trate sobre técnicas de representación e discurso, así como formas de convencer unha audiencia."
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Students create a video with English subtitles presenting their design results, and documenting their learning achievements and possible future steps. They upload their video to a video hosting page online and share the link with the iTEC facebook group, their parents and ASK activity participants. Support them by providing sharing platform options. You can use the videos to communicate the task to other students in the future.")
Show.guidelines_activity_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Os estudantes crean un vídeo con subtítulos en inglés presentando os seus resultados de deseño e documentan os seus logros de aprendizaxe e posibles pasos no futuro. Soben o seu vídeo a unha páxina en liña para aloxamento de vídeos e comarten o enlace co grupo de facebook de iTEC, os seus pais e participantes na actividade PREGUNTAR. Axúdelles proporcionándolles acceso a plataformas de intercambio de vídeo."
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Additionally, you may organize an informal Maker event, to which parents, ASK activity participants and other students are invited.")
Show.guidelines_activity_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "De forma adicional, pode organizar un evento Maker informal ao que invita pais, participantes da actividade PREGUNTAR e outros estudantes."
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "At the end of the pre-pilot, also share the modified design briefs of your students with the itec community, by posting them to the iTEC Participate blog or asking the students to post them there.")
Show.guidelines_activity_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Ao final do pre-piloto comparta tamén as propostas de deseño modificadas dos seus estudantes coa comunidade iTEC mediante a publicación dunha entrada no blog de participación de iTEC ou pida aos seus estudantes que o publiquen eles."
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

# Add guideline assessment
I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Review all presentations. Compare everyone’s progress updates with their presentations to see if all important steps are included in the presentation (see activity ‘Reflection’).")
Show.guidelines_assessment_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Revise todas as presentacións. Compare as actualizacións do progreso de cada un coas súas presentacións e comprobe se todos os pasos importantes foron incluídos na presentación (vexa a actividade REFLEXIÓN)."
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Review all reflection recordings and discuss the process from “dream” to “show” with the students. What was their experience like? What have they learned? What would they like to explore further?")
Show.guidelines_assessment_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Revise tódalas reflexións e discuta o proceso desde 'soñar'  a 'mostrar' cos seus estudantes. Cómo foi a súa experiencia? Qué aprenderon? Qué lles gustaría seguir explorando?" 
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "Student work can be used for open feedback and reflection sessions.")
Show.guidelines_assessment_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "O traballo do estudante pode ser utilizado para dar realimentación aberta ou en sesións de reflexión." 
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save

I18n.locale = "en"
gi_show1 = GuidelineItem.create(description: "You could assess the documentations for their value as resources for exam preparation.")
Show.guidelines_assessment_items << gi_show1
I18n.locale = "gl"
gi_show1.description = "Podería avaliar as documentacións de acordo ao seu valor como recursos para a preparación do exame." 
gi_show1.save
I18n.locale = "es"
gi_show1.description = ""
gi_show1.save



Collaborate = Activity.create(
icon: 'collaborate.png', 
timeToComplete: '1',
name: 'Colaborar',
locale: 'gl', 
description: '﻿Os estudantes colaboran con estudantes doutras escolas iTEC. A colaboración ocasional e ao hazar promovida polos estudantes é alentada.',
teacherMotivation: 'Axudar á colaboración internacional.
Ampliar a súa comprensión cross-curricular.
Compartir a responsabilidade cos estudantes.
Guiar os estudantes para que tomen eleccións significativas.',
learnerMotivation: 'Contactar, encontrar e colaborar con estudantes fóra do seu círculo social.
Apreciar a interconexión de áreas de coñecemento.',
technicalMotivation: 'Requirido: discusión en liña, publicación media, publicación.
Importante: blogging.',
guidelinesPreparation: 'Revise o traballo de cada equipo, as gravacións das súas reflexións e entradas no blog, asegurándose que todos estan no camiño correcto. Despois grabeles realimentación audiovisual. A súa realimentación podería inclurir recomendacións e preguntas. Escoite con atención os comentarios dos estudantes e dele forma á actividade tendo en conta as súas necesidades e intereses.
Expandas as súas competencias e coñecemento preparando e probando as ferramentas dixitais que utilizará, pudiendole pedir aos estudantes que lle demostren as ferramentas.
Recolla exemplos de como podería ser a colaboración e que podería permitir.',
guidelinesIntroduction: 'Inspire os estudantes para que vaian máis alá da súa zona de confianza (confort) e para que contacten con estudantes que non coñecen, presentándolles beneficios do networking, a aprendizaxe entre compañeiros yla colaboración en liña.
Sexa coidadoso coa privacidade en liña e con cuestións de seguridade.
Demostre como os estudantes poden utilizar as heramientas dixitais para contactar con outros.',
guidelinesActivity: 'Os estudantes buscan traballos relacionados e comparten os seus propios, seguen e comentan as entradas nos blogs doutros estudantes.
Os estudantes discuten en liña a súa experiencia de participación no proxecto con estudantes doutras clases.
De forma ocasional, establécense videoconferencias ou intercámbianse correos electrónicos entre os colaboradores.
Adestre os estudantes para que fagan preguntas a través das canles que vostede prepare para eles.',
guidelinesAssessment: 'Sexa aberto a que os intereses persoais formen parte da súa avaliación. Pode que non sexa a frecuencia da comunicación duns estudantes con outros, senón o nivel da devandita comunicación. ¿En que medida aproveitaron os estudantes a experiencia doutros fóra da clase?')

# Add teacher motivation
I18n.locale = "en"
tm_collaborate1 = TeacherMotivation.create(name: "Support international collaboration.")
Collaborate.teacher_motivations << tm_collaborate1
I18n.locale = "gl"
tm_collaborate1.name = "Axudar á colaboración internacional."
tm_collaborate1.save
I18n.locale = "es"
tm_collaborate1.name = ""
tm_collaborate1.save

I18n.locale = "en"
tm_collaborate1 = TeacherMotivation.create(name: "Broaden your cross-curricular understanding.")
Collaborate.teacher_motivations << tm_collaborate1
I18n.locale = "gl"
tm_collaborate1.name = "Ampliar a súa comprensión cross-curricular"
tm_collaborate1.save
I18n.locale = "es"
tm_collaborate1.name = ""
tm_collaborate1.save

I18n.locale = "en"
tm_collaborate1 = TeacherMotivation.create(name: "Share responsibility with students.")
Collaborate.teacher_motivations << tm_collaborate1
I18n.locale = "gl"
tm_collaborate1.name = "Compartir a responsabilidade cos estudantes."
tm_collaborate1.save
I18n.locale = "es"
tm_collaborate1.name = ""
tm_collaborate1.save

I18n.locale = "en"
tm_collaborate1 = TeacherMotivation.create(name: "Guide students to make meaningful choices.")
Collaborate.teacher_motivations << tm_collaborate1
I18n.locale = "gl"
tm_collaborate1.name = "Guiar os estudantes para que tomen eleccións significativas."
tm_collaborate1.save
I18n.locale = "es"
tm_collaborate1.name = ""
tm_collaborate1.save

# Add learner motivation
I18n.locale = "en"
lm_collaborate1 = LearnerMotivation.create(name: "Contact, encounter and collaborate with students outside of their social circle.")
Collaborate.learner_motivations << lm_collaborate1
I18n.locale = "gl"
lm_collaborate1.name = "Contactar, encontrar e colaborar con estudantes fóra do seu círculo social."
lm_collaborate1.save
I18n.locale = "es"
lm_collaborate1.name = ""
lm_collaborate1.save

I18n.locale = "en"
lm_collaborate1 = LearnerMotivation.create(name: "Appreciate the interconnectedness of knowledge areas.")
Collaborate.learner_motivations << lm_collaborate1
I18n.locale = "gl"
lm_collaborate1.name = "Apreciar a interconexión de áreas de coñecemento."
lm_collaborate1.save
I18n.locale = "es"
lm_collaborate1.name = ""
lm_collaborate1.save

# Add technical motivation
I18n.locale = "en"
thm_collaborate1 = TechnicalMotivation.create(name: "Required: online discussion, media publication, publication.")
Collaborate.technical_motivations << thm_collaborate1
I18n.locale = "gl"
thm_collaborate1.name = "Requirido: discusión en liña, publicación media, publicación."
thm_collaborate1.save
I18n.locale = "es"
thm_collaborate1.name = ""
thm_collaborate1.save

I18n.locale = "en"
thm_collaborate1 = TechnicalMotivation.create(name: "Important: blogging.")
Collaborate.technical_motivations << thm_collaborate1
I18n.locale = "gl"
thm_collaborate1.name = "Importante: blogging."
thm_collaborate1.save
I18n.locale = "es"
thm_collaborate1.name = ""
thm_collaborate1.save

I18n.locale = "en"
thm_collaborate1 = TechnicalMotivation.create(name: "Tools: iTEC students collaborate facebook group, iTEC teacher community are potential networks for sharing outcomes and for establishing collaboration beyond the walls of a school and borders of a country.")
Collaborate.technical_motivations << thm_collaborate1
I18n.locale = "gl"
thm_collaborate1.name = "Ferramentas: grupo de Facebook para a colaboración de estudiantes iTEC, comunidade de profesores iTEC."
thm_collaborate1.save
I18n.locale = "es"
thm_collaborate1.name = ""
thm_collaborate1.save

# Add guidelines preparation
I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Review the work of each team, their reflection recordings and blog entries, to ensure everyone is on the right track. Then record audiovisual feedback for them. Your feedback might include suggestions and questions. Listen carefully to the student comments, and shape the activity according to their needs and interests.")
Collaborate.guidelines_preparation_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Revise o traballo de cada equipo, as gravacións das súas reflexións e entradas no blog, asegurándose que todos estan no camiño correcto. Despois grabeles realimentación audiovisual. A súa realimentación podería inclurir recomendacións e preguntas. Escoite con atención os comentarios dos estudantes e dele forma á actividade tendo en conta as súas necesidades e intereses."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Expand your competence and expertise by preparing and testing digital tools to use, possibly ask students to demonstrate tools to you.")
Collaborate.guidelines_preparation_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Expanda as súas competencias e coñecemento preparando e probando as ferramentas dixitais que utilizará, pudiendole pedir aos estudantes que lle demostren as ferramentas."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Collect examples of how collaboration may look and what it may afford.")
Collaborate.guidelines_preparation_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Recolla exemplos de como podería ser a colaboración e que podería permitir."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

# Add guidelines introduction
I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Inspire students to step out of their comfort zone and to contact students they never met before, by presenting benefits or networking, peer-learning and online collaboration.")
Collaborate.guidelines_introduction_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Inspire os estudantes para que vaian máis alá da súa zona de confianza (confort) e para que contacten con estudantes que non coñecen, presentándolles beneficios do networking, a aprendizaxe entre compañeiros yla colaboración en liña."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Be mindful of online privacy and safety issues.")
Collaborate.guidelines_introduction_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Sexa coidadoso coa privacidade en liña e con cuestións de seguridade."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Demonstrate the digital tools the students may use to contact others.")
Collaborate.guidelines_introduction_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Demostre como os estudantes poden utilizar as heramientas dixitais para contactar con outros."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

# Add guidelines activity
I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Students search for related work and share their own, they follow and comment on other student’s posts.")
Collaborate.guidelines_activity_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Os estudantes buscan traballos relacionados e comparten os seus propios, seguen e comentan as entradas nos blogs doutros estudantes."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Students discuss their experience of participating in the project with students from other classes online.")
Collaborate.guidelines_activity_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Os estudantes discuten en liña a súa experiencia de participación no proxecto con estudantes doutras clases."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Occasionally, videoconferences are set up or emails are exchanged between the collaborators.")
Collaborate.guidelines_activity_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "De forma ocasional, establécense videoconferencias ou intercámbianse correos electrónicos entre os colaboradores."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "You coach students to post questions to the channels you set up for them.")
Collaborate.guidelines_activity_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Adestre os estudantes para que fagan preguntas a través das canles que vostede prepare para eles."
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

# Add guideline assessment
I18n.locale = "en"
gi_collaborate1 = GuidelineItem.create(description: "Be open to let personal interests shape your assessment. It may not be the frequency of the students’ engagement with others, but rather the depth of their engagement. How apt were the students to utilize the experience of others outside of the classroom?")
Collaborate.guidelines_assessment_items << gi_collaborate1
I18n.locale = "gl"
gi_collaborate1.description = "Sexa aberto a que os intereses persoais formen parte da súa avaliación. Pode que non sexa a frecuencia da comunicación duns estudantes con outros, senón o nivel da devandita comunicación. ¿En que medida aproveitaron os estudantes a experiencia doutros fóra da clase?"
gi_collaborate1.save
I18n.locale = "es"
gi_collaborate1.description = ""
gi_collaborate1.save

CreateGame = ActivitySequence.create(
name: 'Crear un xogo',
description: 'Esta secuencia proporciona aos alumnos una oportunidade única de identificar conceptos propios do deseño de xogos nos xogos que practican no fogar, de explorar qué pode significar estar empleado na industria dos xogos, de aplicar conceptos propios dos xogos para deseñar o seu propio xogo, and para reflexionar profundamente sobre o uso dos xogos como actividades educativas'
)

CreateGame.tags << creative

CreateObject = ActivitySequence.create(
name: 'Crear un obxeto',
description: 'A cualidade única desta sequencia é a súa relación coas culturas hacker e maker que se están proxectando desde ambientes informales aos ambientes formales de aprendizaxe. Abrir as escolas as culturas maker e ás prácticas de fabricación pode fomentar o espírito emprendedor e inventor dos alumnos, e pode expor os profesores a posibilidades de desenrolar, por exemplo, competencias pedagóxicas, técnicas e organizativas. Os estudantes aprenderán sobre a personalización masiva e o seu impacto potencial nas actuales prácticas económicas e medioambientais. Esta secuencia anima a crear conexións con laboratorios de fabricación nacionais e Hackerspaces como unha maneira de conectar as escolar con outros aspectos da sociedade. A conexión con workshops fóra da escola pode dar acceso a expertos que che poden aforrar tempo.'
)

I18n.locale = "en"

Dream.name = "Dream"
Dream.description = "You present a design brief to your class that ties to the curriculum and the local community, but leaves room for interpretation. You inspire the students by providing them with the motivation for giving their best and by telling them about the ownership and freedom over the task. You present the learning activities process and your schedule, and negotiate the assessment criteria with the class. Students form teams, discuss, question and familiarize themselves with the design brief. The teams refine their design brief, particularly in relation to whom they are designing for, initial design challenges and possible design results. Students record reflections and document their work online."
Dream.guidelinesPreparation = "",
Dream.save

Explore.name = "Explore"
Explore.description = "Student teams explore the context of their design either by observing relevant practices or environments using digital cameras, notebooks and microphones, or by searching existing works that relate to their design brief by collecting examples similar to that which they are intending to design. The object of observation depends on who they are designing for, what they are designing and the initial challenges they want to address. They share their collected media files on their blogs and record a reflection. You guide their search and support them in the qualification of their material. Note that viewing and qualifying video material can be time consuming. Spending time viewing videos that contain inaccurate information, can be a detour from which a pedagogically meaningful conversation may arise, and may provide students with a first-hand experience about the appearance of an invalid source. Some students, for example younger ones, may need more guidance in performing this activity."
Explore.save

Map.name = "Map"
Map.description = "Teams analyse their findings using mind-mapping techniques. They identify relations, similarities and differences between the examples and/or media files they collected. Based on their collected information and analysis, the teams refine their design brief, especially the design challenges, design results and audience. Then the teams record a reflection. Open ended questions can be challenging for students to answer initially. However, after passing the initial threshold, students are likely to have inspiring ideas."
Map.save

Reflect.name = "Reflect"
Reflect.description = "Students and the teacher record, post and share audio-visual reflections and feedback of project progress, challenges and future steps. The students slowly build a shared collection of ways to tackle challenges, which can be used after the project ended."
Reflect.save

Make.name = "Make"
Make.description = "Based on their refined design brief and design ideas, student teams start making. They create their first prototype, and discuss it afterwards. The discussion especially relates to how well the design address the identified design challenges. They then record a reflection and document their activities. Careful guidance through the learning activities and the process of creation is indispensable for students to keep their minds on learning potential curricular requirements. Highlight the reflection after this activity and ensure that everyone focuses on addressing the needs of an audience. To avoid free-riders or unequal workload division, carefully divide tasks and roles within teams."
Make.save

Ask.name = "Ask"
Ask.description = "Teams meet with 2–4 people, who could be future users of the prototypes, and communicate their prototypes and design ideas using prints, drawings or models. These participating people are considered to have an expert understanding of the domain the student designs are framed within. Expertise may be interpreted broadly, for example, a construction site worker can be considered to offer deep insight into the everyday practices of people on a building site. The expert participants are encouraged to use pens and post-it notes to modify and comment on the prototype. After the workshop the students analyze the comments and decide how to interpret them for their re-design. They then refine their design brief, especially in relation to the design challenges, context and added value of the result, record a reflection and update their documentation. This activity can happen more than once at varying time investment. Students can collect feedback on their work by asking experts, potential future users as well as from other student teams and the teacher."
Ask.save

Show.name = "Show"
Show.description = "Students create a video with English subtitles presenting their design results and process, as well as learning achievements and possible future steps. They share this documentation with other iTEC students across Europe, their parents and their identified audience to transfer their learning, to communicate the background of their project, to let others know about the possibility to remix their work, and to receive feedback for improvement."
Show.save

Collaborate.name = "Collaborate"
Collaborate.description = "Students collaborate with students from other iTEC schools. Ad-hoc and serendipitous collaboration, driven by the students is encouraged."
Collaborate.save

interesting.name = "interesting"
interesting.save

creative.name = "creative"
creative.save

CreateGame.name = "Create game"
CreateGame.description = "With a striving, highly explorative game industry and the topicality of gamification, this learning story provides students with the unique opportunity to identify game design concepts in the games they play at home, to explore what it would mean to be employed in the game industry, to apply game design concepts by designing their own game, and to deeply reflect what gamification of school and educational activities would mean."
CreateGame.save

CreateObject.name = "Create object"
CreateObject.description = "This story’s unique quality is its relation to hacker and maker cultures that are finding their way from hobbyist environments to formal learning spaces. Opening up schools to maker cultures and fabrication practices may foster entrepreneurial and inventor spirits in students, and may expose teachers to possibilities for developing, for example, pedagogical, technical and organizational competences. Students will learn about mass customization and its potential impact on current economic and environmental practices. This learning story encourages to build connections to national Fabrication Laboratories and Hackerspaces as a way of connecting schools with other aspects of society. The connection to workshops outside of school can give access to expert builders and makers whose support can save you time."
CreateObject.save

# Creates activity instances
Dream_i1 = ActivityInstance.create(
name: "Dream", 
description: "I present my class with a design challenge that is directly related to their community: Explore the environment around our school and design an engaging game that utilizes geolocation technologies. The topic of the game can focus on either the local culture or local natural environment. I prompt the students for topics: cultural monuments, historical streets, bird ecosystems, and so on. Before we get started, I add that the game should ideally not focus too much on puzzles but rather aim to address a challenge they observe in their community, such as a lack of awareness of culturally relevant institutions or about the decline in bird species. I use TeamUp to form teams based on the topic interests of the students. I hand out a design brief to each team, that suggests that the geolocation game should be suitable for students that are one grade lower than the students of my class. Each team has the rest of the class to brainstorm the rules of the game. I present a few easy-to-use game platforms the teams can use for their games."
)

Dream.activity_instances << Dream_i1

I18n.locale = "gl"
Dream_i1.name = "Soñar"
Dream_i1.description = " Presento á miña clase un reto de deseño que é directamente relacionado coa súa comunidade: Explore o ambiente ao redor da nosa escola e deseñe un xogo atractivo que utiliza tecnoloxías de geolocation. O tema do xogo pode concentrarse ou na cultura local ou en ambiente natural local. Impulso os estudantes para temas: monumentos culturais, rúas históricas, ecosistemas de paxaros, e así sucesivamente. Antes de que sexamos empezados, engado que o xogo debía idealmente non concentrarse demasiado en crebacabezas pero máis ben aspira a abordar un reto que observan na súa comunidade, como unha falta de concienciación de institucións culturalmente pertinentes ou sobre a caída en especie de paxaros. Utilizo TeamUp para formar equipos baseados nos intereses de tema dos estudantes. Distribúo un informe de deseño a cada equipo, iso suxire que o xogo de geolocation debería ser apropiado para estudantes que son un grao máis baixo que os estudantes da miña clase. Cada equipo ten o descanso da clase para brainstorm as regras do xogo. Presento unhas cantas plataformas game easy-to-use que os equipos poden usar para os seus xogos. "
Dream_i1.save
I18n.locale = "en"

Reflect_i1 = ActivityInstance.create(
name: "Reflect",
description: "Teams reflect about the changes they introduced to the design brief and what they are planning to do next. They also discuss the challenges they foresee."
)

I18n.locale = "gl"
Reflect_i1.name = "Reflexionar"
Reflect_i1.description = "Equipos reflexionan sobre os cambios que introducían no informe de deseño e o que están a planear facer logo. Tamén discuten os retos que prevén."
Reflect_i1.save
I18n.locale = "en"

Explore_i1 = ActivityInstance.create(
name: "Explore",
description: "Each team has as homework to find and test several games, making note of their game mechanics and what in their opinion works and what does not. I remind the teams that each team will present their game idea to experts and the younger students in the middle of the course. Each team record a reflection about their findings."
)

I18n.locale = "gl"
Explore_i1.name = "Explorar"
Explore_i1.description = "Cada equipo ten como deberes para atopar e examinar varios xogos, anotando a súa mecánica game e o que na súa opinión funciona e que non fai. Recordo aos equipos que cada equipo presentará a súa idea game a expertos e os estudantes máis novos no medio do curso. Cada rexistro de equipo unha reflexión sobre os seus descubrimentos."
Explore_i1.save
I18n.locale = "en"

CreateGame.activity_instances << Dream_i1
CreateGame.activity_instances << Reflect_i1
CreateGame.activity_instances << Explore_i1

I18n.locale = "en"
DesignBrief = Activity.create(
name: "Design Brief",
description: "You present an initial design brief to the students that ties the design tasks to the curriculum topics, but leaves some aspects open for refinement. During this lesson, you also provide the students with the motivation for and explain the responsibility they will carry for being involved. Students form teams, discuss, question and familiarize themselves with the brief. They refine their design brief context, particularly in relation of who/what they are designing for, initial design challenges and possible design results. Students record a reflection, set up a blog for their documentation, and start their documentation."
)
I18n.locale = "gl"
DesignBrief.name = ""
DesignBrief.description = ""
