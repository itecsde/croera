# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Creates interactions
I18n.locale = "en"
student_teacher_interaction = Interaction.create(
name: "1 to 1 student-teacher"
)
I18n.locale = "gl"
student_teacher_interaction.name = "1 a 1 estudante-profesor"
student_teacher_interaction.save
I18n.locale = "es"
student_teacher_interaction.name = "1 a 1 estudiante-profesor"
student_teacher_interaction.save

I18n.locale = "en"
student_student_interaction = Interaction.create(
name: "1 to 1 student-student"
)
I18n.locale = "gl"
student_student_interaction.name = "1 a 1 estudante-estudante"
student_student_interaction.save
I18n.locale = "es"
student_student_interaction.name = "1 a 1 estudiante-estudiante"
student_student_interaction.save

I18n.locale = "en"
one_to_many_interaction = Interaction.create(
name: "1 to many"
)
I18n.locale = "gl"
one_to_many_interaction.name = "1 a moitos"
one_to_many_interaction.save
I18n.locale = "es"
one_to_many_interaction.name = "1 a muchos"
one_to_many_interaction.save

I18n.locale = "en"
individual_interaction = Interaction.create(
name: "Individual"
)
I18n.locale = "gl"
individual_interaction.name = "Individual"
individual_interaction.save
I18n.locale = "es"
individual_interaction.name = "Individual"
individual_interaction.save

I18n.locale = "en"
group_based_interaction = Interaction.create(
name: "Group based"
)
I18n.locale = "gl"
group_based_interaction.name = "Baseada en grupo"
group_based_interaction.save
I18n.locale = "es"
group_based_interaction.name = "Basada en grupo"
group_based_interaction.save


I18n.locale = "en"
classroom_based_interaction = Interaction.create(
name: "Classroom based"
)
I18n.locale = "gl"
classroom_based_interaction.name = "Baseada na clase"
classroom_based_interaction.save
I18n.locale = "es"
classroom_based_interaction.name = "Basada en la clase"
classroom_based_interaction.save

# Creates tags
I18n.locale = "en"
collaboration_tag = Tag.create(
name: "collaboration"
)
I18n.locale = "gl"
collaboration_tag.name = "colaboración"
collaboration_tag.save
I18n.locale = "es"
collaboration_tag.name = "colaboración"
collaboration_tag.save

I18n.locale = "en"
itec4_tag = Tag.create(
name: "iTEC cycle 4"
)
I18n.locale = "gl"
itec4_tag.name = "iTEC ciclo 4"
itec4_tag.save
I18n.locale = "es"
itec4_tag.name = "iTEC ciclo 4"
itec4_tag.save

I18n.locale = "en"
itec3_tag = Tag.create(
name: "iTEC cycle 3"
)
I18n.locale = "gl"
itec3_tag.name = "iTEC ciclo 3"
itec3_tag.save
I18n.locale = "es"
itec3_tag.name = "iTEC ciclo 3"
itec3_tag.save



# Creates iTEC activities
I18n.locale = "gl"

Dream = Activity.create(
icon: 'dream.png', 
timeToComplete: '1',
name: 'Soñar',
locale: 'gl', 
description: 'Ti presentas un borrador de deseño á túa clase vinculado ao curriculum e á comunidade local, pero deixas certo marxe para a interpretación. Ti inspiras aos estudantes, motivándoos para que dean o mellor de si mesmos, comentándolles que teñen liberdade sobre a tarefa encomendada, e que a propiedade intelectual do resultado será deles. Ti presentas un proceso de realización de actividades educativas, así como unha planificación temporal das mesmas, e negocias os criterios de avaliación coa clase. Os estudantes forman equipos, discuten, fan preguntas, e familiarízanse co borrador de deseño. Os equipos refinan o seu borrador de deseño, tendo especialmente en conta aspectos tales como: para quen están a deseñar, que retos de deseño están presentes inicialmente, e que posibles resultados do deseño pode haber. Os estudantes gravan as súas reflexións e documentan o seu traballo de maneira online.',
status: 'class',
trace_id: nil,
trace_version: 1
)
Dream.reload
Dream.trace_id = Dream.id
Dream.save
Dream.interaction = individual_interaction
# Teacher motivations
teacher_motivations = Box.create(
  box_type: "left_half_box",
  position: 1
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "O profesor pode esperar...",
  position: 1
)
I18n.locale = "en"
text.content = "You may look forward to"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "Motivar aos alumnos deixándoos dar forma á súa propia tarefa.",
  position: 1
)
I18n.locale = "en"
text.content = "Motivate students by letting them shape their own task"
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Motivar aos alumnos deixándolles certo grao de liberdade e propiedade do seu traballo.",
  position: 2
)
I18n.locale = "en"
text.content = "Motivate students by giving them a certain degree of freedom and ownership of their work"
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Utilizar ferramentas non familiares.",
  position: 2
)
I18n.locale = "en"
text.content = "Using unfamiliar tools"
text.save
I18n.locale = "gl"
itemize.texts << text
header.save
teacher_motivations.components << header
teacher_motivations.components << itemize
Dream.boxes << teacher_motivations
# Learner motivations
learner_motivations = Box.create(
  box_type: "right_half_box",
  position: 2
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Os estudantes poden aprender...",
  position: 1
)
I18n.locale = "en"
text.content = "Students may learn"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "Comprometerse seriamente nun deseño mentalmente esixente.",
  position: 1
)
I18n.locale = "en"
text.content = "Seriously commit themselves to thoughtful design."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Negociar obxectivos e criterios de avaliación.",
  position: 2
)
I18n.locale = "en"
text.content = "Negotiate on goals and assessment criteria."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Cuestionar e mellorar tarefas dadas.",
  position: 2
)
I18n.locale = "en"
text.content = "Question and improve given tasks."
text.save
I18n.locale = "gl"
itemize.texts << text

learner_motivations.components << header
learner_motivations.components << itemize
Dream.boxes << learner_motivations
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
Dream.boxes << horizontal_rule_box
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
  content: "Liñas de guía",
  position: 1
)
I18n.locale = "en"
text.content = "Guidelines"
text.save
I18n.locale = "gl"
header.texts << text
guidelines_header_box.components << header
Dream.boxes << guidelines_header_box
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
  content: "1. Preparación",
  position: 1
)
I18n.locale = "en"
text.content = "1. Preparation"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "Prepara un borrador de deseño, escollendo unha Historia Educativa e axustándoa aos requirimentos do curriculum e ao horario escolar.",
  position: 1
)
I18n.locale = "en"
text.content = "Prepare a design brief, by choosing a Learning Story and adjusting it to match curriculum requirements and school schedule."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: 'Planifica as Actividades Educativas do proceso de deseño, e asigne as datas relevantes para dito proceso. As actividades de deseño pódense demorar inesperadamente. Inclúe unha lección "comodín" adicional á planificación do curso.',
  position: 2
)
I18n.locale = "en"
text.content = "Plan and schedule the Learning Activities of the entire design process. Design activities can cause unexpected delay. Include a buffer lesson to the course schedule."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: 'Durante a preparación ti tes a oportunidade de expandir as túas competencias e de gañar experiencia, por exemplo, localizando exemplos concretos que mostren por que é importante facer un deseño detallado dos resultados.',
  position: 3
)
I18n.locale = "en"
text.content = "Through preparation you have the opportunity to expand your competence and expertise, for example, by locating concrete examples that show why it is important to design thoughtful outcomes."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: 'Prepara unha lista de criterios de avaliación que reflicta os requirimentos do plan de estudos.',
  position: 4
)
I18n.locale = "en"
text.content = "Prepare an initial list of assessment criteria that reflect the curriculum requirements."
text.save
I18n.locale = "gl"
itemize.texts << text
guidelines_preparation_box.components << header
guidelines_preparation_box.components << itemize
Dream.boxes << guidelines_preparation_box
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
  content: "2. Introducción",
  position: 1
)
I18n.locale = "en"
text.content = "2. Introduction"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: 'Presenta o teu borrador de deseño, exemplos, todas as actividades, e a planificación temporal á túa clase.',
  position: 1
)
I18n.locale = "en"
text.content = "Present your design brief, examples, all activities and your schedule to your class"
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: 'Asegúrate de que todo o mundo se implica, presentando o borrador de deseño como un obxetivo colectivo que ten que ver co contexto persoal dos estudantes.',
  position: 2
)
I18n.locale = "en"
text.content = "Ensure that everyone is on board by rendering the design brief as a shared goal that relates to the students’ personal context."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: 'Discute os teus criterios de avaliación cos estudantes e pódevos de acordo sobre os mesmos.',
  position: 3
)
I18n.locale = "en"
text.content = "Discuss your assessment criteria with the students and agree on them."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: 'Forma equipos de 4 ou 5 estudantes. Podes solicitar aos estudantes que definan roles iniciais. Para máis información podes consultar a Actividade "Traballo de grupo". Forma os equipos con coidado para así evitar o parasitismo.',
  position: 4
)
I18n.locale = "en"
text.content = "Form teams of 4 to 5 students. You may ask the learners to define initial roles. More info: Learning Activity “Teamwork”. Careful consideration of team formations to prevent free-riding."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: 'Podes compartir o teu borrador de deseño con outros profesores no sistema AREA.',
  position: 5
)
I18n.locale = "en"
text.content = "You may reach people beyond the classroom by being proactive about sharing your design brief with other teachers through the iTEC facebook group and the iTEC teacher community."
text.save
I18n.locale = "gl"
itemize.texts << text
guidelines_introduction_box.components << header
guidelines_introduction_box.components << itemize
Dream.boxes << guidelines_introduction_box
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
  content: "3. Desenrolo",
  position: 1
)
I18n.locale = "en"
text.content = "3. Development"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "Mentres os equipos de estudantes discuten sobre que van deseñar e sobre como refinar o borrador de deseño, formula preguntas aos estudantes que lles axuden a elaborar as súas eleccións.",
  position: 1
)
I18n.locale = "en"
text.content = "As the student teams discuss what they will design and how to refine the design brief prompt individual teams with questions that support them to elaborate their choices."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Anima os estudantes a cuestionar o teu borrador de deseño. Failles preguntas abertas, tales como: para quen é o deseño, como podes descubrir cousas sobre a xente para a que estás deseñando, que retos estades asumindo e como os asumides, quen e o responsable de cada cousa, como presentariades o voso proceso creativo e o voso deseño.",
  position: 2
)
I18n.locale = "en"
text.content = "Encourage students to question your design brief. Ask them open ended questions, such as (a) Who is the design for? (b) How can you find out about the people you are designing for? (c) What challenge are you addressing and how? (d) Who is responsible for what? (e) How would you present your creation process and your design?"
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "A confusión inicial forma parte da beleza de deseño. Non é preciso dar resposta a todas as preguntas de maneira inmediata. Ti e os teus estudantes encontraredes as respostas pouco a pouco.",
  position: 3
)
I18n.locale = "en"
text.content = "Initial confusion is part of the beauty of design. There is no need to answer all questions right away. You and the students will figure out the answers as you go along."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Dirixe aos equipos para que atopen destinatarios concretos para os deseños que planean crear.",
  position: 4
)
I18n.locale = "en"
text.content = "Coach the teams to find a specific audience for the designs they plan to create."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Exercita a túa experiencia educativa, e saca os estudantes da súa zona de confort en caso de que detectes o tema proposto non representa un desafío para eles.",
  position: 5
)
I18n.locale = "en"
text.content = "Exercise your educational expertise, and push students beyond their comfort zones, if you notice that the topic is not challenging enough."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Axuda aos estudantes con exemplos en caso de quedaren atascados.",
  position: 6
)
I18n.locale = "en"
text.content = "Support the students with examples in case they get stuck."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Anima aos estudantes experimentados a compartir o seu coñecementos con todos os equipos. Por exemplo, pedíndolles que graven mensaxes para outros estudantes empregando TeamUp, ou asignando aos estudantes experimentados o rol de profesores axudantes.",
  position: 7
)
I18n.locale = "en"
text.content = "Encourage experienced students to share their knowledge across all teams. For example, asking them to record messages for others using TeamUp, or assigning experienced students to perform the role of assistant teachers, who help others."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: 'Os estudantes gravan unha reflexión (ver a actividade "Reflexionar"). Explícalles que as gravacións xogan un papel importante na súa avaliación e sirven para recibir feedback de ti, de outros equipos, dos seus pais, e da xente para a que están a deseñar.',
  position: 8
)
I18n.locale = "en"
text.content = "Students record a reflection (see reflection activity). Explain that the recordings play an important role in their assessment and in receiving feedback from you, other teams, parents and the people they are designing for."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: 'Cada equipo configura un blog do proxecto e envíache a súa URL. No blog, os equipos describen o seu proxecto e o seu borrador de deseño (xa despois do refinamento inicial). Postean bosquexos iniciais sobre o que están planeando deseñar.',
  position: 9
)
I18n.locale = "en"
text.content = "Beyond school: Each team sets up a project blog (or comparable service) and send the URL to you and to the iTEC facebook group. On the blog, the teams describe their project and refined design brief. They post initial sketches of what they are planning to design."
text.save
I18n.locale = "gl"
itemize.texts << text
guidelines_development_box.components << header
guidelines_development_box.components << itemize
Dream.boxes << guidelines_development_box
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
  content: "4. Avaliación",
  position: 1
)
I18n.locale = "en"
text.content = "4. Assessment"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "Revisa o traballo de cada equipo, as súas gravacións de reflexións e as entradas no blog. Despois grava feedback en formato audiovisual para eles. O teu feedback pode incluír suxestións e preguntas.",
  position: 1
)
I18n.locale = "en"
text.content = "Review the work of each team, their reflection recordings and blog entries, then record audiovisual feedback for them. Your feedback might include suggestions and questions."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Podes avaliar a habilidade dos estudantes para cuestionar a tarefa que se lles propón, particularmente os motivos dados para introducir cambios.",
  position: 2
)
I18n.locale = "en"
text.content = "You could assess the students’ ability to question the task provided to them, in particular their grounds for introducing changes."
text.save
I18n.locale = "gl"
itemize.texts << text
guidelines_assessment_box.components << header
guidelines_assessment_box.components << itemize
Dream.boxes << guidelines_assessment_box

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
Dream.boxes << horizontal_rule_box
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
  content: "Ideas para empregar tecnoloxía",
  position: 1
)
I18n.locale = "en"
text.content = "Ideas for using technology"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "Requirida: reflexión.",
  position: 1
)
I18n.locale = "en"
text.content = "Required: reflection"
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Importante: formación do equipo, edición colaboradora, publicación.",
  position: 2
)
I18n.locale = "en"
text.content = "Important: team building, collaborative edition, publication."
text.save
I18n.locale = "gl"
itemize.texts << text
text = Text.create(
  content: "Desexable: Utilizar blogs.",
  position: 3
)
I18n.locale = "en"
text.content = "Nice to have: using blogs."
text.save
I18n.locale = "gl"
itemize.texts << text
ideas_box.components << header
ideas_box.components << itemize
Dream.boxes << ideas_box


I18n.locale = "en"

Dream.name = "Dream"

Dream.description = "You present a design brief to your class that ties to the curriculum and the local community, but leaves room for interpretation. You inspire the students by providing them with the motivation for giving their best and by telling them about the ownership and freedom over the task. You present the learning activities process and your schedule, and negotiate the assessment criteria with the class. Students form teams, discuss, question and familiarize themselves with the design brief. The teams refine their design brief, particularly in relation to whom they are designing for, initial design challenges and possible design results. Students record reflections and document their work online."

Dream.save

I18n.locale = "gl"



Explore = Activity.create(
icon: 'explore.png', 
timeToComplete: '2',
name: 'Explorar',
locale: 'gl', 
description: 'Os equipos de estudantes explorar o contexto do seu deseño tanto mediante a observación de prácticas e ámbitos relevantes empregando cámaras dixitais, portátiles e micrófonos, como mediante a procura de traballos existentes que estean relacionados co seu borrador de deseño (recollendo exemplos similares ao que están tratando de deseñar). O obxecto da observación depende de a quen vai dirixido o deseño, de que é o que están a deseñar, e de cales son os retos iniciais que pretender abordar. Os estudantes comparten os arquivos multimedia recollidos nos seus blogues e gravan unha reflexión. Ti guías a súa procura e axúdalos la cualificación do seu material. Ten en conta que ver e cualificar material de vídeo pode levar moito tempo. Gastar tempo en ver vídeos que conteñen información imprecisa, é un pequeno rodeo que pode propiciar unha valiosa conversación sobre a aparencia de unha fonte inválida, así como una experiencia en primeira persoa sobre ese particular para os estudantes. Algúns estudantes, por exemplo os máis novos, poden necesitar ser guiados de maneira máis detallada para que leven a cabo esa actividade.',
status: 'class',
trace_version: 1
)
Explore.reload
Explore.trace_id = Explore.id
Explore.save

# Add interaction
Explore.interaction = group_based_interaction

# Add tags
Explore.tags << itec4_tag

# Teacher motivations
teacher_motivations = Box.create(
  box_type: "left_half_box",
  position: 1
)

header = Component.create(
  component_type: "header",
  position: 1
)

text = Text.create(
  content: "O profesor pode esperar...",
  position: 1
)
I18n.locale = "en"
text.content = "You may look forward to..."
text.save
I18n.locale = "gl"
header.texts << text

itemize = Component.create(
  component_type: "itemize",
  position: 2
)

text = Text.create(
  content: "Conectar a escola e os estudantes coa comunidade enviándoos a facer observacións fóra da escola.",
  position: 1
)
I18n.locale = "en"
text.content = "Connecting school and students with their community sending them to observe outside of school."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Conseguir que os alumnos utilicen todos os seus sentidos.",
  position: 2
)
I18n.locale = "en"
text.content = "Engage students to use all of their senses."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Utilizar novas ferramentas.",
  position: 3
)
I18n.locale = "en"
text.content = "Using novel tools."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Encontrar ducias de deseños innovadores procedentes de calquera parte do mundo.",
  position: 4
)
I18n.locale = "en"
text.content = "Finding dozens of innovative designs from around the world."
text.save
I18n.locale = "gl"
itemize.texts << text

teacher_motivations.components << header
teacher_motivations.components << itemize
Explore.boxes << teacher_motivations

# Learner motivations
learner_motivations = Box.create(
  box_type: "right_half_box",
  position: 2
)

header = Component.create(
  component_type: "header",
  position: 1
)

text = Text.create(
  content: "Os estudantes poden aprender...",
  position: 1
)
I18n.locale = "en"
text.content = "Students may learn"
text.save
I18n.locale = "gl"
header.texts << text

itemize = Component.create(
  component_type: "itemize",
  position: 2
)

text = Text.create(
  content: "Observar e gravar fenómenos naturais e xente.",
  position: 1
)
I18n.locale = "en"
text.content = "Observe and record natural phenomena and/or people."
text.save
I18n.locale = "es"
text.content = "Observar y registrar los fenómenos naturales y/o personas."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Amosar empatía.",
  position: 2
)
I18n.locale = "en"
text.content = "Empathize with others."
text.save
I18n.locale = "es"
text.content = "Empatizar con otros."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Identificar retos de deseño.",
  position: 3
)
I18n.locale = "en"
text.content = "Identify real world design challenges."
text.save
I18n.locale = "es"
text.content = "Identificar retos en los diseños del mundo real."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Cuestionar e mellorar as tarefas que se lles dan.",
  position: 4
)
I18n.locale = "en"
text.content = "Question and improve tasks given to them."
text.save
I18n.locale = "es"
text.content = "Preguntar y mejorar las tareas que se les dan."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Encontrar e evaluar deseños procedentes de varios campos.",
  position: 5
)
I18n.locale = "en"
text.content = "Find and evaluate designs of various fields."
text.save
I18n.locale = "es"
text.content = "Encontrar y evaluar diseños de varios campos."
text.save
I18n.locale = "gl"
itemize.texts << text

learner_motivations.components << header
learner_motivations.components << itemize
Explore.boxes << learner_motivations

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
Explore.boxes << horizontal_rule_box

# Guidelines
guidelines_header_box = Box.create(
  box_type: "full_box",
  position: 4
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "Guía",
  position: 1
)
I18n.locale = "en"
text.content = "Guidelines"
text.save
I18n.locale = "es"
text.content = "Guía"
text.save
I18n.locale = "gl"
header.texts << text

guidelines_header_box.components << header
Explore.boxes << guidelines_header_box

# Guidelines preparation
guidelines_preparation_box = Box.create(
  box_type: "left_half_box",
  position: 5
)
header = Component.create(
  component_type: "header",
  position: 1
)
text = Text.create(
  content: "1. Preparación",
  position: 1
)
I18n.locale = "en"
text.content = "1. Preparation"
text.save
I18n.locale = "es"
text.content = "1. Preparación"
text.save
I18n.locale = "gl"
header.texts << text

itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "Escoite coidadosamente os comentarios de estudantes, e dea forma á actividade de acordo coas súas necesidades e intereses.",
  position: 1
)
I18n.locale = "en"
text.content = "Listen carefully to the student comments, and shape the activity according to their needs and interests."
text.save
I18n.locale = "es"
text.content = "Escuche con atención los comentarios de los estudiantes, y dar forma a la actividad de acuerdo con sus necesidades e intereses."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Amplía as túas competencias e a túa experiencia, atopando recursos online, lugares e eventos onde poder levar a cabo observacións, ou tamén xente que podería ser entrevistada por cada equipo.",
  position: 2
)
I18n.locale = "en"
text.content = "Expand your competence and expertise, by identifying online resources, locations and events where observation can be carried out, or people that could be interviewed for each team. See: ‘Design Inspiration for School’"
text.save
I18n.locale = "es"
text.content = "Ampliar su competencia y experiencia, mediante la identificación de los recursos en línea, lugares y eventos donde la observación se pueden llevar a cabo, o las personas que podrían ser entrevistadas para cada equipo. Véase: 'Diseño La inspiración para la escuela'"
text.save
I18n.locale = "gl"
itemize.texts << text


guidelines_preparation_box.components << header
guidelines_preparation_box.components << itemize
Explore.boxes << guidelines_preparation_box

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
  content: "2. Introducción",
  position: 1
)
I18n.locale = "en"
text.content = "2. Introduction"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)
text = Text.create(
  content: "Descríbelle a actividade aos estudantes e dálles inspiración mostrándolles recursos online.",
  position: 1
)
I18n.locale = "en"
text.content = "Describe the activity to the students and inspire them by showing online resources that they could browse through."
text.save
I18n.locale = "es"
text.content = "Describa la actividad a los estudiantes e inspirarlos, mostrando los recursos en línea que puedan navegar a través."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Asegúrate de que todos os equipos saiban que tipo de exemplos han de procurar, que observar e onde observar.",
  position: 2
)
I18n.locale = "en"
text.content = "Ensure that all teams know what kind of examples they are looking for, what to observe and where."
text.save
I18n.locale = "es"
text.content = "Asegúrese de que todos los equipos saben qué tipo de ejemplos que están buscando, qué observar y dónde."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Descríbelle a actividade aos estudantes e dálles inspiración mostrándolles lugares onde poidan realizar observacións.",
  position: 3
)
I18n.locale = "en"
text.content = "Describe the activity to the students and inspire them by showing locations where observations can be carried out."
text.save
I18n.locale = "es"
text.content = "Describa la actividad a los estudiantes e inspirarlos, mostrando los lugares donde las observaciones se pueden realizar."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Comproba que cada equipo dispón de cámaras, cadernos de notas, micrófonos, etc.",
  position: 4
)
I18n.locale = "en"
text.content = "Check that each team is equipped with cameras, notebooks, microphones etc."
text.save
I18n.locale = "es"
text.content = "Compruebe que cada equipo está equipado con cámaras, portátiles, micrófonos, etc"
text.save
I18n.locale = "gl"
itemize.texts << text

guidelines_introduction_box.components << header
guidelines_introduction_box.components << itemize
Explore.boxes << guidelines_introduction_box
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
  content: "3. Desenrolo",
  position: 1
)
I18n.locale = "en"
text.content = "3. Development"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)

text = Text.create(
  content: "Os equipos planifican canto tempo queren pasar buscando, avaliando e comparando. Diríxeos e enséanos sobre a xestión do tempo.",
  position: 1
)
I18n.locale = "en"
text.content = "Teams plan how much time they want to spend searching, evaluating and comparing. Coach them by remind them about time management."
text.save
I18n.locale = "es"
text.content = "Equipos planificar cuánto tiempo quieren pasar búsqueda, evaluación y comparación. El entrenador les recordarles acerca de la gestión del tiempo."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Os equipos buscan deseños similares e discuten sobre eles. Seleccionan os 10 exemplos mais relevantes para os seus proxectos. Axúdaos dándolles recursos e exemplos relevantes en caso de que se atasquen.",
  position: 2
)
I18n.locale = "en"
text.content = "Teams search for comparable designs and discuss them. They select the 10 examples that are most relevant to their project. Support them with resources and relevant examples in case they get stuck."
text.save
I18n.locale = "es"
text.content = "Equipos búsqueda de diseños similares y discutirlas. Seleccionan los 10 ejemplos que son más relevantes para su proyecto. Apoyar con recursos y ejemplos pertinentes en caso de que se atascan."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Os estudantes realizan observacións en equipos ou individualmente. Diríxeos e axúdaos a facer observacións significativas.",
  position: 3
)
I18n.locale = "en"
text.content = "Students perform observations in teams or individually. Coach and support them to find meaningful observations."
text.save
I18n.locale = "es"
text.content = "Los estudiantes realizan observaciones en equipos o individualmente. El entrenador y los apoyan para encontrar observaciones significativas."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "The learning activities culminate towards a design. Some students may be overwhelmed by the multitude and quality of benchmarked examples and find it difficult to proceed productively. Remind them that many examples they see are made by companies with large budgets.",
  position: 4
)
I18n.locale = "en"
text.content = "Students perform observations in teams or individually. Coach and support them to find meaningful observations."
text.save
I18n.locale = "es"
text.content = "Las actividades de aprendizaje culminará hacia un diseño. Algunos estudiantes pueden sentirse abrumados por la gran cantidad y calidad de ejemplos como punto de referencia y les resulta difícil proceder de manera productiva. Recuérdeles que muchos ejemplos que ven son fabricados por empresas con grandes presupuestos."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "En caso de que a conexión a Internet sexa lenta trata de planificar temporalmente as conexións para cada equipo e así evitar as conxestións de tráfico. Comproba se algúns equipos poden realizar a súa actividade fóra da escola, empregando a conexión a Internet das súas casas, ou en bibliotecas públicas.",
  position: 5
)
I18n.locale = "en"
text.content = "Slow Internet connection? Try to schedule the use of the Internet for each team to avoid Internet traffic congestion. See if some teams could perform their activity beyond school,  using the Internet connection of their homes, after school clubs, or public libraries."
text.save
I18n.locale = "es"
text.content = "Reduzca la velocidad de conexión a Internet? Trate de programar el uso de Internet por cada equipo para evitar la congestión de tráfico en Internet. A ver si algunos equipos pueden desarrollar su actividad después de la escuela, utilizando la conexión a Internet de sus hogares, después de clubes escolares o bibliotecas públicas."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Os equipos visualizan e anotan os seus arquivos de audio ou vídeo recollidos.",
  position: 6
)
I18n.locale = "en"
text.content = "Teams view and annotate their collected media files."
text.save
I18n.locale = "es"
text.content = "Equipos ver y anotar sus recogidas archivos multimedia."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Os equipos gravan unha reflexión. Esta reflexión pode ser empregada para compartir as súas ideas cos outros equipos.",
  position: 7
)
I18n.locale = "en"
text.content = "Teams record a reflection. This reflection can be used for sharing their ideas with other teams."
text.save
I18n.locale = "es"
text.content = "Equipos grabar una reflexión. Esta reflexión se puede utilizar para compartir sus ideas con otros equipos."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Os equipos crean entradas nos blogues sobre os seus descubrimentos, incluíndo debuxos das ideas de deseño. Os equipos poden encontrar máis información relevante, por exemplo visitando unha biblioteca ou navegando por Internet.",
  position: 8
)
I18n.locale = "en"
text.content = "Beyond school: Teams post their findings to their blogs, including drawings of design ideas. Teams may identify more relevant information, for example by visiting a library or by browsing the Internet."
text.save
I18n.locale = "es"
text.content = "Más allá de la escuela: Equipos publicar sus hallazgos en sus blogs, incluyendo dibujos de ideas de diseño. Los equipos pueden identificar la información más relevante, por ejemplo al visitar una biblioteca o navegar por Internet."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Pídelles que avalíen criticamente a actividade e o seu valor en canto a aprendizaxe na escola. Logo, os estudantes deben gravar unha reflexión.",
  position: 9
)
I18n.locale = "en"
text.content = "Teachers found that this activity presents an opportunity for reflecting about the pros and cons of using ICT tools in school. Why not try the same with your students? Ask your students to critically assess the activity and their value to school learning. Then, the students record a reflection."
text.save
I18n.locale = "es"
text.content = "Los profesores encontraron que esta actividad representa una oportunidad para reflexionar sobre los pros y los contras del uso de las herramientas TIC en la escuela. ¿Por qué no intentar lo mismo con sus alumnos? Pida a sus estudiantes para evaluar críticamente la actividad y su valor para el aprendizaje escolar. A continuación, los alumnos que registren una reflexión."
text.save
I18n.locale = "gl"
itemize.texts << text

guidelines_development_box.components << header
guidelines_development_box.components << itemize
Explore.boxes << guidelines_development_box
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
  content: "4. Avaliación",
  position: 1
)
I18n.locale = "en"
text.content = "4. Assessment"
text.save
I18n.locale = "gl"
header.texts << text
itemize = Component.create(
  component_type: "itemize",
  position: 2
)

text = Text.create(
  content: "Revisa o traballo de cada equipo, as súas gravacións de reflexións e as entradas nos blogues. Logo grava feedback audiovisual para eles. O teu feedback pode incluír suxestións e preguntas.",
  position: 1
)
I18n.locale = "en"
text.content = "Review the work of each team, their reflection recordings and blog entries, then record audiovisual feedback for them. Your feedback might include suggestions and questions."
text.save
I18n.locale = "es"
text.content = "Revisar el trabajo de cada equipo, sus grabaciones reflexión y entradas de blog, a continuación, registrar información audiovisual para ellos. Sus comentarios podrían incluir sugerencias y preguntas."
text.save
I18n.locale = "gl"
itemize.texts << text

text = Text.create(
  content: "Ti poderías avaliar a amplitude dos exemplos encontrados, así como a habilidade dos equipos para encontrar exemplos relacionados cos seus borradores de deseño.",
  position: 1
)
I18n.locale = "en"
text.content = "You could assess the breadth of identified examples and the teams’ ability to identify examples that are related to their design briefs."
text.save
I18n.locale = "es"
text.content = "Se podría evaluar la amplitud de ejemplos identificados y la capacidad de los equipos para identificar ejemplos que están relacionados con sus diseños."
text.save
I18n.locale = "gl"
itemize.texts << text

guidelines_assessment_box.components << header
guidelines_assessment_box.components << itemize
Explore.boxes << guidelines_assessment_box


# Add technical motivations
I18n.locale = "en"

I18n.locale = "gl"

I18n.locale = "es"


I18n.locale = "en"


I18n.locale = "en"


I18n.locale = "en"

Explore.name = "Explore"

Explore.description = "Student teams explore the context of their design either by observing relevant practices or environments using digital cameras, notebooks and microphones, or by searching existing works that relate to their design brief by collecting examples similar to that which they are intending to design. The object of observation depends on who they are designing for, what they are designing and the initial challenges they want to address. They share their collected media files on their blogs and record a reflection. You guide their search and support them in the qualification of their material. Note that viewing and qualifying video material can be time consuming. Spending time viewing videos that contain inaccurate information, can be a detour from which a pedagogically meaningful conversation may arise, and may provide students with a first-hand experience about the appearance of an invalid source. Some students, for example younger ones, may need more guidance in performing this activity."

Explore.save




I18n.locale = "gl"

#Mapa

Mapa = Activity.create(

timeToComplete: '1',

name: 'Mapa',

locale: 'gl',

description: 'Os equipos analizan os seus descubrimentos usando mapas mentais. Identifican relacións, similitudes e diferenzas entre os exemplos e os arquivos audivisuais que recolleron. Baseándose na información recollida, os equipos refinan o seu borrador de deseño, especialmente os desafíos do deseño, os resultados do deseño e o público. Logo os equipos gravan unha reflexión. As preguntas abertas poden resultar difíciles de responder inicialmente polos alumnos. Sen embargo, unha vez pasado o limiar, é moi probable que os estudantes teñan ideas inspiradoras.',
status: 'class',
trace_version: 1
)
Mapa.reload
Mapa.trace_id = Mapa.id
Mapa.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Actividade práctica e visual que usa información e datos recollidos..",

position: 1

)

I18n.locale = "en"

text.content = "Hands-on active and visual engagement with collected information and data."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Análise de datos progresiva.",

position: 2

)

I18n.locale = "en"

text.content = "Progressive data analysis."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Empregar novas ferramentas.",

position: 3

)

I18n.locale = "en"

text.content = "Using novel tools."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

Mapa.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Analizar información profesionalmente de maneira colaborativa.",

position: 1

)

I18n.locale = "en"

text.content = "To professionally analyze information collaboratively."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Profundar na comprensión do seu tema.",

position: 2

)

I18n.locale = "en"

text.content = "More in-depth understanding about their topic."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Atopar relacións entre descubrimentos.",

position: 3

)

I18n.locale = "en"

text.content = "To recognize relationships between findings."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

Mapa.boxes << learner_motivations

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

Mapa.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

Mapa.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Escoite detidamente os comentarios dos estudantes e dea forma á actividade de acordo ás súas necesidades e intereses.",

position: 1

)

I18n.locale = "en"

text.content = "Listen carefully to the student comments, and shape the activity according to their needs and interests."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Amplía as túas competencias e coñecementos explorando ferramentas de representación de mapas mentais (mind-mapping) dixitais, asegurando que os estudantes poidan engadir ficheiros media á ferramenta de forma doada.",

position: 2

)

I18n.locale = "en"

text.content = "Expand your competence and expertise, by exploring digital mind-mapping tools and ensuing students can easily add their media files to the tool."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Proporciona lapis, papel, notas post-it, celo, tesoiras e pegamento. Prepara a aula para que os estudantes se poidan reunir en grupos e pegar as súas notas de papel nas paredes ou en taboleiros.",

position: 3

)

I18n.locale = "en"

text.content = "Arrange pens, paper, post-it notes, tape, scissors and glue. Set up the space by arranging walls or large papers for students to group and stick their paper notes on."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

Mapa.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Mantén unha conversación cos estudantes sobre os datos que recolleron. Que recolleron? De que maneira a información recollida é significativa para o seu proxecto?',

position: 1

)

I18n.locale = "en"

text.content = "Engage in a pedagogically meaningful conversation with the students about the data they collected: What did they collect, and how is the information meaningful for their project?"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Para facilitar o acceso, pídelle aos estudantes que movan toda a información e os datos a unha mesma localización e que compartan esa localización co resto de estudantes.',

position: 2

)

I18n.locale = "en"

text.content = "For easy access, ask the students to move all of their information and data into one location and share it with everyone."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

Mapa.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Os estudantes escriben toda a información e datos a xeito de titulares ou frases curtas ou con debuxos en notas post-it ou en pequenos anacos de papel e agrupan as súas notas. De forma alternativa poden utilizar as ferramentas de representación en mapas mentais que ti configuraches. Diríxeos e ensínalles a mellor maneira de representar os seus descubrimentos: facendo as notas iniciais ou facendo recomendacións.",

position: 1

)

I18n.locale = "en"

text.content = "Students write all information and data in the form of headlines, short sentences or figures on post-it notes or small pieces of paper, and group their notes. Alternatively they may use the digital mind-mapping tool you set up. Coach them how to best represent some of their findings by drawing the initial notes or making supportive suggestions."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Axuda aos equipos a representar de forma visual as relacións entre as notas, por exemplo, debuxando liñas entre elas, situando notas de forma xerárquica ou noutras disposicións espaciais.",

position: 2

)

I18n.locale = "en"

text.content = "Support the teams to visually present relationships between the notes when grouping the data, for example, by drawing lines between information, placing notes hierarchically, or other spatial arrangements."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Mira e discute as relacións cos estudantes. Formula preguntas abertas para cuestionar as súas suposicións, por exemplo (a) cales son as semellanzas e as diferenzas entre os exemplos que encontraron?; (b) que necesidades adicionais podedes recoñecer?; (c) que che gustaría adoptar ou intentar?; (d) como farías o teu deseño único?; (e) precísase refinar o borrador de deseño? de que maneira precisa ser refinada?; (f) como se relaciona a exploración co deseño?; (g) que decisións de deseño se obterían da exploración?; (h) que ideas están xurdindo no proxecto?",

position: 3

)

I18n.locale = "en"

text.content = "View and discuss the relations with the students. Ask open ended questions to challenge their assumptions, for example, (a) what are the similarities and differences between the examples they found? (b) What additional challenges can you recognize?; (c) what would you like to adopt or try out? (d) what would make your design unique? (e) Does the design brief need refinement? How does it need to be refined?; (f) How does the exploration relate to the design? (g) What design decisions would result from the exploration? (f) What are emerging project ideas?"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Unha relación máis de corpo enteiro co mapa de ideas pódese conseguir mediante a agrupación espacial de ideas e información recollida. Isto podería ser de axuda para que os estudantes se concentrasen, xa que poderían estirar os seus brazos para situar unha nota post-it nunha localización específica adicada, por exemplo, aos desafíos.",

position: 4

)

I18n.locale = "en"

text.content = "A more full-body involvement of mapping ideas can be achieved through spatial grouping of ideas and collected information. This can might support learners to focus, as they can stretch their arms to place a post-it note to a specific location dedicated to e.g. challenges"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos enumeran as semellanzas e diferenzas identificadas e actualizan as súas propostas de deseño, os resultados de deseño e o público.",

position: 5

)

I18n.locale = "en"

text.content = "Teams list identified similarities and differences, and update their design briefs, particularly in relation to design challenges, design results and audience."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Documentan os seus descubrimento no seu blog, incluíndo esquemas de ideas emerxentes e gravan unha reflexión. Ti podes gravar unha reflexión para cada equipo dándolles feedback e valoracións do traballo de cada estudante. As súas reflexións poden ser empregadas para a avaliación e para estar concentrados na tarefa.",

position: 6

)

I18n.locale = "en"

text.content = "They document their findings on their blog, including sketches of emerging project ideas and record a reflection. You can record a reflection for each team providing feedback and evaluative comments to each student work. Their reflections can be used for assessment and for staying focussed on the task."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

Mapa.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Revisa o traballo de cada equipo, as súas reflexións e entradas no blog para asegurarte que todo o mundo explorou e recolleu exemplos e/ou ficheiros audiovisuais. Despois grava un feedback audiovisual para eles. O teu feedback podería incluír recomendacións e preguntas sobre o éxito da implementación da técnica, sobre como podería ser utilizada en proxectos futuros e como podería facerse mellor a próxima vez.",

position: 1

)

I18n.locale = "en"

text.content = "Review the work of each team, their reflection recordings and blog entries, to ensure everyone explored and collected examples and/or media files. Then record audiovisual feedback for them. Your feedback might include suggestions and questions about how successful the technique was implemented, how it could be used for future projects, and how it could be done better next time."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Poderías avaliar a habilidade dos equipos para identificar os desafíos do deseño, e para establecer relacións entre observacións e exemplos.",

position: 2

)

I18n.locale = "en"

text.content = "You could assess the teams’ ability to identify design challenges, to draw relationships between observations and examples"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Tamén poderías pedir aos estudantes que avaliasen as contribucións dos seus compañeiros de equipo, utilizando as devanditas puntuacións para axudarte a formar a túa propia avaliación.",

position: 3

)

I18n.locale = "en"

text.content = "You could also ask the students to grade their teammates’ contributions, using the student grades to help form your own assessment."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

Mapa.boxes << guidelines_assessment_box

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

Mapa.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Requerido: mapas mentais.",

position: 1

)

I18n.locale = "en"

text.content = "Required: mind-mapping."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ferramentas: post-it notes, Bubbl.us, CmapTools, Popplet, Mindmeister, Freemind, TeamUp, ReFlex.",

position: 2

)

I18n.locale = "en"

text.content = "Tools: post-it notes, Bubbl.us, CmapTools, Popplet, Mindmeister, Freemind, TeamUp, ReFlex."

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

Mapa.boxes << ideas_box

I18n.locale = "en"

Mapa.name = "Map"

Mapa.description = "Teams analyse their findings using mind-mapping techniques. They identify relations, similarities and differences between the examples and/or media files they collected. Based on their collected information and analysis, the teams refine their design brief, especially the design challenges, design results and audience. Then the teams record a reflection. Open ended questions can be challenging for students to answer initially. However, after passing the initial threshold, students are likely to have inspiring ideas."

Mapa.save




I18n.locale = "gl"

#Reflexionar

Reflexionar = Activity.create(

timeToComplete: '1',

name: 'Reflexionar',

locale: 'gl',

description: 'Os estudantes e o profesor gravan, crean entradas nos blogues e comparten reflexións en formato audiovisual, así como o feedback relativo ao progreso do proxecto, os desafíos e os próximos pasos a tomar. Os estudantes constrúen lentamente unha colección compartida de maneiras de afrontar desafíos, a cal pode ser empregada unha vez que o proxecto finalice.',
status: 'class',
trace_version: 1
)
Reflexionar.reload
Reflexionar.trace_id = Reflexionar.id
Reflexionar.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Revisar o progreso do equipo de forma rápida e cómoda.",

position: 1

)

I18n.locale = "en"

text.content = "Reviewing team progress quickly and comfortably."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Proporcionar feedback persoal aos equipos.",

position: 2

)

I18n.locale = "en"

text.content = "Providing personal feedback to teams."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Unha forma máis xusta de distribución de axuda máis alá da aula.",

position: 3

)

I18n.locale = "en"

text.content = "A more fair distribution of support beyond the classroom."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Pasar menos tempo gravando o feedback para os estudantes.",

position: 4

)

I18n.locale = "en"

text.content = "Spending less time recording feedback for students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Proporcionar aos estudantes feedback persoal a través de xestos, o ton de voz, información sobre o contexto (a túa casa, xardín etc.).",

position: 5

)

I18n.locale = "en"

text.content = "Providing students with personal feedback through gestures, tone of voice, background information (your home, garden etc.)."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Usar as gravacións para mellorar a comunicación cos pais sobre as actividades escolares.",

position: 6

)

I18n.locale = "en"

text.content = "Using the recordings to better communicate with parents about school activities."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Desenvolver unha colección de comentarios aos teus estudantes.",

position: 7

)

I18n.locale = "en"

text.content = "Developing a collection of comments to your students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Construír unha colección de reflexións feitas por estudantes.",

position: 8

)

I18n.locale = "en"

text.content = "Building a resource of reflections made by students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Usar novas ferramentas.",

position: 9

)

I18n.locale = "en"

text.content = "Using novel tools."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Desenvolver competencias técnicas, de xestión e pedagóxicas.",

position: 10

)

I18n.locale = "en"

text.content = "Develop technical, organizational and pedagogical competences."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Adquirir un repertorio do uso da reflexión para múltiples propósitos.",

position: 11

)

I18n.locale = "en"

text.content = "Acquire a repertoire of using reflection for multiple purposes."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

Reflexionar.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Resumir, comunicar, presentar e planificar o traballo que están a realizar.",

position: 1

)

I18n.locale = "en"

text.content = "To summarize, communicate, present and plan their work in progress."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Reflexionar sobre o seu traballo.",

position: 2

)

I18n.locale = "en"

text.content = "To reflect on their work."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Proporcionar e recibir críticas.",

position: 3

)

I18n.locale = "en"

text.content = "To provide and receive criticism."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

Reflexionar.boxes << learner_motivations

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

Reflexionar.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

Reflexionar.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Desenrola as súas competencias e coñecementos explorando con que frecuencia e quen reflexiona e proporciona feedback que podería ser utilizado na historia de aprendizaxe, e decidindo que ferramenta de reflexión queres configurar para ser empregada.",

position: 1

)

I18n.locale = "en"

text.content = "Develop your competence and expertise, by exploring how often and by whom reflection and feedback could be used in the learning story and by decide on the reflection tool that you would like to set up and use."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Antes de gravar outro feedback ou outra reflexión escoita a anterior.",

position: 2

)

I18n.locale = "en"

text.content = "Before recording another feedback or reflection listen to the previous one."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

Reflexionar.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Motiva aos estudantes para que reflexionen sobre o seu traballo, indicando os beneficios e as razóns para reflexionar. Por exemplo, podes indicar que é máis doado revisar os últimos pasos, retomar o fío despois dunha ausencia, ou recibir feedback directamente do profesor.',

position: 1

)

I18n.locale = "en"

text.content = "Motivate the students to reflect on their work by expressing the benefits and reasons for reflection, for example easier review of the last steps, catching up after an absence, receiving direct feedback from the teacher."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Dille aos teus estudantes que, en proxectos relacionados co deseño, reflexionar de forma regular pode axudar a progresar dende as ideas iniciais (que habitualmente non son demasiado boas) e tamén a desenvolver o sentimento de propiedade intelectual.',

position: 2

)

I18n.locale = "en"

text.content = "Tell your students that in design related learning projects, regular reflection can support letting go of initial, not very good, ideas and to develop the feeling of ownership."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

Reflexionar.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Os equipos reflexionan sobre o que fixeron, o que teñen pensado facer a continuación e sobre calquera dificultade que encontran ou prevén.",

position: 1

)

I18n.locale = "en"

text.content = "Teams reflect on what they did, what they plan to do and the challenges they encountered or can foresee."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "As primeiras reflexións poden resultar difíciles de gravar. Dirixe e ensina aos estudantes a superar o sentimento inicial de frustración e incomodidade. Podes estar seguro/a que despois de gravar unhas cantas reflexións comezaras a ver os froitos do teu investimento.",

position: 2

)

I18n.locale = "en"

text.content = "The first reflections may be difficult to record smoothly. Coach students to overcome initial feelings of frustration or inconvenience. Be assured, after recording a few reflections, you will start to recognize the value of your investment."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos escoitan as gravacións feitas por outros e gravan preguntas ou suxestións para eles. Diríxeos e axúdaos a realizar esta tarefa.",

position: 3

)

I18n.locale = "en"

text.content = "Teams listen to the recordings by others and record questions and tips for them. Coach and support them in doing so."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Escoita as gravacións e adapta o teu labor como profesor ás necesidades dos estudantes.",

position: 4

)

I18n.locale = "en"

text.content = "Listen to the recordings and adopt your teaching to the needs of the students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Grava feedback audiovisual para os equipos, incluíndo preguntas e suxestións que poden servir de inspiración aos equipos para pensar máis en profundidade sobre algunhas cuestións.",

position: 5

)

I18n.locale = "en"

text.content = "Record audio-visual feedback for the teams, including questions and suggestions that may inspire the teams to think further, based on the student reflections."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Podes invitar a expertos na materia a que graven feedback para os equipos de estudantes. O seu feedback pode servir de inspiración tamén para os estudantes dos anos vindeiros.",

position: 6

)

I18n.locale = "en"

text.content = "Experts may be invited to record feedback to the student teams. Their feedback is may become ubiquitous, and a source of inspiration for the students in the years to come."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

Reflexionar.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "A túa actividade de avaliación pode estar baseada na capacidade dos estudantes para escoitar e reaccionar aos comentarios construtivo, ou pode estar tamén baseada na profundidade e relevancia das súas reflexións.",

position: 1

)

I18n.locale = "en"

text.content = "You may assess based on the student’s ability to listen and react to your constructive comments, or based on the depth or relevance of their reflections."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

Reflexionar.boxes << guidelines_assessment_box

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

Reflexionar.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Requirido: reflexión audio/video.",

position: 1

)

I18n.locale = "en"

text.content = "Required: audio/video reflection."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ferramentas: TeamUp, ReFlex, Redpentool, Voicethread.",

position: 2

)

I18n.locale = "en"

text.content = "Tools: TeamUp, ReFlex, Redpentool, Voicethread"

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

Reflexionar.boxes << ideas_box

I18n.locale = "en"

Reflexionar.name = "Reflect"

Reflexionar.description = "Students and the teacher record, post and share audio-visual reflections and feedback of project progress, challenges and future steps. The students slowly build a shared collection of ways to tackle challenges, which can be used after the project ended."

Reflexionar.save

I18n.locale = "gl"

#Crear

Crear = Activity.create(

timeToComplete: '1',

name: 'Crear',

locale: 'gl',

description: '﻿Sobre a base do seu borrador de deseño (xa refinado) e as súas ideas para o deseño, os equipos de estudantes comezan a crear. Eles constrúen o seu primeiro prototipo, e logo discuten sobre el. A discusión versa sobre o grado de idoneidade do deseño para abordar os desafíos do deseño que foran identificados. Logo gravan unha reflexión e documentan as súas actividades. É indispensable que os guíes coidadosamente durante as actividades educativas e o proceso de creación para que os estudantes se concentren en aprender sobre os requirimentos do curriculum. Dálle relevancia á reflexión posterior a esta actividade, e asegúrate de que todo o mundo se concentra en abordar as necesidades de unha audiencia. Para evitar o parasitismo ou un reparto desigual da carga de traballo reparte coidadosamente as tarefas e os roles nos equipos.',
status: 'class',
trace_version: 1
)
Crear.reload
Crear.trace_id = Crear.id
Crear.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Inspirar os estudantes para que sexan creativos e imaxinativos na súa utilización da tecnoloxía.",

position: 1

)

I18n.locale = "en"

text.content = "Inspiring students to be creative and imaginative in their use of digital technology."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ir máis aló da túa zona de seguridade/confort e guiar os estudantes para que fagan o mesmo.",

position: 2

)

I18n.locale = "en"

text.content = "Stepping beyond your comfort zone and guiding students to do the same."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ver como xorden diferentes proxectos dunha mesma proposta inicial.",

position: 3

)

I18n.locale = "en"

text.content = "Seeing different projects emerge from the same initial assignment."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Empregar novas ferramentas.",

position: 4

)

I18n.locale = "en"

text.content = "Using novel tools."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

Crear.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Transformar as súas ideas en prototipos concretos.",

position: 1

)

I18n.locale = "en"

text.content = "Transform their ideas into concrete prototypes."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Identificar novas formas de abordar desafíos.",

position: 2

)

I18n.locale = "en"

text.content = "Identify new ways of addressing challenges."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Facer prototipos en papel.",

position: 3

)

I18n.locale = "en"

text.content = "Do paper prototyping."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Empregar ferramentas dixitais de autoría.",

position: 4

)

I18n.locale = "en"

text.content = "Use digital authoring tools."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "É reconfortante para os estudantes completar un proxecto.",

position: 5

)

I18n.locale = "en"

text.content = "It is rewarding for students to complete a project."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

Crear.boxes << learner_motivations

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

Crear.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

Crear.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Escoite coidadosamente os comentarios dos estudantes e prepare a actividade tendo en conta as súas necesidades e intereses.",

position: 1

)

I18n.locale = "en"

text.content = "Listen carefully to the student comments, and shape the activity according to their needs and interests."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Amplía as túas competencias e o teu coñecemento mediante a preparación do material, do software e outra tecnoloxía necesaria para a creación.",

position: 2

)

I18n.locale = "en"

text.content = "Expand your competence and expertise by preparing the material, software and technology needed for making."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

Crear.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Inspira aos estudantes para que creen prototipos que poidan ser empregados pola súa audiencia e para que aborden os desafíos que foron identificados.',

position: 1

)

I18n.locale = "en"

text.content = "Inspire students to create prototypes that could be used by their audience and that address the identified challenges."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Exercicios de formación do espírito de equipo (team building), tales como participar en xogos, resolver crebacabezas ou tomar xeado xuntos, poden axudar a mellorar a cooperación e colaboración cara a consecución dun obxectivo compartido.',

position: 2

)

I18n.locale = "en"

text.content = "Team building exercises, such as playing games, solving puzzles or having ice-cream together, can support cooperation and collaboration towards a shared goal."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

Crear.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Os equipos crean prototipos. Diríxeos e axúdaos (lembrándolles a súa planificación) para que aborden os desafíos identificados e para que tomen en consideración toda a información recollida.",

position: 1

)

I18n.locale = "en"

text.content = "Teams develop prototypes. Coach them to address the identified design challenges and to take all collected information into consideration by reminding them of their plans."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Lembra aos equipos que as actividades teñen como obxectivo a creación dun artefacto. Se te decatas de que os equipos se estancan e debaten durante demasiado tempo, intervén e axúdaos con suxestións prácticas a fin de que tomen unha decisión.",

position: 2

)

I18n.locale = "en"

text.content = "Remind the teams that the activities cumulate towards the creation of an artifact. If you notice teams stalling and debating for too long, step in and support them with hands-on suggestions towards a decision."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos crean os seus prototipos na aula e discuten sobre eles cos outros equipos. As conversacións versarán especialmente sobre como os seus prototipos abordan os desafíos identificados.",

position: 3

)

I18n.locale = "en"

text.content = "Teams set up their prototypes in the classroom and discuss them with other teams, in particular how and if their prototypes address the identified challenges."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos engaden a documentación sobre os seus prototipos ao blogue, describíndoo empregando debuxos, vídeos, ou fotografías dixitais. Logo gravan unha reflexión. Escoita as súas reflexións e prepara comentarios para cada equipo.",

position: 4

)

I18n.locale = "en"

text.content = "Teams add the documentation of their design prototype(s) to the blog and describe it, using drawings, videos or digital photographs of their prototypes. Then, they record a reflection. You listen to their reflections and prepare comments for each team."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

Crear.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Revise o traballo de cada equipo, as súas reflexións e entradas no blog, para asegurarse que todo o mundo explorou e recolleu exemplos e/ou ficheiros media. Despois grávelles realimentación audiovisual. A súa realimentación podería incluír recomendacións e preguntas.",

position: 1

)

I18n.locale = "en"

text.content = "Review the work of each team, their reflection recordings and blog entries, to ensure everyone explored and collected examples and/or media files. Then record audiovisual feedback for them. Your feedback might include suggestions and questions."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os bos prototipos ilustran como un deseño pode ser empregado ou como podería funcionar. Os prototipos poden estar moi pouco definidos e sen finalizar, pero deben axudar á comunicación. Un concepto simple pero ben elaborado pode supoñer unha experiencia educativa tan proveitosa como unha execución tecnicamente complexa. Sé coidadoso/a na túa avaliación dos prototipos.",

position: 2

)

I18n.locale = "en"

text.content = "Good prototypes illustrate how a design could be used or how it could work. Prototypes can be rough and unfinished, as long as they help in communication. A simple, yet well thought out concept can be as much of a learning experience as a technically intricate execution. Be careful in your assessment of prototypes."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Tamén poderías pedir aos estudantes que poñan nota ás contribucións dos seus compañeiros de clase e empregar as devanditas notas como axuda para a túa propia avaliación.",

position: 3

)

I18n.locale = "en"

text.content = "You could also ask the students to grade their teammates’ contributions, using the student grades to help form your own assessment."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

Crear.boxes << guidelines_assessment_box

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

Crear.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Importante: edición audivisual (Prezi), reflexionar (TeamUp, ReFlex).",

position: 1

)

I18n.locale = "en"

text.content = "Important: media editing (Prezi), reflecting (TeamUp, ReFlex)."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Desexable: Kit DIY (fágao vostede mesmo), entorno de programación (Scratch, iTEC Widget Store), kit de construción, edición 3D (Sketchup), impresión 3D.",

position: 2

)

I18n.locale = "en"

text.content = "Nice to have: DIY kit, programming environment (Scratch, iTEC Widget Store), construction kit, 3d editing (Sketchup), 3d printing."

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

Crear.boxes << ideas_box

I18n.locale = "en"

Crear.name = "Make"

Crear.description = "Based on their refined design brief and design ideas, student teams start making. They create their first prototype, and discuss it afterwards. The discussion especially relates to how well the design address the identified design challenges. They then record a reflection and document their activities. Careful guidance through the learning activities and the process of creation is indispensable for students to keep their minds on learning potential curricular requirements. Highlight the reflection after this activity and ensure that everyone focuses on addressing the needs of an audience. To avoid free-riders or unequal workload division, carefully divide tasks and roles within teams."

Crear.save

I18n.locale = "gl"

#Preguntar

Preguntar = Activity.create(

timeToComplete: '1',

name: 'Preguntar',

locale: 'gl',

description: '﻿Os equipos reúnense con 2-4 persoas que poderían ser usuarios futuros dos prototipos e ensínanlles os seus prototipos e ideas de deseño empregando escritos, debuxos ou modelos. Considérase que estes participantes teñen un entendemento experto do dominio no que se sitúan os deseños dos estudantes. A capacidade experta pode ser interpretada de forma ampla, por exemplo, un traballador da construción podería considerarse que ofrece un coñecemento profundo das prácticas diarias das persoas da construción. Os participantes expertos son animados a empregar bolígrafos e notas post-it para modificar e comentar o prototipo. Despois do taller os estudantes analizan os comentarios e deciden como interpretalos para re-deseñar o prototipo. Despois refinan a súa proposta de deseño, especialmente en relación ás necesidades de deseño, contexto e valor engadido do resultado, gravan unha reflexión e actualizan a súa documentación.',
status: 'class',
trace_version: 1
)
Preguntar.reload
Preguntar.trace_id = Preguntar.id
Preguntar.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Deixar que os estudantes se ocupen de levar a cabo o taller.",

position: 1

)

I18n.locale = "en"

text.content = "Let students be in charge of facilitating a workshop."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Coñecer mellor os seus estudantes.",

position: 2

)

I18n.locale = "en"

text.content = "Get to know your students better."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Considerar coidadosamente os participantes apropiados para o taller.",

position: 3

)

I18n.locale = "en"

text.content = "Thoroughly consider the appropriate participants for the workshop."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Establecer colaboracións con expertos externos.",

position: 4

)

I18n.locale = "en"

text.content = "Building collaboration with outside experts."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Conectar a escola con outras partes da sociedade.",

position: 5

)

I18n.locale = "en"

text.content = "Connecting school to other parts of society."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Proporcionar aos estudantes a oportunidade de que os alumnos se ocupen dos seus propios intereses persoais.",

position: 6

)

I18n.locale = "en"

text.content = "Providing students with the opportunity the learners how their personal interests matter."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Aproveitar as oportunidades que pode proporcionar a realidade e actuar de forma creativa no devandito contexto.",

position: 7

)

I18n.locale = "en"

text.content = "Taking advantage of the opportunities reality may provide and acting creatively with the context."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

Preguntar.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Empatizar con outros e traballar con xente diferente.",

position: 1

)

I18n.locale = "en"

text.content = "Empathize with others and work with different people."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Contactar con expertos e pedir colaboración.",

position: 2

)

I18n.locale = "en"

text.content = "Contact experts and ask for collaboration."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Presentar ideas a xente que non seguiu a progresión do proxecto.",

position: 3

)

I18n.locale = "en"

text.content = "Present ideas to people who have not followed the project progression."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Discutir e negociar con profesores e expertos.",

position: 4

)

I18n.locale = "en"

text.content = "Discuss and negotiate with teachers and experts."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Recibir críticas e incorporar ideas de expertos nos seus proxectos.",

position: 5

)

I18n.locale = "en"

text.content = "Receive criticism and incorporate expert views into their project."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Crear prototipos en papel.",

position: 6

)

I18n.locale = "en"

text.content = "Create paper prototypes."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

Preguntar.boxes << learner_motivations

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

Preguntar.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

Preguntar.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Escoita coidadosamente os comentarios dos estudantes e prepara a actividade tendo en conta as súas necesidades e intereses.",

position: 1

)

I18n.locale = "en"

text.content = "Listen carefully to the student comments, and shape the activity according to their needs and interests."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Desenvolve a túa competencia e experiencia utilizando as ideas que obtiveches escoitando as gravacións de reflexións para identificar xente axeitada á que poder pedirlle que faga comentarios sobre os prototipos.",

position: 2

)

I18n.locale = "en"

text.content = "Develop your competence and expertise by using the insights you learned from listening to the reflection recordings for identifying suitable people to ask to comment on the prototypes."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os docentes universitarios adoitan ter un horario flexible e soen estar motivados para transmitir o seu coñecemento experto a alumnos non universitarios. Quizais tamén poidas considerar a posibilidade de invitar a estudantes universitarios.",

position: 3

)

I18n.locale = "en"

text.content = "People working in academia often have a flexible schedule and find it motivating to pass their expert knowledge on to young learners. You may also consider to contact and invite university students."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

Preguntar.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Propón a realización dun taller aos estudantes.',

position: 1

)

I18n.locale = "en"

text.content = "Introduce the activity of facilitating a workshop to the students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Os equipos propoñen expertos aos que poderían invitar e preguntas abertas que lles poderían facer. Se non se lles ocorre ningún, podes facer algunhas suxestións.',

position: 2

)

I18n.locale = "en"

text.content = "Teams brainstorm possible experts to invite and open ended questions to ask them. In case they cannot think of anyone, make a few suggestions."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Cada equipo invita a 3-4 persoas ao seu taller e organiza o lugar e a data para iso. É importante pensar de forma seria e a fondo que participantes son os axeitados, e ser capaz de indicar como cada participante pode aportar coñecemento. Os talleres poden realizarse fóra da escola, por exemplo nunha oficina dunha ONG, nunha casa da terceira idade, etc.',

position: 3

)

I18n.locale = "en"

text.content = "Each team invites 3–4 people to their workshop and arranges a place and time for it. It is important to thoroughly and seriously consider appropriate participants, and to be able to say how each participant can inform the project. The workshops may happen outside of school, for example at the office of a non-governmental organization, an elderly home etc."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Podería ser interesante para os alumnos contactar cos expertos. Practique cos equipos como contactar cos participantes potenciais.',

position: 4

)

I18n.locale = "en"

text.content = "It might be exciting for the students to contact the experts. Practice with the teams how to approach potential participants."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

Preguntar.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Dirixa e ensine aos equipos mediante a realización dunha práctica do taller. Axude aos estudantes que mostren dificultades.",

position: 1

)

I18n.locale = "en"

text.content = "Coach the teams by practicing the workshop and providing the them with the workshop guidelines of the iTEC project as an example of this activity within a large scale European project. Support students that exhibit difficulties."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Asegúrese de que cada equipo ten acceso ao material para o taller (cámaras, libretas, micrófonos, notas post-it e bolígrafos) e os seus prototipos (ou unha representación destes).",

position: 2

)

I18n.locale = "en"

text.content = "Ensure that each team has access to workshop material (cameras, notebooks, microphone, post-it notes and pens) and their prototype (or a representation of it)."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os estudantes presentan as súas propostas de deseño e o deseño do prototipo aos participantes e pídenlles os seus comentarios e ideas. A xente pode alterar os prototipos ou debuxar sobre eles para expresarse mellor. Os estudantes toman notas e fan debuxos das actividades e a discusión.",

position: 3

)

I18n.locale = "en"

text.content = "Students present their design brief and prototype design to the participants and ask for their comments and ideas. The people may alter the prototypes or draw on them to express themselves better. Students take notes and pictures of the activities and the discussion."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos analizan as súas notas e os debuxos da xente. Para iso deben utilizar a actividade 'Mapa'. Formule aos alumnos preguntas abertas e intente levalos máis alá do obvio.",

position: 4

)

I18n.locale = "en"

text.content = "The teams analyse their notes and the drawings of the people. They may use the MAP activity for this. Prompt them with open ended questions and coach them to go beyond the obvious."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos deciden os cambios no seu prototipo e proposta de deseño sobre a base dos seus comentarios.",

position: 5

)

I18n.locale = "en"

text.content = "The teams decide how their prototype and design brief should change based on the analysis."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos gravan unha reflexión e documentan o seu progreso en liña.",

position: 6

)

I18n.locale = "en"

text.content = "Review the work of each team, their reflection recordings and blog entries, to ensure everyone is on the right track. Then record audiovisual feedback for them. Your feedback might include suggestions and questions."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

Preguntar.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Revisa o traballo de cada equipo, as súas gravacións con reflexións e as entradas no blog, para asegurarse que todo o mundo vai na dirección correcta. Despois grava feedback audiovisual para eles. O teu feedback pode incluír recomendacións e preguntas.",

position: 1

)

I18n.locale = "en"

text.content = "Review the work of each team, their reflection recordings and blog entries, to ensure everyone is on the right track. Then record audiovisual feedback for them. Your feedback might include suggestions and questions."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Se o experto seguiu a progresión do traballo do equipo, a súa visión experta sobre os resultados dos alumnos deberían ser considerados. O experto podería involucrarse na definición dos criterios de avaliación. Poderíase pedir aos participantes que gravaran unha mensaxe audiovisual para os estudantes despois de re-deseñar os seus prototipos sobre a base das recomendacións dos participantes.",

position: 2

)

I18n.locale = "en"

text.content = "In case the expert followed the progression of the teamwork, their expert view on the learners’ performance should be considered. The expert may be involved in defining the assessment criteria. The participants may be asked to record an audio-visual message to the students after redesign their prototypes with the suggestions of the participants in mind."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

Preguntar.boxes << guidelines_assessment_box

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

Preguntar.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Requirido: gravador media, tomar notas.",

position: 1

)

I18n.locale = "en"

text.content = "Required: media recorder, note taking."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ferramentas: gravador de audio, gravador de video, notas post-it.",

position: 2

)

I18n.locale = "en"

text.content = "Tools: audio recorder, video recorder, post-it notes"

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

Preguntar.boxes << ideas_box

I18n.locale = "en"

Preguntar.name = "Ask"

Preguntar.description = "Teams meet with 2–4 people, who could be future users of the prototypes, and communicate their prototypes and design ideas using prints, drawings or models. These participating people are considered to have an expert understanding of the domain the student designs are framed within. Expertise may be interpreted broadly, for example, a construction site worker can be considered to offer deep insight into the everyday practices of people on a building site. The expert participants are encouraged to use pens and post-it notes to modify and comment on the prototype. After the workshop the students analyze the comments and decide how to interpret them for their re-design. They then refine their design brief, especially in relation to the design challenges, context and added value of the result, record a reflection and update their documentation. This activity can happen more than once at varying time investment. Students can collect feedback on their work by asking experts, potential future users as well as from other student teams and the teacher."

Preguntar.save

I18n.locale = "gl"

#Mostrar

Mostrar = Activity.create(

timeToComplete: '1',

name: 'Mostrar',

locale: 'gl',

description: '﻿Os estudantes crean un vídeo cos subtítulos en inglés presentando o seu proceso e resultados de deseño así como os logros de aprendizaxe e posibles pasos futuros. Eles comparten esta documentación con outros estudantes ao longo de Europa, cos seus pais e a audiencia que identificaron para transferir a súa aprendizaxe, para comunicar os fundamentos do proxecto, para que os outros poidan coñecer e reutilizar o seu traballo, e para recibir feedback co que mellorar.',
status: 'class',
trace_version: 1
)
Mostrar.reload
Mostrar.trace_id = Mostrar.id
Mostrar.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Estudantes que se poñen no papel de expertos.",

position: 1

)

I18n.locale = "en"

text.content = "Students stepping into the role of experts."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Sesións de feedback e reflexión entre persoas utilizando o traballo dos estudantes como referencia.",

position: 2

)

I18n.locale = "en"

text.content = "Feedback and reflection sessions between people using the student work as reference."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Aprender sobre actividades ben realizadas e actividades que os estudantes necesitan practicar máis.",

position: 3

)

I18n.locale = "en"

text.content = "Learning about well performed activities and activities students need to practice more."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ilustrar actividades de aprendizaxe na escola aos colegas e aos pais.",

position: 4

)

I18n.locale = "en"

text.content = "Illustrating school learning activities to colleagues and parents."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Recibir material para inspirar a estudantes de anos futuros e aos teus colegas.",

position: 5

)

I18n.locale = "en"

text.content = "Receiving material to inspire future courses and your colleagues."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Mostrar prototipos deseñados polos teus estudantes.",

position: 6

)

I18n.locale = "en"

text.content = "Showcasing prototypes designed by your students."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

Mostrar.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Habilidades de edición multimedia.",

position: 1

)

I18n.locale = "en"

text.content = "Multimedia editing skills."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Colaboración nun proxecto.",

position: 2

)

I18n.locale = "en"

text.content = "Collaboration on a project."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Priorizar certos aspectos da información.",

position: 3

)

I18n.locale = "en"

text.content = "To prioritize aspects of information."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Documentar, comunicar e resumir o proceso de aprendizaxe, os resultados e a importancia dun tema a outras persoas.",

position: 4

)

I18n.locale = "en"

text.content = "To document, communicate and summarize learning process, results and the importance of a topic to others."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Sobre os proxectos, datos e temas nos que outras persoas estiveron a traballar.",

position: 5

)

I18n.locale = "en"

text.content = "About the projects, data, and topics others have been working on."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

Mostrar.boxes << learner_motivations

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

Mostrar.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

Mostrar.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Desenvolve as súas competencias e coñecementos sobre os beneficios e inconvenientes de diferentes formas de documentación (por exemplo: animacións, vídeo, etc.) e prepara unha presentación para os teus estudantes. Familiarízate tamén con diferentes plataformas de intercambio de vídeo.",

position: 1

)

I18n.locale = "en"

text.content = "Develop your competence and expertise by researching the benefits and drawbacks of different forms of documentation, e.g. animation, video etc. and by preparing a presentation for your students. Also get familiar with different video sharing platforms."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

Mostrar.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Inspira aos estudantes para que creen unha presentación que documente o seu proceso de aprendizaxe e os resultados utilizando un rango variado de elementos audivisuais, marcando así as diferentes formas en que os seus proxectos poden resultar impactantes. Fala cos estudantes sobre o proceso de produción, os pasos planeados e os requisitos.',

position: 1

)

I18n.locale = "en"

text.content = "Inspire the students to create a presentation that documents their learning process and results using a diverse range of media, by pointing out the different ways their project can reach impact this way. Speak with the students about the production process, planned steps, and requirements."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

Mostrar.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Dirixe e axuda aos estudantes na elección do propósito, a audiencia e do medio para a súa presentación.",

position: 1

)

I18n.locale = "en"

text.content = "Coach the students in choosing a purpose, an audience, and a medium for their presentation."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos preparan os seus prototipos na aula e móstranllelos aos outros.",

position: 2

)

I18n.locale = "en"

text.content = "Teams set up their prototypes in the classroom and demonstrate them to others."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os estudantes ou os equipos crean guións gráficos para planificar a narración da presentación e decidir que ficheiros dos que recolleron, tales como fotos, vídeo clips, gravacións de voz de entrevistas, etiquetas xeolocalizadas ou animacións, utilizan para representar as súas conclusións e o proceso que seguiron dunha forma comprensible. Axúdelles mediante a presentación dos beneficios e inconvenientes dos diferentes medios. Discute sobre as técnicas propias dos discurso, así como das formas de convencer unha audiencia.",

position: 3

)

I18n.locale = "en"

text.content = "Individual students or teams create storyboards to plan the narrative of the presentation, and decide which collected files, such as photos, video clips, voice recordings of interviews, geotags, or animations to use to represent their conclusions and process in a meaningful way. Support them by presenting the benefits and drawbacks of different media to students, and discuss speech and performance techniques, as well as ways of convincing an audience."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os estudantes crean un vídeo con subtítulos en inglés presentando os seus resultados de deseño e documentan os seus logros de aprendizaxe e posibles pasos no futuro. Soben o seu vídeo a unha páxina en liña para aloxamento de vídeos e comarten o enlace con outros alumnos, os seus pais e participantes na actividade PREGUNTAR. Axúdalles proporcionándolles acceso a plataformas de intercambio de vídeo.",

position: 4

)

I18n.locale = "en"

text.content = "Students create a video with English subtitles presenting their design results, and documenting their learning achievements and possible future steps. They upload their video to a video hosting page online and share the link with the iTEC facebook group, their parents and ASK activity participants. Support them by providing sharing platform options. You can use the videos to communicate the task to other students in the future."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "De forma adicional, podes organizar un evento Maker informal ao que podes invitar aos pais, aos participantes na actividade PREGUNTAR e a outros estudantes.",

position: 5

)

I18n.locale = "en"

text.content = "Additionally, you may organize an informal Maker event, to which parents, ASK activity participants and other students are invited."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Comparte tamén as propostas de deseño modificadas dos teus estudantes coa comunidade AREA.",

position: 6

)

I18n.locale = "en"

text.content = "At the end of the pre-pilot, also share the modified design briefs of your students with the itec community, by posting them to the iTEC Participate blog or asking the students to post them there."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

Mostrar.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Revisa todas as presentacións. Compara as actualizacións do progreso de cada un coas súas presentacións e comprobe se todos os pasos importantes foron incluídos na presentación (ver actividade REFLEXIÓN).",

position: 1

)

I18n.locale = "en"

text.content = "Review all presentations. Compare everyone’s progress updates with their presentations to see if all important steps are included in the presentation (see activity ‘Reflection’)."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Revisa tódas as gravacións de reflexións e discute o proceso desde 'soñar' a 'mostrar' cos seus estudantes. Cómo foi a súa experiencia? Qué aprenderon? Qué lles gustaría seguir explorando?",

position: 2

)

I18n.locale = "en"

text.content = "Review all reflection recordings and discuss the process from “dream” to “show” with the students. What was their experience like? What have they learned? What would they like to explore further?"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "O traballo do estudante pode ser utilizado como feedback ou en sesións de reflexión.",

position: 3

)

I18n.locale = "en"

text.content = "Student work can be used for open feedback and reflection sessions."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Podes avaliar as documentacións de acordo ao seu valor como recursos para a preparación do exame.",

position: 4

)

I18n.locale = "en"

text.content = "You could assess the documentations for their value as resources for exam preparation."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

Mostrar.boxes << guidelines_assessment_box

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

Mostrar.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Necesario: edición de video, gravación de medios de comunicación (Audacia), publicación de vídeo (YouTube, Vimeo, dotSub), reflexión (TeamUp, ReFlex).",

position: 1

)

I18n.locale = "en"

text.content = "Required: video editing, media recording (Audacity), video publication (YouTube, Vimeo, dotSub), reflection (TeamUp, ReFlex)."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Importante: Compartición de información Media (Tenda de iTEC Widget).",

position: 2

)

I18n.locale = "en"

text.content = "Important: media sharing (iTEC Widget Store)."

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

Mostrar.boxes << ideas_box

I18n.locale = "en"

Mostrar.name = "Show"

Mostrar.description = "Students create a video with English subtitles presenting their design results and process, as well as learning achievements and possible future steps. They share this documentation with other iTEC students across Europe, their parents and their identified audience to transfer their learning, to communicate the background of their project, to let others know about the possibility to remix their work, and to receive feedback for improvement."

Mostrar.save

I18n.locale = "gl"

#Colaborar

Colaborar = Activity.create(

timeToComplete: '1',

name: 'Colaborar',

locale: 'gl',

description: '﻿Os estudantes colaboran con estudantes doutras escolas AREA. A colaboración ocasional e ao azar promovida polos estudantes é alentada.',
status: 'class',
trace_version: 1
)
Colaborar.reload
Colaborar.trace_id = Colaborar.id
Colaborar.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Axudar á colaboración internacional.",

position: 1

)

I18n.locale = "en"

text.content = "Support international collaboration."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ampliar a súa comprensión cross-curricular",

position: 2

)

I18n.locale = "en"

text.content = "Broaden your cross-curricular understanding."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Compartir a responsabilidade cos estudantes.",

position: 3

)

I18n.locale = "en"

text.content = "Share responsibility with students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Guiar os estudantes para que tomen eleccións significativas.",

position: 4

)

I18n.locale = "en"

text.content = "Guide students to make meaningful choices."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

Colaborar.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Contactar, encontrar e colaborar con estudantes fóra do seu círculo social.",

position: 1

)

I18n.locale = "en"

text.content = "Contact, encounter and collaborate with students outside of their social circle."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Apreciar a interconexión de áreas de coñecemento.",

position: 2

)

I18n.locale = "en"

text.content = "Appreciate the interconnectedness of knowledge areas."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

Colaborar.boxes << learner_motivations

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

Colaborar.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

Colaborar.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Revisa o traballo de cada equipo, as gravacións das súas reflexións e entradas no blog, asegurándote que todos estan no camiño correcto. Despois grava feedback audiovisual para eles. O teu feedback podería inclurir recomendacións e preguntas. Escoita con atención os comentarios dos estudantes e dele forma á actividade tendo en conta as súas necesidades e intereses.",

position: 1

)

I18n.locale = "en"

text.content = "Review the work of each team, their reflection recordings and blog entries, to ensure everyone is on the right track. Then record audiovisual feedback for them. Your feedback might include suggestions and questions. Listen carefully to the student comments, and shape the activity according to their needs and interests."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Expande as túas competencias e coñecemento preparando e probando ferramentas dixitais. Podes pedir aos estudantes que che digan como funcionan algunhas ferramentas.",

position: 2

)

I18n.locale = "en"

text.content = "Expand your competence and expertise by preparing and testing digital tools to use, possibly ask students to demonstrate tools to you."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Recolle exemplos de como podería ser a colaboración e de que podería estar permitido.",

position: 3

)

I18n.locale = "en"

text.content = "Collect examples of how collaboration may look and what it may afford."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

Colaborar.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Inspira aos estudantes para que vaian máis alá da súa zona de confianza (confort) e para que contacten con estudantes que non coñecen, presentándolles beneficios do networking, a aprendizaxe entre compañeiros e a colaboración en liña.',

position: 1

)

I18n.locale = "en"

text.content = "Inspire students to step out of their comfort zone and to contact students they never met before, by presenting benefits or networking, peer-learning and online collaboration."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Sé coidadoso coa privacidade en liña e con cuestións de seguridade.',

position: 2

)

I18n.locale = "en"

text.content = "Be mindful of online privacy and safety issues."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Demostra como os estudantes poden utilizar as heramientas dixitais para contactar con outros.',

position: 3

)

I18n.locale = "en"

text.content = "Demonstrate the digital tools the students may use to contact others."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

Colaborar.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Os estudantes buscan traballos relacionados e comparten os seus propios, seguen e comentan as entradas nos blogs doutros estudantes.",

position: 1

)

I18n.locale = "en"

text.content = "Students search for related work and share their own, they follow and comment on other student’s posts."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os estudantes discuten en liña a súa experiencia de participación no proxecto con estudantes doutras clases.",

position: 2

)

I18n.locale = "en"

text.content = "Students discuss their experience of participating in the project with students from other classes online."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "De forma ocasional, establécense videoconferencias ou intercámbianse correos electrónicos entre os colaboradores.",

position: 3

)

I18n.locale = "en"

text.content = "Occasionally, videoconferences are set up or emails are exchanged between the collaborators."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Dirixe e axuda aos estudantes para que fagan preguntas a través das canles que preparas para eles.",

position: 4

)

I18n.locale = "en"

text.content = "You coach students to post questions to the channels you set up for them."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

Colaborar.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Sé aberto a que os intereses persoais formen parte da túa avaliación. Pode que non sexa a frecuencia da comunicación duns estudantes con outros, senón o nivel da devandita comunicación. En que medida aproveitaron os estudantes a experiencia doutros fóra da clase?",

position: 1

)

I18n.locale = "en"

text.content = "Be open to let personal interests shape your assessment. It may not be the frequency of the students’ engagement with others, but rather the depth of their engagement. How apt were the students to utilize the experience of others outside of the classroom?"

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

Colaborar.boxes << guidelines_assessment_box

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

Colaborar.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Requirido: discusión en liña, publicación media, publicación.",

position: 1

)

I18n.locale = "en"

text.content = "Required: online discussion, media publication, publication."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Importante: blogging.",

position: 2

)

I18n.locale = "en"

text.content = "Important: blogging."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ferramentas: grupo de Facebook para a colaboración de estudiantes AREA, comunidade de profesores AREA.",

position: 3

)

I18n.locale = "en"

text.content = "Tools: iTEC students collaborate facebook group, iTEC teacher community are potential networks for sharing outcomes and for establishing collaboration beyond the walls of a school and borders of a country."

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

Colaborar.boxes << ideas_box

I18n.locale = "en"

Colaborar.name = "Collaborate"

Colaborar.description = "Students collaborate with students from other iTEC schools. Ad-hoc and serendipitous collaboration, driven by the students is encouraged."

Colaborar.save

I18n.locale = "gl"

#Informe de deseño

informedeseño = Activity.create(

timeToComplete: '1',

name: 'Informe de deseño',

locale: 'gl',

description: 'Vostede presenta un informe de deseño inicial aos estudantes que relaciona as tarefas de deseño aos temas de currículo, pero deixa algúns aspectos abertos para un posterior refinamento. Durante esta lección, vostede tamén motiva aos estudantes para que expliquen a responsabilidade que asumirán. Os estudantes forman equipos, discuten, cuestionan e familiarízanse co informe. Perfeccionan o seu programa preliminar, especialmente en relación ao que estan a deseñar, desafíos de deseño iniciais e posibles resultados do deseño. Estudantes rexistran unha reflexión, configuran un blog para a súa documentación, e empezan a súa documentación.',
trace_id: nil,
trace_version: 1
)
informedeseño.reload
informedeseño.trace_id = informedeseño.id
informedeseño.save

#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Un papel de adestrar e guiar, en lugar de ordenar.",

position: 1

)

I18n.locale = "en"

text.content = "A role of coaching and guiding, instead of instructing."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Motivar aos estudantes deixando que moldeen a súa propia tarefa.",

position: 2

)

I18n.locale = "en"

text.content = "Motivating students by letting students shape their own task."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

informedeseño.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Comprometerse seriamente a facer un deseño ben pensado.",

position: 1

)

I18n.locale = "en"

text.content = "Seriously commit themselves to doing thoughtful design."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Negociar os obxetivos e criterios de avaliación.",

position: 2

)

I18n.locale = "en"

text.content = "Negotiate on goals and assessment criteria."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Cuestionar as tarefas recibidas e suxerir melloras.",

position: 3

)

I18n.locale = "en"

text.content = "Question the tasks given to them, and suggest improvements."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Abordar retos propios dos deseños do mundo real.",

position: 4

)

I18n.locale = "en"

text.content = "Tackle real world design challenges."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

informedeseño.boxes << learner_motivations

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

informedeseño.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

informedeseño.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Preparar un programa preliminar, (1) elexindo un programa preliminar, (2) axustándoo para que encaixe nos requerimentos do curriculum e na planificación do curso.",

position: 1

)

I18n.locale = "en"

text.content = "Prepare a design brief, by (1) choosing one design brief (italics part of a learning story) and (2) adjusting it to match the curriculum requirements and your course schedule."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Preparar un programa preliminar, (1) elexindo un programa preliminar, (2) axustándoo para que encaixe nos requerimentos do curriculum e na planificación do curso.",

position: 2

)

I18n.locale = "en"

text.content = "Prepare a design brief, by (1) choosing one design brief (italics part of a learning story) and (2) adjusting it to match the curriculum requirements and your course schedule."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Familiarízate con todas as actividades de aprendizaxe para que lle poidas presentar o proceso aos estudantes.",

position: 3

)

I18n.locale = "en"

text.content = "Familiarize yourself with all learning activities so you can introduce the process to the students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Localiza exemplos concretos que expliquen por que é importante deseñar resultados a conciencia e tomarse o proceso seriamente. Mira a lista de exemplos como inspiración: http://bit.ly/design-inspiration.",

position: 4

)

I18n.locale = "en"

text.content = "Locate concrete examples that present why it is important to design thoughtful outcomes and to take the process seriously. See list of examples for inspiration: http://bit.ly/design-inspiration."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Prepara unha lista de criterios de avaliación que reflictan os requirimentos do curriculum. Se queres, compárteos con outros/as como comentarios aquí.",

position: 5

)

I18n.locale = "en"

text.content = "Prepare a list of assessment criteria that reflect the curriculum requirements. If you like, share them with others as comments here."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

informedeseño.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Presenta a idea do proceso de deseño, a túa lista de exemplos e o programa preliminar. Dálle o programa preliminar aos estudantes.',

position: 1

)

I18n.locale = "en"

text.content = "Present the idea of the design process, your list of examples and the design brief. Give the students the design brief."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Presenta todas as actividades como talleres de deseño de 1-2 leccións e dálle aos estudantes a visualización do proceso de deseño e a túa planificación (horario).',

position: 2

)

I18n.locale = "en"

text.content = "Present all activities as 1-2 lesson “design workshops” and give the visualization of the design process (*.png) and your schedule to the students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Repasa os criterios de avaliación cos estudantes. Asegúrate de que eles/elas entenden que as súas anotacións e o deseño final deben demostrarche que eles/elas completaron os criterios. Dálles unha lista dos teus criterios de avaliación.',

position: 3

)

I18n.locale = "en"

text.content = "Go through the assessment criteria with the students. Make sure they understand that their notes and final design need to show to you that they’ve completed the criteria. Give them your list of assessment criteria."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Forma equipos de estudantes. Podes pedirlle aos estudantes que definan roles iniciais para cada membro do equipo.',

position: 4

)

I18n.locale = "en"

text.content = "Form teams of students. You may ask the students to define initial roles for each team member."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Anima aos estudantes a cuestionar o programa preliminar! Pídelles que respondan a preguntas tales como (a) para quen é o deseño? (b) como podes descubrir cousas sobre aqueles a quen vai dirixido o deseño? e.g., lugar, tempo e tipo de actividade investigación contextual, (c) cal é o reto que estás abordando?, (d) como estás planeando abordar o reto?, e (e) aínda que cada un ten que participar en todos os pasos, quen é responsable de cada área?',

position: 5

)

I18n.locale = "en"

text.content = "Encourage students to question the brief! Ask them to answer questions such as (a) who is the design for? (b) how can you find out about those you are designing for? e.g., place, time and type of activity “contextual inquiry”, (c) What is the challenge that you are tackling?, (d) How are you planning to address the challenge?, and (e) although everyone has to be involved with all steps, who is responsible for which area?"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Dálle aos estudantes suficiente información introductoria para que poidan tomar decisións sobre o que queren facer no seu deseño. Poida que queiras darlle este material aos estudantes antes de que o curso comence para que poidan mirar a eso como unha tarefa.',

position: 6

)

I18n.locale = "en"

text.content = "Give students enough introductory information so they can make decisions on what they want to do in their design. You may want to give this material to students before the course starts so they can look at it as homework."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

informedeseño.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "En equipos, os estudantes discuten o proceso de deseño, idean o que queren deseñar, e perfeccionan o programa preliminar.",

position: 1

)

I18n.locale = "en"

text.content = "In teams, students discuss the design process, ideate what they will design, and refine the design brief."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os estudantes gravan unha reflexión (ver a actividade reflexión).",

position: 2

)

I18n.locale = "en"

text.content = "Students record a reflection (see reflection activity)."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Cada equipo configura un blog do proxecto empregando unha plataforma axeitada e envía a URL do blog ao profesor.",

position: 3

)

I18n.locale = "en"

text.content = "Each team sets up a project blog using a suitable blogging platform and sends the URL of the blog to the teacher."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Páxina de perfil: os estudantes describen o seu equipo do proxecto incluíndo os seus roles no proxecto. Poden incluír una foto de eles mesmos, unha captura de pantalla de TeamUp e información de contacto. A páxina pode ser chamada, e.g. 'Equipo de deseño'.",

position: 4

)

I18n.locale = "en"

text.content = "About page: Students describe their project team including their roles in the project. They may include a picture of themselves, a screenshot of TeamUp and contact information. The page can be called, e.g. “Design team”."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Entrada de blog sobre o programa preliminar: os estudantes engaden o seu primeiro programa preliminar ao blog. Eles etiquetan a entrada como 'deseño preliminar'.",

position: 5

)

I18n.locale = "en"

text.content = "Design Brief blog post: Students add their first Design Brief to the blog. They label or tag the post with “design brief”."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Entrada de blog sobre o proceso de deseño: os estudantes empregan a súa gravación da reflexión para escribir o que fixeron, que retos tiñan e que retos poden prever (usar a etiqueta 'proceso de deseño' para describir a entrada).",

position: 6

)

I18n.locale = "en"

text.content = "Design Process blog post: Students use their reflection recording to write what they did, what challenges they had and what challenges they can foresee (use tag or label “design process” to describe the post)."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "En total, cada equipo debería de ter un blog con unha páxina e dúas entradas despois de esta tarefa.",

position: 7

)

I18n.locale = "en"

text.content = "In total, each team should have a blog with 1 page and 2 posts after this homework."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ti engades as URLs dos blogs dos estudantes a este formulario: http://bit.ly/itec-c3-blogs. Nós logo promovemos os blogs no sitio web de iTEC.",

position: 8

)

I18n.locale = "en"

text.content = "You add the URLs of the student blogs to this form: http://bit.ly/itec-c3-blogs. We then promote the blogs on the iTEC website."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

informedeseño.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

informedeseño.boxes << guidelines_assessment_box

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

informedeseño.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Formar equipos: podes usar TeamUp para axudar a crear equipos equilibrados.",

position: 1

)

I18n.locale = "en"

text.content = "Forming teams: You can use TeamUp to help in creating balanced teams."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Programa preliminar: o programa preliminar de cada equipo (o que farán e cando o farán) debería ser mostrado visualmente, utilizando notas post-it ou ferramentas dixitais equivalentes.",

position: 2

)

I18n.locale = "en"

text.content = "Design brief: Each team’s brief (what they will do and when) should be laid out visually, using post-it notes or equivalent digital tools."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Informe dos resultados do equipo: os teus estudantes poden empregar os blogs que xa posúen ou poden crear novos blogs eles mesmos. A túa escola pode proporcionar blogs públicos, pero se non podes considerar Blogger ou Wordpress.",

position: 3

)

I18n.locale = "en"

text.content = "Team result reporting: Your students may use blogs they already have or they can create new blogs for themselves. Your school may provide public blogs, but if not, you can consider Blogger or Wordpress."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Agregar blogs dos estudantes: usar Google Reader, Edufeedr ou Netvibes para recoller of feeds RSS dos blogs dos estudantes e ver facilmente sempre que un equipo actualiza o seu blog.",

position: 4

)

I18n.locale = "en"

text.content = "Aggregating student blogs: Use Google Reader, Edufeedr or Netvibes to collect the RSS feeds of student blogs and easily see whenever a team updated their blogs."

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

informedeseño.boxes << ideas_box

I18n.locale = "en"

informedeseño.name = "Design Brief"

informedeseño.description = "You present an initial design brief to the students that ties the design tasks to the curriculum topics, but leaves some aspects open for refinement. During this lesson, you also provide the students with the motivation for and explain the responsibility they will carry for being involved. Students form teams, discuss, question and familiarize themselves with the brief. They refine their design brief context, particularly in relation of who/what they are designing for, initial design challenges and possible design results. Students record a reflection, set up a blog for their documentation, and start their documentation."

informedeseño.save

I18n.locale = "gl"

#Investigación contextual - Observación

Investigacioncontextualo = Activity.create(

timeToComplete: '1',

name: 'Investigación contextual - Observación',

locale: 'gl',

description: 'Baseándose nas indicacións de deseño, os estudantes identificarán a quen e que observar de cara aos resultados do deseño, por exemplo as prácticas ou entornos de animais ou persoas concretos. A súa elección dependerá dos destinatarios do deseño, o obxecto de deseño e os desafíos que desexan afrontar nun principio. Os equipos de estudantes realizarán a observación que planifiquen con cámaras dixitais, cadernos e micrófonos para documentar o que vexan. Porán en común os arquivos de audio e vídeo recompilados e analizaranos. De acordo coa información recollida e o seu análise, os estudantes mellorarán as súas indicacións de deseño, especialmente no respectivo a desafíos e resultados do deseño. Despois rexistrarán as súas reflexións e actualizarán o blog.',

trace_id: nil,
trace_version: 1
)
Investigacioncontextualo.reload
Investigacioncontextualo.trace_id = Investigacioncontextualo.id
Investigacioncontextualo.save


#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Enviar estudantes a observar o seu entorno como unha asignación de tarefa de grupo.",

position: 1

)

I18n.locale = "en"

text.content = "Sending students to observe their environment as group homework assignments."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

Investigacioncontextualo.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "A observar e gravar fenómenos naturais ou persoas.",

position: 1

)

I18n.locale = "en"

text.content = "Observe and record natural phenomena and/or people."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Empatizar cos demais.",

position: 2

)

I18n.locale = "en"

text.content = "Empathize with others."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Colaborar en liña.",

position: 3

)

I18n.locale = "en"

text.content = "Collaborate online."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Identificar retos de deseños reais.",

position: 4

)

I18n.locale = "en"

text.content = "Identify real world design challenges."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Cuestionar e mellorar as tarefas que se lles dan.",

position: 5

)

I18n.locale = "en"

text.content = "Question and improve tasks given to them."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

Investigacioncontextualo.boxes << learner_motivations

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

Investigacioncontextualo.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

Investigacioncontextualo.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Observar os blogs de cade equipo, especialmente as súas indicacións de deseño.",

position: 1

)

I18n.locale = "en"

text.content = "Look at the blogs of each student team, especially their design briefs."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Prestar apoio aos equipos que non actualizaran os blogs nin as indicacións de deseño.",

position: 2

)

I18n.locale = "en"

text.content = "Support the teams that have not updated their blogs and design briefs."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Escoitar os rexistros de reflexións de cada equipo.",

position: 3

)

I18n.locale = "en"

text.content = "Listen to the reflection recordings of each team."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Identificar localizacións e necesidades para cada equipo, e prestar axuda se é preciso.",

position: 4

)

I18n.locale = "en"

text.content = "Identify suitable locations and settings for each team, to support them if needed."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

Investigacioncontextualo.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Presentar a actividades aos estudantes.',

position: 1

)

I18n.locale = "en"

text.content = "Introduce the activity/the workshop to the students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Explicarlles que deber poñer os seus cinco sentidos a traballar na observación de persoas, entornos ou prácticas que identificaron.',

position: 2

)

I18n.locale = "en"

text.content = "Tell them that all of their senses need to be there when observing the people, practices or environments they identified."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Asegurarse de que cada equipo dispón de medios para documentalos (cámaras, cadernos, micrófonos, etc.)',

position: 3

)

I18n.locale = "en"

text.content = "Make sure that each team has documentation equipment (cameras, notebooks, microphone etc.)"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Asegurarse de que cada equipo seleccionou persoas, lugares, e/ou prácticas que observar.',

position: 4

)

I18n.locale = "en"

text.content = "Make sure that each team has selected people, places and/or practices to observe."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

Investigacioncontextualo.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Os equipos sairán a realizar as súas observacións en grupo ou individuais.",

position: 1

)

I18n.locale = "en"

text.content = "Teams go out to do their observation, either together or individually."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Ordenan as notas, o audio e o vídeo recopilados, agrúpanos e anótanos.",

position: 2

)

I18n.locale = "en"

text.content = "Teams sort through the media files and notes they collected, they group and annotate them."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos analizan as súas notas e rexistran os desafíos e as ideas do deseño.",

position: 3

)

I18n.locale = "en"

text.content = "Teams analyse their notes and record design challenges and design ideas."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos debaten as seguintes cuestións: 1. Cómo se desenrolou a actividade? Que información interesante se recolleu? Teñen sentido as indicacións para o deseño ou precisan dalgunha modificación? Que hai que modificar?",

position: 4

)

I18n.locale = "en"

text.content = "Teams discuss the following questions: 1. How did the workshop go? What interesting information was collected? Does the design brief still make sense or does it need changes? How does it need to change?"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os estudantes escriben as súas segundas indicacións de deseño e as súas segundas reflexións.",

position: 5

)

I18n.locale = "en"

text.content = "Students write their Design Brief 2 and record their Reflection 2."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos buscan mais información sobre o tema (en libros, internet, etc.) e póñena en común nunha carpeta compartida.",

position: 6

)

I18n.locale = "en"

text.content = "Teams find more information on the topic (from books, internet, etc.) and collect it to a shared space."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Entrada no blog sobre as indicacións de deseño: os estudantes engadirán a súa segunda versión das indicacións e etiquetarana como 'indicacións de deseño'",

position: 7

)

I18n.locale = "en"

text.content = "Design Brief blog post: Students add their Design Brief 2 to the blog and label or tag it with “design brief”."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Entrada no blog sobre o proceso de deseño: os estudantes empregarán o seu rexistro de reflexións para rendir conta do que levaron a cabo, os desafíos que atoparon e os que prevén. Etiquetarán a entrada como 'proceso de deseño'",

position: 8

)

I18n.locale = "en"

text.content = "Design Process blog post: Students use their reflection recording to write what they did, what challenges they had and what challenges they can foresee. They label or tag the post with “design process”."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Entrada de blog sobre os resultados do deseño: os estudantes engadirán o material de audio e vídeo ao blog e describirán o que significan estos descubrimentos con respecto ao deseño. Poden incluir esbozos de ideas para o deseño. Etiquetarán a entrada como 'resultados do deseño'",

position: 9

)

I18n.locale = "en"

text.content = "Design Results blog post: Students add their collected pictures and other media files to the blog and describe what these findings mean in relation to their design. They may include drawings of design ideas. They label or tag the post with “design results”."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

Investigacioncontextualo.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

Investigacioncontextualo.boxes << guidelines_assessment_box

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

Investigacioncontextualo.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Rexistrar as observacións con papel e lapis, teléfonos intelixentes (con aplicacións como AudioBoo, Bamuser, Qik, Rehearsal Assistant, Instagram, etc.) e outros dispositivos similares.",

position: 1

)

I18n.locale = "en"

text.content = "Record observations using pen&paper, smart phones (apps such as AudioBoo, Bambuser, Qik, Rehearsal Assistant, Instagram, etc.) and other suitable devices."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Recopilar as notas e outros arquivos nun espacio compartido. Por exemplo: Dropbox, Google Docs, Flickr, webs para colgar vídeos e aplicacións para móvil axeitadas.",

position: 2

)

I18n.locale = "en"

text.content = "Collect notes and media to a shared space. Use eg. DropBox, Google Docs, Flickr,, video sharing sites, suitable smart phone apps."

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

Investigacioncontextualo.boxes << ideas_box

I18n.locale = "en"

Investigacioncontextualo.name = "Contextual Inquiry: Observation"

Investigacioncontextualo.description = "Based on their design brief, students identify who and what to observe to inform their design result, for example practices or environments of particular people or animals. Their choice depends on who they are designing for, what they are designing and the initial challenges they want to address. Student teams perform their planned observation by using digital cameras, notebooks and microphones to document what they see. They share their collected media files and analyze them. Based on their collected information and analysis, the students refine their design brief, especially the design challenges and design results. They then record a reflection and update their blog."

Investigacioncontextualo.save

I18n.locale = "gl"

#Investigacioncontextual

Investigacioncontextual = Activity.create(

timeToComplete: '1',

name: 'Investigación contextual - Comparación',

locale: 'gl',

description: 'Baseándose nas indicacións de deseño, os estudantes identificarán que tipo exemplos de traballos existentes poden recopilar. A súa elección dependerá dos destinatarios do deseño, o obxeto de deseño e os desafíos que desexan afrontar nun principio. Os equipos de estudantes recopilarán 10 exemplos similares ao tipo de dispositivo que intentarán deseñar. Porán en común os arquivos de audio e vídeo recopilados e analizarán as semellanzas e as diferencias cos exemplos recopilados. De acordo coa infomación recollida e o seu análise, os estudantes mellorarán as indicacións de deseño, especialmente no relativo a desafíos e resultados do deseño. Despois rexistrarán as súas reflexións e actualizarán o blog.',

trace_id: nil,
trace_version: 1
)
Investigacioncontextual.reload
Investigacioncontextual.trace_id = Investigacioncontextual.id
Investigacioncontextual.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Atopar ducias de deseños innovadores de todo o mundo.",

position: 1

)

I18n.locale = "en"

text.content = "Finding dozens of innovative designs from around the world."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

Investigacioncontextual.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Encontrar e evaluar deseños de diversos ámbitos.",

position: 1

)

I18n.locale = "en"

text.content = "Find and evaluate designs of various fields."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Empatizar cos demais.",

position: 2

)

I18n.locale = "en"

text.content = "Empathize with others."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Colaborar en liña.",

position: 3

)

I18n.locale = "en"

text.content = "Collaborate online."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Afrontar retos de deseño reais.",

position: 4

)

I18n.locale = "en"

text.content = "Identify real world design challenges."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Cuestionar e mellorar as tarefas que se lles dan.",

position: 5

)

I18n.locale = "en"

text.content = "Question and improve tasks given to them."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

Investigacioncontextual.boxes << learner_motivations

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

Investigacioncontextual.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

Investigacioncontextual.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Observar os blogs de cada equipo, especialmente as súas indicacións de deseño.",

position: 1

)

I18n.locale = "en"

text.content = "Look at the blogs of each team of students, especially their design briefs."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Escoitar os rexistros de reflexións de cada equipo.",

position: 2

)

I18n.locale = "en"

text.content = "Listen to the reflection recordings of each team."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Identificar sitios web axeitados para cada equipo. Nós recopilamos e continuaremos a recopilar sitios web cheos de exemplos inspiradores no gropo de Diigo 'Design Inspiration for School'.",

position: 3

)

I18n.locale = "en"

text.content = "Identify suitable websites for each team. We collected and will continue to collect websites full of inspiring examples at the Diigo Group ‘Design Inspiration for School’."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

Investigacioncontextual.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Presentar o taller de actividade aos estudantes e explicarlles que deben atopar e analizar 10 exemplos diferentes, así como explicar a súa relación co proxecto.',

position: 1

)

I18n.locale = "en"

text.content = "Introduce the activity workshop to the students and tell them that they need to find and analyze 10 different examples, and explain how they relate to their project."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Asegurarse de qeu todos os membros do equipo saben que tipo de exemplos se buscan.',

position: 2

)

I18n.locale = "en"

text.content = "Make sure that each team member knows what kind of examples they are looking for."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

Investigacioncontextual.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Os equipos buscarán deseños comparables e debatirán sobre eles. Recordar aos estudantes como xestionar o seu tempo.",

position: 1

)

I18n.locale = "en"

text.content = "Teams search for comparable designs and discuss them. Remind the students about time-management."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos seleccionarán os 10 deseños mais relevantes.",

position: 2

)

I18n.locale = "en"

text.content = "Teams select the 10 most relevant related designs."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos analizan os seus exemplos, listan semellanzas e diferencias e indentifican os desafíos e as ideas de deseño.",

position: 3

)

I18n.locale = "en"

text.content = "Teams analyse their examples, list similarities and differences, and identify design challenges and design ideas."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos discuten as seguintes cuestións: 1. Como se desenrolou a actividade? Que informacion interesante se recolleu? Teñen sentido as indicacións para o deseño ou precisan dalgunha mellora? Que hai que mellorar?",

position: 4

)

I18n.locale = "en"

text.content = "Teams discuss the following questions: 1. How did the workshop go? What interesting information was collected? Does the design brief still make sense or does it need refinement? How does it need to be refined?"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos escriben as segundas indicacións de deseño e rexistran as súas segundas reflexións.",

position: 5

)

I18n.locale = "en"

text.content = "Teams write their Design Brief 2 and record their Reflection 2"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Entrada de blog sobre as indicacións de deseño: os estudantes publican as súas segundas indicacións. A entrada é etiquetada como 'indicacións de deseño'",

position: 6

)

I18n.locale = "en"

text.content = "Design Brief blog entry: Teams add their Design Brief 2 to the blog. They label or tag the post with “design brief”."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Artículo sobre o proceso de deseño: os estudantes utilizan o seu rexistro de reflexións para rendir conta do que levaron a cabo, dos desafíos que se atoparon e os que prevén. A entrada é etiquetada como 'proceso de deseño'.",

position: 7

)

I18n.locale = "en"

text.content = "Design Process blog entry: Teams use their reflection recording to write what they did, what challenges they had and what challenges they can foresee. They label or tag the post with “design process”"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Entrada de blog sobre os resultados do deseño: os estudantes engaden ao blog as descripcións e análise dos 10 exemplos. Describen as semellanzas, as diferencias e a relación dos deseños existentes co seu propio. Poden incluír esbozos de ideas para o deseño. A entrada é etiquetada como 'resultados do deseño'",

position: 8

)

I18n.locale = "en"

text.content = "Design Results blog entry: Students add description and analysis of their 10 projects to the blog. They describe the similarities and differences of these existing designs and how they relate to their design. They may include drawings of design ideas. They label or tag the post with “design results”."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

Investigacioncontextual.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

Investigacioncontextual.boxes << guidelines_assessment_box

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

Investigacioncontextual.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Recopilación de enlaces nun servicio de marcadores sociais como Diigo, Delicious, ou Pinterest.",

position: 1

)

I18n.locale = "en"

text.content = "Collect links to a social bookmark service such as Diigo, Delicious, and Pinterest."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Fotografías ou outros materiais sobre os deseños comparados e posta en común por medio de un servicio axeitado (Dropbox, Flickr, Pinterest).",

position: 2

)

I18n.locale = "en"

text.content = "Take photos or other recordings of benchmarked designs and share them on a suitable media sharing service (Dropbox, Flickr, Pinterest)"

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

Investigacioncontextual.boxes << ideas_box

I18n.locale = "en"

Investigacioncontextual.name = "Contextual Inquiry: Benchmarking"

Investigacioncontextual.description = "Based on their design brief, students identify what kind of examples of existing works to collect. Their choice depends on who they are designing for, what they are designing and the initial challenges they want to address. Student teams collect 10 examples of the kind of artifact that is similar to the one they are trying to design. They share their collected media files and analyze the differences and similarities of the example works they collected. Based on their collected information and analysis, the students refine their design brief, especially the design challenges and design results. They then record a reflection and update their blog."

Investigacioncontextual.save

I18n.locale = "gl"

#Deseño de producto.

deseñoproducto = Activity.create(

timeToComplete: '1',

name: 'Deseño de producto',

locale: 'gl',

description: 'De acordo coas segundas indicacións de deseño e as súas ideas iniciais, os estudantes crean o seu primeiro prototipo de deseño. Os estudantes debaten sobre o seu prototipo e melloran as indicacións, especialmente no que respecta aos resultados e como estes resolven os desafíos atopados. Despois rexistran as súas reflexións e actualizan o blog.',

trace_id: nil,
trace_version: 1
)
deseñoproducto.reload
deseñoproducto.trace_id = deseñoproducto.id
deseñoproducto.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Observar ideas creativas.",

position: 1

)

I18n.locale = "en"

text.content = "Seeing creative ideas."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Observar maneiras imaxinativas de empregar as tecnoloxías dixitais.",

position: 2

)

I18n.locale = "en"

text.content = "Seeing imaginative ways of using digital technology."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Guiar aos estudantes cara a consecución de novas capacidades e coñecementos.",

position: 3

)

I18n.locale = "en"

text.content = "Guiding students towards acquiring new skills and knowledge."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

deseñoproducto.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Transformar as súas ideas en prototipos concretos.",

position: 1

)

I18n.locale = "en"

text.content = "Transform their ideas into concrete prototypes."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Atopar maneiras creativas de abordar os problemas.",

position: 2

)

I18n.locale = "en"

text.content = "Find creative ways of addressing problems."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "O deseño pódese realizar con prototipos en papel ou coas ferramentas dixitais colaborativas correspondentes.",

position: 3

)

I18n.locale = "en"

text.content = "Design can happen using paper prototyping, or using suitable digital authoring tools that allow collaboration."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

deseñoproducto.boxes << learner_motivations

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

deseñoproducto.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

deseñoproducto.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Observar os blogs de cada equipo, especialmente as súas indicacións de deseño.",

position: 1

)

I18n.locale = "en"

text.content = "Look at the blogs of each team of students, especially their design briefs and design results."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Prestar apoio aos que non actualizaron os blogs nin as indicacións de deseño.",

position: 2

)

I18n.locale = "en"

text.content = "Support those who have not updated their blogs."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Escoitar os rexistros de reflexións de cada equipo.",

position: 3

)

I18n.locale = "en"

text.content = "Listen to the reflection recordings of each team."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Preparar o material, software e tecnoloxía para que os equipos creen os seus deseños baseados nas súas ideas de deseño previas.",

position: 4

)

I18n.locale = "en"

text.content = "Prepare the material, software and technology for the teams to create their designs based on their early design ideas."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

deseñoproducto.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Presentar o taller de actividade aos estudantes.',

position: 1

)

I18n.locale = "en"

text.content = "Introduce the activity workshop to the students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Recordarlles que os seus deseños deben abordar os retos de deseño que foron identificados.',

position: 2

)

I18n.locale = "en"

text.content = "Remind them that their designs should address the identified design challenges."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

deseñoproducto.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Os equipos desenrolan os seus deseños.",

position: 1

)

I18n.locale = "en"

text.content = "Teams develop their designs."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Montan os seus prototipos na clase e debaten cos outros equipos sobre os mesmos.",

position: 2

)

I18n.locale = "en"

text.content = "Teams set up their prototypes in the classroom and discuss it with other teams."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os equipos melloran as súas indicacións de deseño nunha terceira versión e rexistran as súas reflexións por terceira vez.",

position: 3

)

I18n.locale = "en"

text.content = "Teams refine their Design Brief into the third version and record their third Reflection."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Entrada de blog sobre as indicacións de deseño: os estudantes publican as súas terceiras indicacións. Denominan ou etiquetan o artículo como 'indicacións de deseño'.",

position: 4

)

I18n.locale = "en"

text.content = "Design Brief blog post: Students add Design Brief 3 to the blog. They label or tag the post with “design brief”."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Artículo sobre o proceso de deseño: os estudantes empregan o seu rexistro de reflexións para rendir conta do que levaron a cabo, os desafíos que atoparon e os que prevén. A entrada de blog é etiquetada como 'proceso de deseño'.",

position: 5

)

I18n.locale = "en"

text.content = "Design Process blog post: Students use their reflection recording to write what they did, what challenges they had and what challenges they can foresee. They label or tag the post with “design process”."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Artículo sobre os resultados de deseño no blog: os estudantes publican a documentación do primeiro prototipo. Entre outros arquivos, poden empregar debuxos, vídeos e fotos dixitais ademais de descripcións. A entrada é etiquetada como 'resultados do deseño'.",

position: 6

)

I18n.locale = "en"

text.content = "Design Results blog post: Students add the documentation of their first prototype(s) to the blog. Among other files, they may use drawings, videos or digital photographs in addition to descriptions. Tey label or tag the post with “design results”."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

deseñoproducto.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

deseñoproducto.boxes << guidelines_assessment_box

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

deseñoproducto.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

ideas_box.components << header

ideas_box.components << itemize

deseñoproducto.boxes << ideas_box

I18n.locale = "en"

deseñoproducto.name = "ProductDesign"

deseñoproducto.description = "Based on their Design Brief 2 and their initial design ideas, students create their first prototype design. The students discuss their prototype and refine their design brief, especially in relation to the design result and the way the result addresses the identified design challenges. They then record a reflection and update their blog."

deseñoproducto.save

I18n.locale = "gl"

#Formar equipos

formarequipos = Activity.create(

timeToComplete: '1',

name: 'Formar equipos',

locale: 'gl',

description: 'Divida os alumnos na súa clase en equipos de 4-5 estudantes. Cada equipo traballa nun tema separado de investigación que está relacionado co tema do curso. Os estudantes suxiren temas do seu interese e son agrupados en conformidade, tendo tamén en conta as súas diferenzas para crear equipos funcionais heteroxéneos.', 

trace_id: nil,
trace_version: 1
)
formarequipos.reload
formarequipos.trace_id = formarequipos.id
formarequipos.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Motivar os alumnos, permitíndolles estudar temas nos que están interesados.",

position: 1

)

I18n.locale = "en"

text.content = "Motivating students by allowing them to study topics they are interested in."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Formación rápida de equipos heteroxéneos.",

position: 2

)

I18n.locale = "en"

text.content = "Forming heterogeneous teams quickly."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Compartir as túas notas mentais sobre estudantes para outros mestres.",

position: 3

)

I18n.locale = "en"

text.content = "Sharing your mental notes about students to another teachers."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

formarequipos.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Habilidades sociais ó traballar con alumnos distintos dos seus amigos.",

position: 1

)

I18n.locale = "en"

text.content = "Social skills by working with students other than their friends."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Unha comprensión máis profunda do seu tema de interese.",

position: 2

)

I18n.locale = "en"

text.content = "A deeper understanding of their topic of interest."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os fundamentos dos temas de traballo doutros equipos.",

position: 3

)

I18n.locale = "en"

text.content = "The basics of other teamwork topics."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Como as súas habilidades afectan ó seu progreso de aprendizaxe.",

position: 4

)

I18n.locale = "en"

text.content = "How their abilities affect their learning progress."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

formarequipos.boxes << learner_motivations

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

formarequipos.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

formarequipos.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Configura TeamUp engadindo nomes, retratos e notas mentais dos estudantes da clase.",

position: 1

)

I18n.locale = "en"

text.content = "Set up TeamUp by adding names, portraits and mental notes of the students in your class."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Lembra tamén engadir as habilidades dos alumnos coas linguaxes. Consulte o manual de referencia do TeamUp, parte 1 'Engadir e editar alumnos' para obter máis información.",

position: 2

)

I18n.locale = "en"

text.content = "Remember to also add your students’ language skills. See TeamUp tool manual, part 1 ‘Add and edit students’ for more information."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Decide se avaliar equipos ou individuos.",

position: 3

)

I18n.locale = "en"

text.content = "Decide whether you assess teams or individuals. "

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Podes imprimir un PDF cos retratos dos estudantes dende TeamUp. ",

position: 4

)

I18n.locale = "en"

text.content = "You may print the PDF of student portraits from TeamUp."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

formarequipos.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Presentar o tema do curso para facilitar aos alumnos información básica, deixando moitas cuestións en aberto.',

position: 1

)

I18n.locale = "en"

text.content = "Present the theme of the course as to provide students with basic information, while leaving many questions open."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Pide aos alumnos que pensen sobre o que lles gustaría estudar.',

position: 2

)

I18n.locale = "en"

text.content = "Ask students to think about what they would like to study. "

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

formarequipos.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Pide aos alumnos que suxiran temas para investigación e recolle as súas suxestións. Reformular, cambiar ou rexeitar suxestións.",

position: 1

)

I18n.locale = "en"

text.content = "Ask the students to suggest topics for inquiry and collect their suggestions. Rephrase, alter or reject suggestions."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Deixa ós alumnos que escollan os seus temas favoritos e crea equipos para que coincidan os alumnos coa súa elección do tema.",

position: 2

)

I18n.locale = "en"

text.content = "Let students choose for their favourite topics and create teams to match students with their topic choice."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Os alumnos comezan o traballo en equipo, que xeralmente se estende por varias leccións, probablemente todo o curso.",

position: 3

)

I18n.locale = "en"

text.content = "Students start teamwork, which usually spans across multiple lessons, probably the entire course."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

formarequipos.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Usa as túas notas mentais como unha guía para avaliar o rendemento dos alumnos e a súa mellora.",

position: 1

)

I18n.locale = "en"

text.content = "Use your mental notes as a guide in assessing student performance and improvement."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Podes debater criterios de avaliación cos alumnos, ou facer unha proba de diagnóstico ao comezo do curso para entender o que os alumnos xa saben e cales son os seus puntos débiles.",

position: 2

)

I18n.locale = "en"

text.content = "You may brainstorm assessment criteria with the students, or give a diagnostic test at the beginning of the course to understand what the students already know and what their weaknesses are."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

formarequipos.boxes << guidelines_assessment_box

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

formarequipos.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "É altamente recomendable a aplicación TeamUp para a formación de grupos que se basean en temas de interese dos alumnos e, en xeral, calquera formación dinámica de equipos. Con TeamUp recibes unha visión xeral das formacións de equipos.",

position: 1

)

I18n.locale = "en"

text.content = "It is highly recommended to use TeamUp for forming teams that are based on students’ topics of interest and overall teamwork dynamics. With TeamUp you receive a visual overview of the team formations."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Alternativamente, podes formar equipos de estudantes usando un método da súa escolla, ou usar unha ferramenta que coñece. Asegúrate de gardar este método, e explicar os seus beneficios.",

position: 2

)

I18n.locale = "en"

text.content = "Alternatively, you may form teams of students using a method of your choice, or use a tool you know. Make sure to record that method, and to explain its benefits."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "TeamUp permite gravar notas mentais, anexando emblemas ós alumnos. A partir deles, TeamUp pode xerar equipos heteroxéneos. Pode decidir o que significa cada emblema, por exemplo, o emblema do 'abejorro' pode referirse a un estudante que se distrae facilmente, que traballa duro, gustalle moverse, ...",

position: 3

)

I18n.locale = "en"

text.content = "TeamUp allows you to record mental notes by attaching badges to students. Based on these, TeamUp can generate heterogeneous teams. You can decide what each badge means, for example, the ‘bumblebee’ badge can refer to a student who is easily distracted, hard working, likes to move, or other."

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

formarequipos.boxes << ideas_box

I18n.locale = "en"

formarequipos.name = "Forming teams"

formarequipos.description = "Divide the students in your class into teams of 4-5 students. Each team works on a separate topic of inquiry that is related to the theme of the course. The students suggest topics they are interested in and are grouped accordingly, taking also into account their differences to create functional heterogeneous teams."

formarequipos.save

I18n.locale = "gl"

#Navegación orientada á aprendizaxe

Navegacion = Activity.create(

timeToComplete: '1',

name: 'Navegación orientada á aprendizaxe',

locale: 'gl',

description: 'O desenvolvemento de habilidades no século 21 inclúe a capacidade de usar internet dunha forma enfocada para atopar información relevante de fontes significativas. Nesta actividade, os alumnos usan Internet de forma estruturada para recoller información sobre un tema específico e para atopar recursos de aprendizaxe en liña que poden ser moi utilizados na súa investigación.', 

trace_id: nil,
trace_version: 1
)
Navegacion.reload
Navegacion.trace_id = Navegacion.id
Navegacion.save
#Teacher motivations

teacher_motivations = Box.create(

box_type: "left_half_box",

position: 1

)

header = Component.create(
component_type: "header",

position: 1

)

text = Text.create(

content: "O profesor pode esperar...",

position: 1

)

I18n.locale = "en"

text.content = "You may look forward to..."

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Uso de Internet dunha forma significativamente orientada á educación.",

position: 1

)

I18n.locale = "en"

text.content = "Using the Internet in a meaningful learning oriented way."

text.save

I18n.locale = "gl"

itemize.texts << text

teacher_motivations.components << header

teacher_motivations.components << itemize

Navegacion.boxes << teacher_motivations

# Learner motivations

learner_motivations = Box.create(

box_type: "right_half_box",

position: 2

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "Os estudantes poden aprender...",

position: 1

)

I18n.locale = "en"

text.content = "Students may learn"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Diferenciar fontes fiables e non fiables.",

position: 1

)

I18n.locale = "en"

text.content = "To differentiate trusted from non-trusted source."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Usar Internet para estar máis informado sobre un determinado tema.",

position: 2

)

I18n.locale = "en"

text.content = "Use the Internet to become more informed about a particular topic."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Organizar os seus favoritos e navegar a través de múltiples pestanas abertas.",

position: 3

)

I18n.locale = "en"

text.content = "To organize their bookmarks and navigate through multiple open tabs."

text.save

I18n.locale = "gl"

itemize.texts << text

learner_motivations.components << header

learner_motivations.components << itemize

Navegacion.boxes << learner_motivations

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

Navegacion.boxes << horizontal_rule_box

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

content: "Liñas de guía",

position: 1

)

I18n.locale = "en"

text.content = "Guidelines"

text.save

I18n.locale = "gl"

header.texts << text

guidelines_header_box.components << header

Navegacion.boxes << guidelines_header_box

#Guidelines preparation

guidelines_preparation_box = Box.create(

box_type: "left_half_box",

position: 5

)

header = Component.create(

component_type: "header",

position: 1

)

text = Text.create(

content: "1. Preparación",

position: 1

)

I18n.locale = "en"

text.content = "1. Preparation"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Identifica fontes de exemplo para mostrar aos alumnos.",

position: 1

)

I18n.locale = "en"

text.content = "Identify example sources to present to students."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Decide como os resultados da sesión de navegación son usados ​​no proxecto",

position: 2

)

I18n.locale = "en"

text.content = "Decide how the browsing session results are used in the project."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_preparation_box.components << header

guidelines_preparation_box.components << itemize

Navegacion.boxes << guidelines_preparation_box

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

content: "2. Introducción",

position: 1

)

I18n.locale = "en"

text.content = "2. Introduction"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: 'Discute situacións e modos de utilización da Internet: entretemento ou xogar xogos, social ou seguimento de amigos, atopar unha información específica ou aprender sobre un tema máis amplo. Enfatizar a necesidade de identificar e separar estes modos e finalidades na escola.',

position: 1

)

I18n.locale = "en"

text.content = "Discuss situations and modes of using the internet: entertainment or playing games, social or following friends, finding one specific piece of information or learning about a wider topic. Emphasize the need to identify and separate these modes and purposes in school."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Discute a comprensión dos alumnos dun recurso de aprendizaxe. Presente as súas fontes de exemplo. Cada alumno compón un plan do tipo de información que buscar (ou sexa, a investigación científica ou artigos, explicacións de sentido común, imaxes, vídeos ou animacións). Que van facer cos recursos atopados?',

position: 2

)

I18n.locale = "en"

text.content = "Discuss the students' understanding of a learning resource. Present your example sources. Each student composes a plan of the kind of information they browse for (i.e. scientific research or articles, commonsense explanations, pictures, videos, or animations). What will they do with the found resources?"

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Xunto cos alumnos identifica as fontes (ou sexa, arquivos en liña, sitios de novas, blogs, sitios de vídeo, foros comunitarios) onde buscar información.',

position: 3

)

I18n.locale = "en"

text.content = "Together with the students identify sources (i.e., online repositories, news sites, blogs, video sites, community forums) where to look for information."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: 'Amosar Diigo ós alumnos, deixalos crear unha conta, e amosalles como vincular as súas contas Diigo coas súas contas de Twitter. Se tes unha conta de Educador en Diigo, podes crear contas para os teus estudantes.',

position: 4

)

I18n.locale = "en"

text.content = "Show Diigo to the students, let them create an account, and show them how to link their Diigo accounts to their Twitter accounts. If you have a Diigo Educator account, you can create accounts for your students as well."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_introduction_box.components << header

guidelines_introduction_box.components << itemize

Navegacion.boxes << guidelines_introduction_box

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

content: "3. Desenrolo",

position: 1

)

I18n.locale = "en"

text.content = "3. Development"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Os alumnos buscan en Internet de acordo co seu plan. Sempre que recoñeza que o comportamento de navegación dos estudantes difire das súas intencións, inicia unha discusión sobre as súas razóns.",

position: 1

)

I18n.locale = "en"

text.content = "The students search the internet according to their plan. Whenever you recognize that the students’ browsing behavior differs from their intentions, start a discussion about their reasons."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Estudantes anotan os seus achados, incluíndo como e para que pretenden usar un recurso.",

position: 2

)

I18n.locale = "en"

text.content = "Students annotate their findings, including how and for what they intend to use a resource."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Para ciclos adicionais de navegación, os alumnos explicar como este ciclo será diferente do anterior.",

position: 3

)

I18n.locale = "en"

text.content = "For additional browsing cycles, students explain how this cycle will differ from the previous."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Pide ós teus alumnos que lean os comentarios sobre artigos de noticias en liña e entradas de blog, e logo expliquen a finalidade de cada comentarista nas súas anotacións.",

position: 4

)

I18n.locale = "en"

text.content = "Ask the students to read the comments on online news articles and blog entries, and to explain the purpose of each commenter in their annotations."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_development_box.components << header

guidelines_development_box.components << itemize

Navegacion.boxes << guidelines_development_box

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

content: "4. Avaliación",

position: 1

)

I18n.locale = "en"

text.content = "4. Assessment"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Avaliar a adecuación das fontes que os alumnos identificaron como relevantes.",

position: 1

)

I18n.locale = "en"

text.content = "Evaluate the appropriateness of the sources that the students identified as relevant."

text.save

I18n.locale = "gl"

itemize.texts << text

text = Text.create(

content: "Revisa a calidade das anotacións, prestando unha atención especial aos seus fluxos cualitativos e cuantitativos a través da proba.",

position: 2

)

I18n.locale = "en"

text.content = "Review the quality of annotations, and pay special attention to their qualitative and quantitative fluxes throughout the pilot."

text.save

I18n.locale = "gl"

itemize.texts << text

guidelines_assessment_box.components << header

guidelines_assessment_box.components << itemize

Navegacion.boxes << guidelines_assessment_box

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

Navegacion.boxes << horizontal_rule_box

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

content: "Ideas para empregar tecnoloxía",

position: 1

)

I18n.locale = "en"

text.content = "Ideas for using technology"

text.save

I18n.locale = "gl"

header.texts << text

itemize = Component.create(

component_type: "itemize",

position: 2

)

text = Text.create(

content: "Obtención de ligazóns: Usa ferramentas de marcado social para recoller ligazóns, comentarios e información adicional sobre recursos en liña e comparta coleccións de enlaces con outros. Por exemplo, pode utilizar Diigo (http://www.diigo.com), onde o profesor pode crear unha conta especial de educador para xestionar mellor os seus alumnos. Outros servizos adecuados inclúen ThinkBinder, Delicious, e Storify.",

position: 1

)

I18n.locale = "en"

text.content = "Collecting links: Use social bookmarking tools to collect links, comments and additional information about online resources, and share link collections with others. For example you can use Diigo (http://www.diigo.com), where the teacher can create a special educator account to better manage their students. Other suitable services include ThinkBinder, Delicious, and Storify."

text.save

I18n.locale = "gl"

itemize.texts << text

ideas_box.components << header

ideas_box.components << itemize

Navegacion.boxes << ideas_box

I18n.locale = "en"

Navegacion.name = "Learning oriented browsing"

Navegacion.description = "Developing 21st century skills includes building the ability to use the internet in a focused way to find relevant information from meaningful sources. In this activity, the students use the internet in a structured way to collect information about a specific topic, and to locate online learning resources that they can be critically used in their inquiry."

Navegacion.save








# Adds classroom
classroom_1a = Classroom.create(
  name: 'Classroom 1 A'
)

classroom_1b = Classroom.create(
  name: 'Classroom 1 B'
)

