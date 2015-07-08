# encoding: utf-8
I18n.locale = "en"
ExampleGuide = Guide.create(
  name: "Guide example",
  description: "This is the description of the guide example.",
  trace_version: 1,
  status: 'class'
)
ExampleGuide.reload
ExampleGuide.trace_id = ExampleGuide.id
ExampleGuide.save

I18n.locale = "gl"
ExampleGuide.name = "Guia de exemplo"
ExampleGuide.description = "Esta e a descripcion da guia de exemplo."
ExampleGuide.status="class"
ExampleGuide.save

I18n.locale = "en"
CreateObject = ActivitySequence.find_by_name("Create an object")
CreateObject_cloned = CreateObject.clone_with_associations
CreateObject_cloned.status = "instance"
CreateObject_cloned.name = "Create an object (copy)"
CreateObject_cloned.save

I18n.locale = "gl"
CreateObject = ActivitySequence.find_by_name("Crear un obxecto")
CreateObject_cloned = CreateObject.clone_with_associations
CreateObject_cloned.status = "instance"
CreateObject_cloned.name = "Crear un obxecto (copy)"
CreateObject_cloned.save


Owner=User.find_by_email("alice@edu-area.com")
ExampleGuide.owner=Owner
ExampleGuide.creator=Owner
ExampleGuide.activity_sequence=CreateObject_cloned
ExampleGuide.save


