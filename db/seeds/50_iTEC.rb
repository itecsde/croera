# encoding: utf-8
iTEC = User.create(
email: 'itec@edu-area.com',
password: '11111111',
password_confirmation: '11111111'
)

I18n.locale = "en"
dream = Activity.find_by_name("Dream")
dream.creator = iTEC
dream.owner = iTEC
dream.save
iTEC.activities_owned << dream

explore = Activity.find_by_name("Explore")
explore.creator = iTEC
explore.owner = iTEC
explore.save
iTEC.activities_owned << explore

map = Activity.find_by_name("Map")
map.creator = iTEC
map.owner = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Reflect")
map.creator = iTEC
map.owner = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Make")
map.creator = iTEC
map.owner = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Ask")
map.owner = iTEC
map.creator = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Show")
map.owner = iTEC
map.creator = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Collaborate")
map.owner = iTEC
map.creator = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Design Brief")
map.creator = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Contextual Inquiry: Observation")
map.creator = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Contextual Inquiry: Benchmarking")
map.creator = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("ProductDesign")
map.creator = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Forming teams")
map.creator = iTEC
map.save
iTEC.activities_owned << map

map = Activity.find_by_name("Learning oriented browsing")
map.creator = iTEC
map.save
iTEC.activities_owned << map

I18n.locale = "en"
sequence = ActivitySequence.find_by_name("Create an object")
sequence.creator = iTEC
sequence.save
iTEC.activity_sequences_owned << sequence



I18n.locale = "en"
sequence = ActivitySequence.find_by_name("Tell a Story")
sequence.creator = iTEC
sequence.save
iTEC.activity_sequences_owned << sequence