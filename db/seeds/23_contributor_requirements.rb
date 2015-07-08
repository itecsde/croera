# encoding: utf-8
contributor_requirement = ContributorRequirement.create(
  name: "Needs an expert ICT service manager",
  optionality: "2",
  description: "This activity needs an expert ICT service manager"
)
contributor_requirement.person_category = PersonCategory.find_by_name('expert')
contributor_requirement.person_role = PersonRole.find_by_name('ICT service manager')

person_concrete_requirement = PersonConcreteRequirement.create(
  name: "Person concrete requirement",
  optionality: "1",
  description: "This activity needs a concrete person"
)
person_concrete_requirement.person = Person.find_by_name('Luis Anido')
