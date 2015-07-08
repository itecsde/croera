# encoding: utf-8
require 'net/http'
require 'net/https'
require 'uri'


#require "capybara/dsl"
class ConceptAge
   include ActionView::Helpers::SanitizeHelper
   def document_age(document, wikipediator_ip = nil)
      begin
         total_age = 0.0
         wikipediator = Wikipediator.new
         wikipedia_year_zero = Date.parse("15 January 2001")
         concepts = wikipediator.wikify_it(document, wikipediator_ip)
         puts concepts
         concepts.each do |concept|
            url = "http://en.wikipedia.org/wiki/" + concept[:name]
            url = URI.encode(url)
            page = Nokogiri::HTML(open(url))
            view_history_url = page.css('div#p-views.vectorTabs ul li#ca-history.collapsible span a')[0]['href']
            view_history_url = "http://en.wikipedia.org/" + view_history_url
            page = Nokogiri::HTML(open(view_history_url))
            if !page.css("div#mw-content-text a.mw-lastlink").empty?
               creation_date_url = page.css("div#mw-content-text a.mw-lastlink")[0]['href']
               creation_date_url = "http://en.wikipedia.org/" + creation_date_url
               page = Nokogiri::HTML(open(creation_date_url))
            end
            creation_date = page.css("div#mw-content-text form#mw-history-compare ul#pagehistory li").last.css("a.mw-changeslist-date")[0].text      
            concept_age = (Date.parse(creation_date) - wikipedia_year_zero)       
            concept_age = concept_age.to_f / 365.0       
            total_age = concept_age + total_age
            puts concept[:name]
            puts creation_date
            puts concept_age
         end  
         document_age = total_age / concepts.size
         puts "Document age: " + document_age.to_s
      rescue Exception => e
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   def concept_name_commonness(concept, wikipediator_ip = nil)
      begin
         wikipediator = Wikipediator.new
         entries = wikipediator.search(concept)
         puts "Concept: " + concept.to_s
         article_id = entries[0][:id]
         url = "http://192.168.1.8:8080/wikipediaminer/services/exploreArticle?id=" + article_id.to_s + "&inLinks=true&outLinks=true&inLinkMax=1000000&outLinkMax=1000000"
         puts url
         page = Nokogiri::XML(open(url,:read_timeout => 20))
         total_inLinks = page.xpath("//message")[0][:totalInLinks]
         total_outLinks = page.xpath("//message")[0][:totalOutLinks]
         puts "inLinks number: " + total_inLinks.to_s
         puts "outLinks number: " + total_outLinks.to_s
      rescue Exception => e
         puts "Exception concept_name_commonness"
         puts e.exception
         puts e.backtrace.inspect
      end
   end
   
   def concept_id_commonness(article_id, max_inLinks, wikipediator_ip = nil)
      begin
         url = "http://192.168.1.8:8080/wikipediaminer/services/exploreArticle?id=" + article_id.to_s + "&inLinks=true&outLinks=true&inLinkMax=" + max_inLinks.to_s + "&outLinkMax=" + max_inLinks.to_s
         #puts url
         page = Nokogiri::XML(open(url,:read_timeout => 20))
         #if !page.xpath("//invalidIdMessage")[:error] != nil
            total_inLinks = page.xpath("//message")[0][:totalInLinks]
            if total_inLinks.to_i > max_inLinks
               total_inLinks = max_inLinks
            end
            total_outLinks = page.xpath("//message")[0][:totalOutLinks]
            #puts "inLinks number: " + total_inLinks.to_s
            #puts "outLinks number: " + total_outLinks.to_s
            return total_inLinks
         #end
      rescue Exception => e
         puts "Exception concept_id_commonness"
         puts e.exception
         puts e.backtrace.inspect
      end
   end
   
   def document_commonness(document, max_inLinks, wikify_threshold, wikipediator_ip = nil)
      begin
         document_total_inLinks = 0
         document.taggable_tag_annotations.where("weight >= ?", wikify_threshold).each do |annotation|
            total_inLinks = concept_id_commonness(annotation.wikipedia_article_id, max_inLinks)
            #puts "Links entrantes totales para el concepto " + annotation.wikipedia_article_id.to_s + " es " + total_inLinks.to_s
            document_total_inLinks = document_total_inLinks + total_inLinks.to_i
         end
         document_average_inLinks = document_total_inLinks.to_f / document.taggable_tag_annotations.where("weight >= ?", wikify_threshold).size.to_f
         puts "La media de links entrantes para este documento es: " + document_average_inLinks.to_s
         return document_average_inLinks
      rescue Exception => e
         puts "Exception document_commonness"
         puts e.exception
         puts e.backtrace.inspect
      end
   end
   
   def test (max_inLinks, wikify_threshold)
      begin
         ReutersNewItem.all.each do |item|
            puts "Subject / Level: " + item.topics + " / " + item.has_topics
            document_commonness(item, max_inLinks, wikify_threshold)
         end
      rescue Exception => e
         puts "Exception test"
         puts e.message
         puts e.backtrace.inspect
      end
   end
   
   def corpus_commonnes
      begin
         total_inLinks_corpus = 0.0
         ReutersNewItem.first(2).each do |document|
            document_average_inLinks = document_commonness(document)
            total_inLinks_corpus = total_inLinks_corpus.to_f + document_average_inLinks.to_f 
         end
         corpus_average_inLinks = total_inLinks_corpus.to_f / 2.0
         puts "Corpus Average inLinks: " + corpus_average_inLinks.to_s
      rescue Exception => e
         puts "Exception corpus_commonness"
         puts e.exception
         puts e.backtrace.inspect
      end
   end
   
   
   def create_text_bench
      primary_school_history = "LETTER I Page The Use of History Traditions and Poems 1 LETTER H Where the first People lived The earliest historical Time How the Earth became peopled 7 LETTER HI The first civilised Countries The Ruins of Assyria The Discovery of Nineveh Nineveh Feasts Nineveh Writings Symbolical Figures 1 3 LETTER IV Ancient Egypt What sort of country it was The Pyramids Pet Crocodiles Animals worshipped Sacred Dogs and Cats 25LETTER X and its chief cities Tyre and Sidon Their trade and riches 73 LETTER XL kind of country Greece was Greek and Sculptures Attica The heroes of Greece Homer's Poem about the Greek Kings Queens and Princesses 79 LETTER XII of the Greeks from Troy The Olympic The Promised Land The Judges Kings of Israel Solomon and the Temple The Division of the Kingdom 93 LETTER XIII Babylon The Captivity of the Jews was doing in Greece Lycurgus The of Lycurgus 105 LETTER XIV Return of Lycurgus What he did in Strange Laws The Boys andGirls Sparta Was Lycurgus a wise Man 115 LETTER XV King Codrus Draco the Law maker Solon the Law maker 125 LETTER XVI first People of Italy Old Stories Italy The Etruscans Story of Romulus and Story of Horatius Mutius Scae Patricians and Plebeians The Gauls Rome 133  LETTER XVII Page The Glories of Greece Greek Books Bad Customs The Quarrel with Darius 150 LETTER XVIII King Xerxes and the Mountain Leonidas and his Spartans The Wooden Walls of Athens Themistocles After the Victory of Sa lamis What became of him 158 LETTER XIX Cleverness of the Greeks Alexander of Mace don The Decline of Greece Alexander the Great His Conquests His Character His Death 170 LETTER XX Rome Julius Caesar The Ancient People of England The Ancient City of Rome Roman Houses Villas and Public Buildings 184 LETTER XXL Roman People under the Empire Sports of the Amphitheatre Luxury and Gluttony The Slaves in Rome 196 LETTER XXII The Roman Emperors Germany at that Time Loss of a Roman Army The Emperor Tiberius The Emperor Nero Good and bad Times The War in Britain 204 LETTER XXIII Early Christians Persecution of the Christians The Decline of the Empire The Emperor Constantine Change of the Seat of Empire 218 LETTER XXIV Barbarians More and more Barbarians The Saxons in Britain Alaric the Goth Attila the Hun The miseries of the Time The State of Europe The Circus The Greens and the Blues 228 LETTER XXV Europe looked now Clovis King of the Franks The Lazy Kings The Saracens Mahomet The Saracen Conquests Charlemagne What Work he had to do Wars with the Saxons 245 LETTER XXVI at home His Love of Learning Great Public Works His Coronation by the Pope What the Popes afterwards said 266 LETTER XXVII P Northmen or Danes The Sea Kings Their great Valour Their Love of Poetry Canute and his Successors LETTER XXVIII Times of the Feudal System The Poor People The Peace of God 288 LETTER XXIX in the Eleventh Century Travelling in those Days The Successors of Charlemagne The Northmen in France The Emperors of Germany 295 LETTER XXX Clergy in the Middle Ages The Beginning of Convents The Good and Harm of them The Laws about Criminals The Power of the Clergy 305 LETTER XXXI Gregory the Seventh The Emperor Henry the Fourth The Emperor's Penance Wars of Popes and Emperors Penance of the King of England Submission to the Church 816 LETTER XXXII Crusades Peter the Hermit Grand Meeting at Clermont The first Army of Page Crusaders Other Crusaders Tancred of Sicily The taking of Jerusalem The Generosity of Tancred King Louis IX of France Enguerraud de Couci The Justice of King Louis 330 LETTER XXXIII Effects of Crusades Italian and German Cities Increase of Knowledge Useful Inventions The Art of Printing 352 LETTER XXXIV of France and England The Wars of the Roses The taking of Constantinople Discovery of Cape of Good Hope Columbus Discovery of America The People who lived there Their Character Why called America Promises made to Columbus How they were kept Misfortunes of Columbus His Death Progress made since State of the Working People The last important Event 362 Tables 3  "
      secondary_school_history = "
UNIT 1: EARLY CIVILIZATIONS (Prehistory–A.D. 1570)

Chapter 1: Foundations of Civilization (Prehistory–3000 B.C.)
Chapter 2: Ancient Middle East and Egypt (3200 B.C.–500 B.C.)
Chapter 3: Ancient India and China (2600 B.C.–A.D. 550)
Chapter 4: Ancient Greece (1750 B.C.–133 B.C.)
Chapter 5: Ancient Rome and the Rise of Christianity (509 B.C.–A.D. 476)
Chapter 6: Civilizations of the Americas (Prehistory–A.D. 1570)
UNIT 2: REGIONAL CIVILIZATIONS

Chapter 7: The Rise of Europe (500–1300)
Chapter 8: The High and Late Middle Ages (1050–1450)
Chapter 9: The Byzantine Empire, Russia, and Eastern Europe (330–1613)
Chapter 10: Muslim Civilizations (622–1629)
Chapter 11: Kingdoms and Trading States of Africa (730 B.C.–A.D. 1591)
Chapter 12: Spread of Civilization in East and Southeast Asia (500–1650)
UNIT 3: EARLY MODERN TIMES

Chapter 13: The Renaissance and Reformation (1300–1650)
Chapter 14: The Beginnings of Our Global Age: Europe, Africa, and Asia (1415–1796)
Chapter 15: The Beginnings of Our Global Age: Europe and the Americas (1492–1750)
Chapter 16: The Age of Absolutism (1550–1800)
UNIT 4: ENLIGHTENMENT AND REVOLUTION

Chapter 17: The Enlightenment and the American Revolution (1700–1800)
Chapter 18: The French Revolution and Napoleon (1789–1815)
Chapter 19: The Industrial Revolution Begins (1750–1850)
Chapter 20: Revolutions in Europe and Latin America (1790–1848)
UNIT 5: INDUSTRIALISM AND A NEW GLOBAL AGE

Chapter 21: Life in the Industrial Age (1800–1914)
Chapter 22: Nationalism Triumphs in Europe (1800–1914)
Chapter 23: Growth of Western Democracies (1815–1914)
Chapter 24: The New Imperialism (1800–1914)
Chapter 25: New Global Patterns (1800–1914)
UNIT 6: WORLD WARS AND REVOLUTIONS

Chapter 26: World War I and the Russian Revolution (1914–1924)
Chapter 27: Nationalism and Revolution Around the World (1910–1939)
Chapter 28: The Rise of Totalitarianism (1919–1939)
Chapter 29: World War II and Its Aftermath (1931–1955)
UNIT 7: THE WORLD SINCE 1945

Chapter 30: The Cold War (1945–1991)
Chapter 31: New Nations Emerge (1945–Present)
Chapter 32: Regional Conflicts (1945–Present)
Chapter 33: The Developing World (1945–Present)
Chapter 34: The World Today
"
      university_history = "Contents
Preface
Ann Katherine Isaacs, Guðmundur Hálfdanarson
............................................................
pag. IX
Introduction
Seija Jalagin, Susanna Tavera, Andrew Dilley
...............................................................
»
XI
World History and Global History: Concepts and Theories
World History: A Brief Introduction
Janny de Jong
...................................................................................................................
»
1
Globalisation as a Field of Study for Historians
Janny de Jong
...................................................................................................................
»
13
Globalisation before Globalisation: The Case of the Portuguese
World Empire, 1415-1808
Stefan Halikowski Smith
................................................................................................
»
25
Samarkand: The Peripheral Core of World History
Sebastian Stride
..............................................................................................................
»
47
China’s View of the World
Arakawa Masaharu
........................................................................................................
»
59
The Idea of World History in Japan
Takenaka Toru
................................................................................................................
»
69
Sub-Saharan Africa’s Place in Global History
Klaus van Eickels
............................................................................................................
»
79
Russian/Soviet Historiography on World History
(and its Impact on Historiographies in the Soviet Satellite States)
Jakub Basista
...................................................................................................................
»
91
American Exceptionalism: The American Dream and the Americanization
of East-Central Europe
Halina Parafianowicz
.....................................................................................................
»
107
World, Global, and Imperial History in British Historiography
Andrew Dilley
.................................................................................................................
»
123
Introducing World History to Young Readers: The Case of Ernst Gombrich
and Fernand Braudel
Maria Efthymiou
............................................................................................................
»
137
Toolbox
- Classical Texts
A Clash of Empires: Herodotus’ Histories
Gerhard Dohrn-van Rossum
........................................................................................
»
145
A Universal History of the Roman Empire: Polybius’
Histories
Gerhard Dohrn-van Rossum
........................................................................................
»
147
Xuan-zhuang, Bian-ji and
Da-Tang Xi-yu-ji
Arakawa Masaharu
......................................................................................................
»
151
Du You: The
Tongdian
Arakawa Masaharu
......................................................................................................
»
153
Kitabatake Chikafusa:
A Chronicle of Gods and Sovereigns
(c. 1343)
Takenaka Toru
..............................................................................................................
»
155
Tomás de Mercado and a World Wide Economy (1571)
Susanna Tavera
............................................................................................................
»
157
Evliya Çelebi and Passages from his
Seyahatname
Maria Efthymiou
..........................................................................................................
»
161
Friedrich Schiller: What Is, and to What End do We Study,
Universal History? (1789)
Gerhard Dohrn-van Rossum
........................................................................................
»
165
Karl Marx and Friedrich Engels on World History, on Historical Change,
Transnational History, Interconnectedness, and on Periodization
Susanna Tavera
............................................................................................................
»
171
Fukuzawa Yukichi:
An Outline of a Theory of Civilization
(1875)
Takenaka Toru
..............................................................................................................
»
177
Noro Eitarō:
A History of the Development of Japanese Capitalism
(1930)
Takenaka Toru
..............................................................................................................
»
179
Umesao Tadao and
An Ecological View of History: Japanese Civilization in the
World Context
(1974)
Takenaka Toru
..............................................................................................................
»
181
- World Views and World History on Maps
Ptolemy: Mapping the Globe
Maria Efthymiou, Gerhard Dohrn-van Rossum
.........................................................
»
183
Seiiki no Chizu: Map of China and Westward (8th Century)
Arakawa Masaharu
................................................................................................................
»
187
The Osma Beatus Map: A Medieval and Christian View of the World (1086)
Susanna Tavera
.......................................................................................................................
»
189
Al-Idrīsī and His World Map (1154)
Gerhard Dohrn-van Rossum
.................................................................................................
»
193
The Hereford World Map: A Medieval Encyclopaedic and Religious
Representation (c. 1300)
Susanna Tavera
.......................................................................................................................
»
199
The Globe Divided: The Treaty of Tordesillas (1494) and Cantino’s
World Map (1502)
María Jesús Cava Mesa
..........................................................................................................
»
203
The Waldseemüller Map: Naming America (1507)
Gerhard Dohrn-van Rossum
.................................................................................................
»
211
Mercator World Map (1569)
Janny de Jong
............................................................................................................................
»
217
Bankoku Sôzu: General Map of the World (1645)
Takenaka Toru
.........................................................................................................................
»
227
Tenjiku no Zu: Map of India (1704-1711)
Takenaka Toru
.........................................................................................................................
»
229
A Beginning of Global History?
Gerhard Dohrn-van Rossum, Andrew Dilley
.....................................................................
"
      primary_school_geography = "Planet Earth
Landscapes
Coasts
Seas and
oceans
Restless Earth
Water
Water around
us
Learning about
rivers
Rivers in action
Drinking water
Weather Weather
worldwide
Weather
patterns
The seasons
Local weather
Settlements
Villages
Towns
Cities
Planning issues
Work and travel
Tr a vel
Food and shops
Jobs
Transport
problems
Environment
Caring for the
countryside
Caring for towns
Pollution
Conservation
United Kingdom
Scotland
Northern Ireland
Wales
England
Europe
France
Germany
Greece
European Union
North and South
America
South America
Chile
North America
The Rocky
Mountains
North America
Jamaica
South America
The Amazon
Asia and Africa
Asia
India
Asia
UAE
Africa
Kenya
Asia
Singapore
lanet Earth
Landscapes
The Earth’s
surface
The shape of
the land
Investigating
landscapes
Water
Water around
us
A wet planet
The effects of
water
Recording water
Weather Weather
worldwide
Different types
of weather
Living in hot and
cold places
Sunshine
matters
Settlements
Villages A village
community
Different types
of village
Investigating
villages
Work and travel
Tr a vel
Ways of
travelling
Finding your
way
Routes and
journeys
Environment
Caring for the
countryside
Wildlife
around us
Protecting
wildlife
Improving our
surroundings
United Kingdom
Scotland
Introducing
Scotland
Edinburgh:
The capital city
of Scotland
Mull: A Scottish
Island
Europe
France
Introducing
France
Growing Food
Making cars
North and South
America
South America
Introducing
South America
Spotlight on
Chile
The Galapagos
Islands
Asia and Africa
Asia
South America
Introducing Asia
India: A country
in Asia
Pallipadu: A
village in India"

      secondary_school_geography = "CONTENTS
PART - I : THEORY
BIOSPHERE
UNIT - I
1. Plants, Animals and Humans 1
2. The Human Potential 21
UNIT - II
HUMAN - MADE ECOSYSTEMS - I
3. Settlement Systems 41
4. Industrial Systems 57
5. Trade Systems 69
UNIT - III
HUMAN - MADE ECOSYSTEMS - II
6. Transport and Communication Systems 83
7. Space Technologies 105
UNIT - IV
ENVIRONMENTAL DEGRADATIONS / MANAGEMENT
8. Global Freshwater 121
9. Natural Disasters 149
10. Conservation and Resource Management 183
PART - II : PRACTICALS
UNIT - V
MAP INTERPRETATION AND SURVEYING
11. Map Interpretation 209
12. Surveying 227
UNIT - VI
GEOGRAPHICAL INFORMATION SYSTEMS
13. Database Management Systems and Geographical
Information systems 241
14. Global Positioning Systems"

      university_geography = "A course about geography and a geography course
ii)
Course content: a balance between the phil
osophy of geography, the
theories of the discipline and geography as an applied spatial science
iii)
Emphasis on learning and using the techniques and methods of
geography
iv)
Concrete illustrations of the geography of the world, at scales ranging
from t
he local to the global.
b)
Some Practical Matters
i)
Marks: tutorial (lab), tests, exams
ii)
Office hours, problem solving
iii)
The textbooks and other materials
iv)
How to be a successful learner
Unit 2.
THE EVOLUTION OF GEOGRAPHY
(Getis 13
th
pg
1
-
19, 49, 159, 198
-
199, 311, 433) or
(Getis 1
4
th
pg 1
-
18
,
The 4
traditions
of Geography in OWL
)
a)
Geography what is it? The purpose of geography
b)
Geographers, how do we view the world
c)
Environmental Determinism vs
.
Possibilism
d)
Schools of geogr
aphy and branches of the discipline
e)
The four traditions
of
geography
f)
The field today: different approaches, e.g., quantitative and qualitative
geography, environmental studies and systems
g)
The scientific method
h)
Models and data collection
Unit 3
.
THE TOOLS OF GEOGRAPHY:
An introduction to the methods and the techniques used in the discipline.
(Getis 13
th
pg 20
-
47 and Appendix 1) or
(Getis 1
4
th
pg 19
-
44
and Appendix 1)
a)
Maps, and its properties
-
symbols and scales
b)
The many different way
maps can be constructed
, map projections
c)
Air photos
d)
Satellite imagery
e)
Visual presentations; diagrams, sketches, tables
, geographic data
f)
The use of computers in Geography
g)
Introduction to G.I.S.
Unit 4.
SOME GENERAL CONCEPTS:
Some of the
basic ideas in the field of Geography at large.
(Getis 13
th
Chapter 7 or
(Getis 14
th
Chapter 6
a)
Structure, process and stage
b)
Sequent occupance, the Norfolk sand plain
c)
Location
-
decision process
d)
Culture and Landscape, reading the landscape
U
nit 5.
INTRODUCTION TO LANDFORMS (GEOMORPHOLOGY)
(Getis
13
th
and 14
th
Chapter
3
,
Physical Geography : Landforms)
a)
The earth's crust (SIMA, SIAL) and classes of rocks (Rock Cycle)
b)
The shaping of landforms: exogenous and endogenous processes
c)
Evid
ence for plate tectonics
d)
Weathering processes: physical and chemical
e)
Mass wasting processes
f)
Processes of devastation and human response; earthquakes, Tsunami
and volcanoes
Unit 6.
FLUVIAL ACTION AND THE WORK OF MOVING WATER
(Getis 13
th
pg 68
-
75,
393
-
404) or
(Getis 1
4
th
pg 59
-
73, 380
-
389
)
a)
Water on the Earth’s surface
b)
Some basic concepts of hydrology: velocity, slope, volume, load, gradient
c)
The erosion cycle
d)
Stream patterns to hydrology
e)
Flooding: our response to devastation and seeki
ng for control
f)
Water and its availability
g)
Shorelines: A special case of water in motion.
h)
Waves generation and movements
i)
Coastal environment and movements of sediments
j)
Human impacts on coastal environments
Unit 7.
AN INTRODUCTION TO HISTORIC
AL AND POLITICAL GEOGRAPHY
(Getis 13
th
Ch
apter
9, Political Geography and pg 144
-
147) or
(Getis 1
4
th
Chapter 8
, Political Geography and pg
363
-
366
)
a)
Changing land uses: The Dust Bowl, America 1930's
b)
A study of boundaries, constructive
-
destructive
forces
c)
State, Nation, and Nation State
d)
Subsequent, Antecedent, and Superimposed boundaries
e)
State Identity
–
Centrifugal and Centripetal forces
f)
Expanding boundaries to ocean space
–
UNCLOS
g)
Drama on the high seas
–
conflicts and disputes
Un
it 8
.
BASIC ELEMENTS OF WEATHER AND CLIMATE
(
Getis 13
th
and 14
th
Chapter 4
, Physical Geography: Weather and Climate)
a)
The earth's atmosphere
–
properties and composition of gases.
b)
Classification of the atmosphere
c)
Energy movements and the heat bal
ance: nature of
inputs and outputs of
energy,
blackbody radiation, thermodynamics, Earth’s energy receipt,
energy transfers, latent heat
d)
Global energy transfers
e)
Adiabatic processes, ELR, DALR, SALR,
f)
Absolute and relative humidity
g)
Atmospheri
c stability
h)
Atmospheric circulation and winds, pressure gradient force, Coriolis force,
pressure belts and winds
i)
Global circulation
j)
Weather forming systems, lake effect snows, lifting mechanisms
k)
Formation of mid
-
latitude cyclones and fronts, A
ir masses, warm and cold
fronts, Cyclogenesis
l)
Weather systems, thunderstorms, tropical cyclones, tornadoes
Unit 9
.
CLIMATES OF THE WORLD
(Getis 13
th
and 14
th
Chapter 4, Physical Geography: Weather and Climate)
a)
A matter of classification Koppen
b
)
The characteristics of world climates
c)
Factors controlling climates
d)
El
-
Nino ENSO and its effects on people
Unit 10
.
CLIMATIC CHANGE (Environmental Change)
(Getis 13
th
pg 70
-
74 and 112
-
116) or
(Getis 1
4
th
pg 65
-
68 and 104
-
109
)
a)
Evidence for clim
atic (environmental) change.
b)
Dating of evidence,
dating techniques,
14
C, Pollen, Dendrochronology
c)
The past glacial periods, Milankovitch
d)
Environmental change
-
what does the evidence say?
e)
Disappearing mountain glaciers, Arctic sea ice, atmospher
ic CO
2
changes,
global temperature increases
f)
The future? Anthropocene I=
P
x
A
x
T
g)
Glaciers and landforms from moving ice
h)
Accumulation zone, Equilibrium line, Ablation zone
i)
Glacial landforms, Periglacial landscapes
Unit 11
.
SOILS OF THE WO
R
LD An introduction to Pedology
(Getis 13
th
pg 62
-
64 (weathering), 144
-
147, Appendix 2) or
(Getis 1
4
th
pg 56
-
58 (weathering), 363
-
366
, Appendix 2)
a)
A matter of classification
b)
Soil forming processes
c)
Soil profiles and types
d)
Water/soil interacti
on, factors affecting infiltration
e)
Soil destruction, significance of soil erosion
Unit 12
.
ECONOMIC GEOGRAPHY
(Getis 13
th
Chapter 10 or
(Getis 14
th
Chapter 9, and 10
a)
A
matter of classification, and the development of a mindset
b)
Adam Smith, Davi
d Ricardo, Karl Marx
c)
The conservative, the liberal, the radical mindset
d)
Von Thunen: model of agricultural land use
e)
Weber: Location theory
f)
Finding the best location
g)
Asking how much is enough?
-
Affluenza
Unit 13
.
POPULATION GEOGRAPHY
(
Getis
13
th
and 14
th
Ch
apter
6)
a)
What is Population Geography? What is population growth?
b)
Basic demographic processes
c)
The impact of the Fertility Rate
d)
Demographic Transition
e)
Population Prospects
Unit 14
.
AN INTEGRATED LOOK AT A HUMAN ENVIRONMENT
COMPLEX
(Getis
13
th
Ch
apter
5 Geography of Natural Resources and
Chapter
12 Human
Impact on the Environment)
(Getis 14
th
Chapter 12 Geography of Natural Resources and Chapter 13 Human
Impact on the Environment)
a)
Definition of a resource
b)
Resource T
ype: Renewable, Non
-
renewable; Stocks and Flows
c)
The ecosystem concept and maximum sustained yield
d)
Resource management
e)
Sustainable development
f)
Environmental Ethics
g)
Planet in peril?
Unit 15
.
ORDER IN THE SYSTEM: CENTRAL PLACES:
An Introdu
ction to Urban Geography
(
Getis 13
th
and 14
th
Chapter 11
A Urban World)
a)
Characteristics of urban settlements, major urban functions
b)
Abstracting reality, the role of models
c)
The morphology of cities
d)
Christaller’s Central place theory
e)
A
hie
rarchy of c"

      primary_school_maths = "
Our mission
We further the mission of the University of Cambridge
by disseminating knowledge in the pursuit of education,
learning and research at the highest international levels
of excellence.
We value
To progress towards our mission, our strategy has
five main elements:
•
High standards of learning and scholarship
•
Delivering for our customers and authors
•
Creativity and innovation
•
Integrity, personal and financial responsibility
•
Collaboration and openness.
Achievement through excellence
We at Cambridge University Press International Education are driven by a simple imperative:
to work alongside educators and learners to provide individuals with accessible, inspirational
learning resources that lead them to a lifetime of achievement. We are proud to share the gold-
standard tradition and contemporary relevance of the University of Cambridge. For us, academic
rigour, innovative thinking and leading edge practices are crucial aspects of delivering the
excellent, fully rounded education that the 21st-century learner demands.
Cambridge University Press is a world-leading international education publisher, providing
educational materials, resources and services to teachers and learners, from ages 3-19, in over
160 countries.
We are a not-for-profi t organisation and follow the core values of the University of Cambridge,
ensuring all of our publishing refl ects the Cambridge standards around encouraging and
supporting critical thinking, thinking skills, problem solving and creativity.
Through our comprehensive and high-quality print, digital and online resources, we aim to
enable thousands of learners worldwide to advance their learning, knowledge and abilities, and
to successfully pass their exams and assessment criteria.
We work with innovative and aspiring authors with extensive knowledge of the education
market and curriculum developments. Our teachers and learners can expect support and
customer care from a dedicated specialist global team of representatives and agents.
In an ever-changing global educational environment, Cambridge University Press aims to
innovate, inspire and lead the way in educational excellence.
education.cambridge.org
A view from the publisher... why
we have commissioned Cambridge
Primary Mathematics
An investigatory approach to learning
the skills of problem solving with an
international focus
Methodology and approach
These resources for primary maths are informed by the most up-to-date teaching
philosophies based on research from around the world. They aim to support
teachers to help all learners become confident and successful mathematicians
through a fun and engaging course. Through an investigatory approach, children
learn the skills of problem solving in the context of the other mathematical
strands in the course (number, handling data, measure and geometry). The
course will encourage learners to be independent thinkers with the confidence to
tackle a wide range of problems and who understand the value and relevance of
their mathematics. Classroom discussion is encouraged to help learners become
good mathematical communicators, to justify answers and to make connections
between ideas.
Components
The
Teacher’s Resources with CD-ROM
s pull everything together to fully support teachers
to deliver a complete course. Detailed lesson plans are offered, with additional activities
suggested so you can adapt the lessons to the needs of your students. Strategies on
encouraging mathematical dialogue and advice on formative assessment, differentiation,
vocabulary and prior knowledge and a clear objective mapping grid are provided to help
you plan your teaching. Answers to the questions in the learner’s book and all photocopiable
sheets required are provided. Everything is also included on a CD in the back for convenience.
The
Learner’s Books
contain fun and engaging activities, questions, investigations and games,
presented in an attractive design, that link to the activities in the teacher’s resource. With non-
native English speakers in mind, great care has been made to ensure language is simple and
vocabulary is defi ned visually.
The
Games Books with CD-ROMs
are related to the learning objectives in the teacher’s
resource chapters and can be used in class or at home. There is advice to teachers on how the
games should be played to get the most out of them and projectable PowerPoint slides give
instructions to the learners. All games boards are included.
We hope you enjoy your sample copy and don’t forget to visit
education.cambridge.org/cambridgeprimary
to fi nd out more!
The International Education team
are related to the learning objectives in the teacher’s
resource chapters and can be used in class or at home. There is advice to teachers on how the
games should be played to get the most out of them and projectable PowerPoint slides give
instructions to the learners. All games boards are included.
We hope you enjoy your sample copy and don’t forget to visit
to fi nd out more!
"
      secondary_school_maths = "Contents
I Basics
1
1 Introduction to Book
3
1.1 The Language of Mathematics . . . . . . . . . . . . . . . . . . . . . . . .
. . . 3
II Grade 10
5
2 Review of Past Work
7
2.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 7
2.2 What is a number? . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
2.3 Sets . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
2.4 Letters and Arithmetic . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 8
2.5 Addition and Subtraction . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 9
2.6 Multiplication and Division . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 9
2.7 Brackets . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
2.8 Negative Numbers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 10
2.8.1 What is a negative number? . . . . . . . . . . . . . . . . . . . . . . . . 1
0
2.8.2 Working with Negative Numbers . . . . . . . . . . . . . . . . . . . . .
. 11
2.8.3 Living Without the Number Line . . . . . . . . . . . . . . . . . . . . .
. 12
2.9 Rearranging Equations . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 13
2.10 Fractions and Decimal Numbers . . . . . . . . . . . . . . . . . . . . .
. . . . . 15
2.11 Scientific Notation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 15
2.12 Real Numbers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
16
2.12.1 Natural Numbers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
7
2.12.2 Integers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
2.12.3 Rational Numbers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
17
2.12.4 Irrational Numbers . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 19
2.13 Mathematical Symbols . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 20
2.14 Infinity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
20
2.15 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 20
3 Rational Numbers - Grade 10
23
3.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 23
3.2 The Big Picture of Numbers . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 23
3.3 Definition . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
4
vii
CONTENTS
CONTENTS
3.4 Forms of Rational Numbers . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 25
3.5 Converting Terminating Decimals into Rational Numbers
. . . . . . . . . . . . . 25
3.6 Converting Repeating Decimals into Rational Numbers . .
. . . . . . . . . . . . 26
3.7 Summary . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
3.8 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 27
4 Exponentials - Grade 10
29
4.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 29
4.2 Definition . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
9
4.3 Laws of Exponents . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
30
4.3.1 Exponential Law 1:
a
0
= 1
. . . . . . . . . . . . . . . . . . . . . . . . . 30
4.3.2 Exponential Law 2:
a
m
×
a
n
=
a
m
+
n
. . . . . . . . . . . . . . . . . . . 30
4.3.3 Exponential Law 3:
a
−
n
=
1
a
n
, a
6
= 0
. . . . . . . . . . . . . . . . . . . 31
4.3.4 Exponential Law 4:
a
m
÷
a
n
=
a
m
−
n
. . . . . . . . . . . . . . . . . . . 32
4.3.5 Exponential Law 5:
(
ab
)
n
=
a
n
b
n
. . . . . . . . . . . . . . . . . . . . . 32
4.3.6 Exponential Law 6:
(
a
m
)
n
=
a
mn
. . . . . . . . . . . . . . . . . . . . . 33
4.4 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 34
5 Estimating Surds - Grade 10
37
5.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 37
5.2 Drawing Surds on the Number Line (Optional) . . . . . . . . . . . .
. . . . . . 38
5.3 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 39
6 Irrational Numbers and Rounding Off - Grade 10 41
6.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 41
6.2 Irrational Numbers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 41
6.3 Rounding Off . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
6.4 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 43
7 Number Patterns - Grade 10
45
7.1 Common Number Patterns . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 45
7.1.1 Special Sequences . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
46
7.2 Make your own Number Patterns . . . . . . . . . . . . . . . . . . . . . . . .
. . 46
7.3 Notation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
7
7.3.1 Patterns and Conjecture . . . . . . . . . . . . . . . . . . . . . . . . .
. 49
7.4 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
0
8 Finance - Grade 10
53
8.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 53
8.2 Foreign Exchange Rates . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 53
8.2.1 How much is R1 really worth? . . . . . . . . . . . . . . . . . . . . . . .
53
8.2.2 Cross Currency Exchange Rates . . . . . . . . . . . . . . . . . . . . .
. 56
8.2.3 Enrichment: Fluctuating exchange rates . . . . . . . . . . .
. . . . . . . 57
8.3 Being Interested in Interest . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 58
viii
CONTENTS
CONTENTS
8.4 Simple Interest . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 59
8.4.1 Other Applications of the Simple Interest Formula . . . .
. . . . . . . . . 62
8.5 Compound Interest . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
64
8.5.1 Fractions add up to the Whole . . . . . . . . . . . . . . . . . . . . . . .
65
8.5.2 The Power of Compound Interest . . . . . . . . . . . . . . . . . . . . .
. 66
8.5.3 Other Applications of Compound Growth . . . . . . . . . . . . . .
. . . 67
8.6 Summary . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
8.6.1 Definitions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
8.6.2 Equations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
8.7 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 69
9 Products and Factors - Grade 10
71
9.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 71
9.2 Recap of Earlier Work . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 71
9.2.1 Parts of an Expression . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
1
9.2.2 Product of Two Binomials . . . . . . . . . . . . . . . . . . . . . . . . .
71
9.2.3 Factorisation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
2
9.3 More Products . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
74
9.4 Factorising a Quadratic . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 76
9.5 Factorisation by Grouping . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 79
9.6 Simplification of Fractions . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 80
9.7 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 82
10 Equations and Inequalities - Grade 10
83
10.1 Strategy for Solving Equations . . . . . . . . . . . . . . . . . . . .
. . . . . . . 83
10.2 Solving Linear Equations . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 84
10.3 Solving Quadratic Equations . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 89
10.4 Exponential Equations of the Form
ka
(
x
+
p
)
=
m
. . . . . . . . . . . . . . . . . 94
10.4.1 Algebraic Solution . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 94
10.5 Linear Inequalities . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 97
10.6 Linear Simultaneous Equations . . . . . . . . . . . . . . . . . . . .
. . . . . . . 100
10.6.1 Finding solutions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
100
10.6.2 Graphical Solution . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 100
10.6.3 Solution by Substitution . . . . . . . . . . . . . . . . . . . . . . . .
. . 102
10.7 Mathematical Models . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 104
10.7.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
104
10.7.2 Problem Solving Strategy . . . . . . . . . . . . . . . . . . . . . . .
. . . 105
10.7.3 Application of Mathematical Modelling . . . . . . . . . . .
. . . . . . . 105
10.7.4 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . .
. 107
11 Functions and Graphs - Grade 10
109
11.1 Introduction to Functions and Graphs . . . . . . . . . . . . . . .
. . . . . . . . 109
11.2 Functions and Graphs in the Real-World . . . . . . . . . . . . . .
. . . . . . . . 109
ix
CONTENTS
CONTENTS
11.3 Recap . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
0
11.3.1 Variables and Constants . . . . . . . . . . . . . . . . . . . . . . . . .
. . 110
11.3.2 Relations and Functions . . . . . . . . . . . . . . . . . . . . . . . .
. . . 110
11.3.3 The Cartesian Plane . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
111
11.3.4 Drawing Graphs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
1
11.3.5 Notation used for Functions . . . . . . . . . . . . . . . . . . . . . .
. . 112
11.4 Characteristics of Functions - All Grades . . . . . . . . . . . .
. . . . . . . . . . 114
11.4.1 Dependent and Independent Variables . . . . . . . . . . . . .
. . . . . . 115
11.4.2 Domain and Range . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
5
11.4.3 Intercepts with the Axes . . . . . . . . . . . . . . . . . . . . . . . . .
. 115
11.4.4 Turning Points . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
116
11.4.5 Asymptotes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 116
11.4.6 Lines of Symmetry . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
16
11.4.7 Intervals on which the Function Increases/Decreases . . .
. . . . . . . . 116
11.4.8 Discrete or Continuous Nature of the Graph . . . . . . . . . .
. . . . . . 117
11.5 Graphs of Functions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 118
11.5.1 Functions of the form
y
=
ax
+
q
. . . . . . . . . . . . . . . . . . . . . 118
11.5.2 Functions of the Form
y
=
ax
2
+
q
. . . . . . . . . . . . . . . . . . . . . 123
11.5.3 Functions of the Form
y
=
a
x
+
q
. . . . . . . . . . . . . . . . . . . . . . 128
11.5.4 Functions of the Form
y
=
ab
(
x
)
+
q
. . . . . . . . . . . . . . . . . . . . 132
11.6 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 136
12 Average Gradient - Grade 10 Extension
137
12.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 137
12.2 Straight-Line Functions . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 137
12.3 Parabolic Functions . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 138
12.4 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 139
13 Geometry Basics
141
13.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 141
13.2 Points and Lines . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 141
13.3 Angles . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
42
13.3.1 Measuring angles . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
42
13.3.2 Special Angles . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
143
13.3.3 Special Angle Pairs . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 145
13.3.4 Parallel Lines intersected by Transversal Lines . . . . . .
. . . . . . . . . 145
13.4 Polygons . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
149
13.4.1 Triangles . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
49
13.4.2 Quadrilaterals . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 154
13.4.3 Other polygons . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
57
13.4.4 Extra . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 158
13.5 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
159
13.5.1 Challenge Problem . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
161
x
CONTENTS
CONTENTS
14 Geometry - Grade 10
163
14.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 163
14.2 Right Prisms and Cylinders . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 163
14.2.1 Surface Area . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
64
14.2.2 Volume . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 166
14.3 Polygons . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
170
14.3.1 Similarity of Polygons . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 170
14.4 Co-ordinate Geometry . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 174
14.4.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
174
14.4.2 Distance between Two Points . . . . . . . . . . . . . . . . . . . . . .
. . 174
14.4.3 Calculation of the Gradient of a Line . . . . . . . . . . . . . .
. . . . . . 175
14.4.4 Midpoint of a Line . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
76
14.5 Transformations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 179
14.5.1 Translation of a Point . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 179
14.5.2 Reflection of a Point . . . . . . . . . . . . . . . . . . . . . . . . . . . .
181
14.6 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 188
15 Trigonometry - Grade 10
191
15.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 191
15.2 Where Trigonometry is Used . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 192
15.3 Similarity of Triangles . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 192
15.4 Definition of the Trigonometric Functions . . . . . . . . . . .
. . . . . . . . . . 193
15.5 Simple Applications of Trigonometric Functions . . . . .
. . . . . . . . . . . . . 197
15.5.1 Height and Depth . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
97
15.5.2 Maps and Plans . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
9
15.6 Graphs of Trigonometric Functions . . . . . . . . . . . . . . . . .
. . . . . . . . 201
15.6.1 Graph of
sin
θ
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 201
15.6.2 Functions of the form
y
=
a
sin(
x
) +
q
. . . . . . . . . . . . . . . . . . . 202
15.6.3 Graph of
cos
θ
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 204
15.6.4 Functions of the form
y
=
a
cos(
x
) +
q
. . . . . . . . . . . . . . . . . . 205
15.6.5 Comparison of Graphs of
sin
θ
and
cos
θ
. . . . . . . . . . . . . . . . . . 207
15.6.6 Graph of
tan
θ
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 207
15.6.7 Functions of the form
y
=
a
tan(
x
) +
q
. . . . . . . . . . . . . . . . . . 208
15.7 End of Chapter Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 210
16 Statistics - Grade 10
213
16.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 213
16.2 Recap of Earlier Work . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 213
16.2.1 Data and Data Collection . . . . . . . . . . . . . . . . . . . . . . . .
. . 213
16.2.2 Methods of Data Collection . . . . . . . . . . . . . . . . . . . . . .
. . . 215
16.2.3 Samples and Populations . . . . . . . . . . . . . . . . . . . . . . . .
. . 215
16.3 Example Data Sets . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 216
xi
CONTENTS
CONTENTS
16.3.1 Data Set 1: Tossing a Coin . . . . . . . . . . . . . . . . . . . . . . . . . 2
16
16.3.2 Data Set 2: Casting a die . . . . . . . . . . . . . . . . . . . . . . . . . .
216
16.3.3 Data Set 3: Mass of a Loaf of Bread . . . . . . . . . . . . . . . . . . .
. 216
16.3.4 Data Set 4: Global Temperature . . . . . . . . . . . . . . . . . . .
. . . 217
16.3.5 Data Set 5: Price of Petrol . . . . . . . . . . . . . . . . . . . . . . .
. . 217
16.4 Grouping Data . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 217
16.4.1 Exercises - Grouping Data . . . . . . . . . . . . . . . . . . . . . . . .
. 218
16.5 Graphical Representation of Data . . . . . . . . . . . . . . . . . . .
. . . . . . . 219
16.5.1 Bar and Compound Bar Graphs . . . . . . . . . . . . . . . . . . . . . .
. 219
16.5.2 Histograms and Frequency Polygons . . . . . . . . . . . . . . . .
. . . . 220
16.5.3 Pie Charts . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
0
16.5.4 Line and Broken Line Graphs . . . . . . . . . . . . . . . . . . . . . .
. . 222
16.5.5 Exercises - Graphical Representation of Data . . . . . . . .
. . . . . . . 224
16.6 Summarising Data . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 225
16.6.1 Measures of Central Tendency . . . . . . . . . . . . . . . . . . . . .
. . 225
16.6.2 Measures of Dispersion . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
28
16.6.3 Exercises - Summarising Data . . . . . . . . . . . . . . . . . . . . . .
. 231
16.7 Misuse of Statistics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 232
16.7.1 Exercises - Misuse of Statistics . . . . . . . . . . . . . . . . . . . . .
. . 233
16.8 Summary of Definitions . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 235
16.9 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
235
17 Probability - Grade 10
237
17.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 237
17.2 Random Experiments . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 237
17.2.1 Outcomes, Sample Space and Events . . . . . . . . . . . . . . . . .
. . . 237
17.3 Probability Models . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 241
17.3.1 Classical Theory of Probability . . . . . . . . . . . . . . . . . . .
. . . . 241
17.4 Relative Frequency
vs.
Probability . . . . . . . . . . . . . . . . . . . . . . . . . 242
17.5 Project Idea . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 244
17.6 Probability Identities . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . 244
17.7 Mutually Exclusive Events . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 246
17.8 Complementary Events . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 247
17.9 End of Chapter Exerc"

      university_maths = "Contents
1 What is Linear Algebra?
13
1.1 What Are Vectors?
. . . . . . . . . . . . . . . . . . . . . . . .
13
1.2 What Are Linear Functions?
. . . . . . . . . . . . . . . . . . .
15
1.3 What is a Matrix?
. . . . . . . . . . . . . . . . . . . . . . . .
20
1.4 The Matrix Detour
. . . . . . . . . . . . . . . . . . . . . . . .
25
1.5 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
29
2 Systems of Linear Equations
35
2.1 Gaussian Elimination
. . . . . . . . . . . . . . . . . . . . . . .
35
2.1.1 Augmented Matrix Notation
. . . . . . . . . . . . . . .
35
2.1.2 Equivalence and the Act of Solving
. . . . . . . . . . .
38
2.1.3 Reduced Row Echelon Form
. . . . . . . . . . . . . . .
38
2.1.4 Solution Sets and RREF
. . . . . . . . . . . . . . . . .
43
2.2 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
46
2.3 Elementary Row Operations
. . . . . . . . . . . . . . . . . . .
50
2.3.1 EROs and Matrices
. . . . . . . . . . . . . . . . . . . .
50
2.3.2 Recording EROs in (
M
j
I
)
. . . . . . . . . . . . . . . .
52
2.3.3 The Three Elementary Matrices
. . . . . . . . . . . . .
54
2.3.4
LU
,
LDU
, and
LDPU
Factorizations
. . . . . . . . . .
56
2.4 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
59
2.5 Solution Sets for Systems of Linear Equations
. . . . . . . . .
61
2.5.1 The Geometry of Solution Sets: Hyperplanes
. . . . . .
62
7
8
2.5.2 Particular Solution + Homogeneous Solutions
. . . . .
63
2.5.3 Solutions and Linearity
. . . . . . . . . . . . . . . . . .
64
2.6 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
66
3 The Simplex Method
69
3.1 Pablo's Problem
. . . . . . . . . . . . . . . . . . . . . . . . . .
69
3.2 Graphical Solutions
. . . . . . . . . . . . . . . . . . . . . . . .
71
3.3 Dantzig's Algorithm
. . . . . . . . . . . . . . . . . . . . . . .
73
3.4 Pablo Meets Dantzig
. . . . . . . . . . . . . . . . . . . . . . .
76
3.5 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
78
4 Vectors in Space,
n
-Vectors
79
4.1 Addition and Scalar Multiplication in
R
n
. . . . . . . . . . . .
80
4.2 Hyperplanes
. . . . . . . . . . . . . . . . . . . . . . . . . . . .
81
4.3 Directions and Magnitudes
. . . . . . . . . . . . . . . . . . . .
84
4.4 Vectors, Lists and Functions:
R
S
. . . . . . . . . . . . . . . .
90
4.5 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
92
5 Vector Spaces
97
5.1 Examples of Vector Spaces
. . . . . . . . . . . . . . . . . . . .
98
5.1.1 Non-Examples
. . . . . . . . . . . . . . . . . . . . . . .
102
5.2 Other Fields
. . . . . . . . . . . . . . . . . . . . . . . . . . . .
103
5.3 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
105
6 Linear Transformations
107
6.1 The Consequence of Linearity
. . . . . . . . . . . . . . . . . .
107
6.2 Linear Functions on Hyperplanes
. . . . . . . . . . . . . . . .
109
6.3 Linear Dierential Operators
. . . . . . . . . . . . . . . . . . .
110
6.4 Bases (Take 1)
. . . . . . . . . . . . . . . . . . . . . . . . . .
111
6.5 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
114
7 Matrices
117
7.1 Linear Transformations and Matrices
. . . . . . . . . . . . . .
117
7.1.1 Basis Notation
. . . . . . . . . . . . . . . . . . . . . .
117
7.1.2 From Linear Operators to Matrices
. . . . . . . . . . .
123
7.2 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
125
7.3 Properties of Matrices
. . . . . . . . . . . . . . . . . . . . . .
129
7.3.1 Associativity and Non-Commutativity
. . . . . . . . .
136
8
9
7.3.2 Block Matrices
. . . . . . . . . . . . . . . . . . . . . .
138
7.3.3 The Algebra of Square Matrices
. . . . . . . . . . . .
139
7.3.4 Trace
. . . . . . . . . . . . . . . . . . . . . . . . . . . .
140
7.4 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
142
7.5 Inverse Matrix
. . . . . . . . . . . . . . . . . . . . . . . . . . .
145
7.5.1 Three Properties of the Inverse
. . . . . . . . . . . . .
146
7.5.2 Finding Inverses (Redux)
. . . . . . . . . . . . . . . . .
147
7.5.3 Linear Systems and Inverses
. . . . . . . . . . . . . . .
149
7.5.4 Homogeneous Systems
. . . . . . . . . . . . . . . . . .
149
7.5.5 Bit Matrices
. . . . . . . . . . . . . . . . . . . . . . . .
150
7.6 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
151
7.7 LU Redux
. . . . . . . . . . . . . . . . . . . . . . . . . . . . .
154
7.7.1 Using
LU
Decomposition to Solve Linear Systems
. . .
155
7.7.2 Finding an
LU
Decomposition.
. . . . . . . . . . . . .
157
7.7.3 Block
LDU
Decomposition
. . . . . . . . . . . . . . . .
160
7.8 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
161
8 Determinants
163
8.1 The Determinant Formula
. . . . . . . . . . . . . . . . . . . .
163
8.1.1 Simple Examples
. . . . . . . . . . . . . . . . . . . . .
163
8.1.2 Permutations
. . . . . . . . . . . . . . . . . . . . . . .
164
8.2 Elementary Matrices and Determinants
. . . . . . . . . . . . .
168
8.2.1 Row Swap
. . . . . . . . . . . . . . . . . . . . . . . . .
169
8.2.2 Row Multiplication
. . . . . . . . . . . . . . . . . . . .
170
8.2.3 Row Addition
. . . . . . . . . . . . . . . . . . . . . . .
171
8.2.4 Determinant of Products
. . . . . . . . . . . . . . . . .
173
8.3 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
176
8.4 Properties of the Determinant
. . . . . . . . . . . . . . . . . .
180
8.4.1 Determinant of the Inverse
. . . . . . . . . . . . . . . .
183
8.4.2 Adjoint of a Matrix
. . . . . . . . . . . . . . . . . . . .
183
8.4.3 Application: Volume of a Parallelepiped
. . . . . . . .
185
8.5 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
186
9 Subspaces and Spanning Sets
189
9.1 Subspaces
. . . . . . . . . . . . . . . . . . . . . . . . . . . . .
189
9.2 Building Subspaces
. . . . . . . . . . . . . . . . . . . . . . . .
191
9.3 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
196
9
10
10 Linear Independence
197
10.1 Showing Linear Dependence
. . . . . . . . . . . . . . . . . . .
198
10.2 Showing Linear Independence
. . . . . . . . . . . . . . . . . .
201
10.3 From Dependent Independent
. . . . . . . . . . . . . . . . . .
202
10.4 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
203
11 Basis and Dimension
207
11.1 Bases in
R
n
.
. . . . . . . . . . . . . . . . . . . . . . . . . . . .
210
11.2 Matrix of a Linear Transformation (Redux)
. . . . . . . . . .
212
11.3 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
215
12 Eigenvalues and Eigenvectors
219
12.1 Invariant Directions
. . . . . . . . . . . . . . . . . . . . . . . .
221
12.2 The Eigenvalue{Eigenvector Equation
. . . . . . . . . . . . . .
226
12.3 Eigenspaces
. . . . . . . . . . . . . . . . . . . . . . . . . . . .
230
12.4 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
231
13 Diagonalization
235
13.1 Diagonalizability
. . . . . . . . . . . . . . . . . . . . . . . . .
235
13.2 Change of Basis
. . . . . . . . . . . . . . . . . . . . . . . . . .
236
13.3 Changing to a Basis of Eigenvectors
. . . . . . . . . . . . . . .
240
13.4 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
242
14 Orthonormal Bases and Complements
247
14.1 Properties of the Standard Basis
. . . . . . . . . . . . . . . . .
247
14.2 Orthogonal and Orthonormal Bases
. . . . . . . . . . . . . . .
249
14.3 Relating Orthonormal Bases
. . . . . . . . . . . . . . . . . . .
250
14.4 Gram-Schmidt & Orthogonal Complements
. . . . . . . . . .
253
14.4.1 The Gram-Schmidt Procedure
. . . . . . . . . . . . . .
256
14.5
QR
Decomposition
. . . . . . . . . . . . . . . . . . . . . . . .
257
14.6 Orthogonal Complements
. . . . . . . . . . . . . . . . . . . .
259
14.7 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
264
15 Diagonalizing Symmetric Matrices
269
15.1 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
273
16 Kernel, Range, Nullity, Rank
277
16.1 Range
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
278
16.2 Image
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
279
10
11
16.2.1 One-to-one and Onto
. . . . . . . . . . . . . . . . . .
281
16.2.2 Kernel
. . . . . . . . . . . . . . . . . . . . . . . . . . .
284
16.3 Summary
. . . . . . . . . . . . . . . . . . . . . . . . . . . . .
289
16.4 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
290
17 Least squares and Singular Values
295
17.1 Projection Matrices
. . . . . . . . . . . . . . . . . . . . . . . .
298
17.2 Singular Value Decomposition
. . . . . . . . . . . . . . . . . .
300
17.3 Review Problems
. . . . . . . . . . . . . . . . . . . . . . . . .
304
A List of Symbols
307
B Fields
309
C Online Resources
311
D Sample First Midterm
313
E Sample Second Midterm
323
F Sample Final Exam
333
G Movie Scripts
361
G.1 What is Linear Algebra?
. . . . . . . . . . . . . . . . . . . . .
361
G.2 Systems of Linear Equations
. . . . . . . . . . . . . . . . . . .
361
G.3 Vectors in Space
n
-Vectors
. . . . . . . . . . . . . . . . . . . .
371
G.4 Vector Spaces
. . . . . . . . . . . . . . . . . . . . . . . . . . .
373
G.5 Linear Transformations
. . . . . . . . . . . . . . . . . . . . . .
377
G.6 Matrices
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
379
G.7 Determinants
. . . . . . . . . . . . . . . . . . . . . . . . . . .
389
G.8 Subspaces and Spanning Sets
. . . . . . . . . . . . . . . . . .
397
G.9 Linear Independence
. . . . . . . . . . . . . . . . . . . . . . .
398
G.10 Basis and Dimension
. . . . . . . . . . . . . . . . . . . . . . .
401
G.11 Eigenvalues and Eigenvectors
. . . . . . . . . . . . . . . . . .
403
G.12 Diagonalization
. . . . . . . . . . . . . . . . . . . . . . . . . .
409
G.13 Orthonormal Bases and Complements
. . . . . . . . . . . . . .
415
G.14 Diagonalizing Symmetric Matrices
. . . . . . . . . . . . . . . .
422
G.15 Kernel, Range, Nullity, Rank
. . . . . . . . . . . . . . . . . . .
424
G.16 Least Squares and Singular Values
. . . "


biology_university = "1 An Overview of Cell Structure and Function 1
Cell’s Need for Immense Amounts of Information 2
Rudiments of Prokaryotic Cell Structure 2
Rudiments of Eukaryotic Cell Structure 5
Packing DNA into Cells 7
Moving Molecules into or out of Cells 8
Diffusion within the Small Volume of a Cell 13
Exponentially Growing Populations 14
Composition Change in Growing Cells 15
Age Distribution in Populations of Growing Cells 15
Problems 16
References 18
2 Nucleic Acid and Chromosome Structure 21
The Regular Backbone Of DNA 22
Grooves in DNA and Helical Forms of DNA 23
Dissociation and Reassociation of Base-paired Strands 26
Reading Sequence Without Dissociating Strands 27
Electrophoretic Fragment Separation 28
Bent DNA Sequences 29
Measurement of Helical Pitch 31
Topological Considerations in DNA Structure 32
Generating DNA with Superhelical Turns 33
Measuring Superhelical Turns 34
Determining
Lk, Tw
, and
Wr
in Hypothetical Structures 36
Altering Linking Number 37
Biological Significance of Superhelical Turns 39
vii
The Linking Number Paradox of Nucleosomes 40
General Chromosome Structure 41
Southern Transfers to Locate Nucleosomes on Genes 41
ARS Elements, Centromeres, and Telomeres 43
Problems 44
References 47
3 DNA Synthesis 53
A. Enzymology 54
Proofreading, Okazaki Fragments, and DNA Ligase 54
Detection and Basic Properties of DNA Polymerases 57
In vitro
DNA Replication 60
Error and Damage Correction 62
B. Physiological Aspects 66
DNA Replication Areas In Chromosomes 66
Bidirectional Replication from
E. coli
Origins 67
The DNA Elongation Rate 69
Constancy of the
E. coli
DNA Elongation Rate 71
Regulating Initiations 72
Gel Electrophoresis Assay of Eukaryotic Replication Origins 74
How Fast Could DNA Be Replicated? 76
Problems 78
References 79
4 RNA Polymerase and RNA Initiation 85
Measuring the Activity of RNA Polymerase 86
Concentration of Free RNA Polymerase in Cells 89
The RNA Polymerase in
Escherichia coli
90
Three RNA Polymerases in Eukaryotic Cells 91
Multiple but Related Subunits in Polymerases 92
Multiple Sigma Subunits 95
The Structure of Promoters 96
Enhancers 99
Enhancer-Binding Proteins 100
DNA Looping in Regulating Promoter Activities 102
Steps of the Initiation Process 104
Measurement of Binding and Initiation Rates 105
Relating Abortive Initiations to Binding and Initiating 107
Roles of Auxiliary Transcription Factors 109
Melted DNA Under RNA Polymerase 110
Problems 111
References 113
5 Transcription, Termination, and RNA Processing 119
Polymerase Elongation Rate 119
viii Contents
Transcription Termination at Specific Sites 121
Termination 122
Processing Prokaryotic RNAs After Synthesis 125
S1 Mapping to Locate 5
’
and 3
’
Ends of Transcripts 126
Caps, Splices, Edits, and Poly-A Tails on Eukaryotic RNAs 127
The Discovery and Assay of RNA Splicing 128
Involvement of the U1 snRNP Particle in Splicing 131
Splicing Reactions and Complexes 134
The Discovery of Self-Splicing RNAs 135
A Common Mechanism for Splicing Reactions 137
Other RNA Processing Reactions 139
Problems 140
References 142
6 Protein Structure 149
The Amino Acids 150
The Peptide Bond 153
Electrostatic Forces that Determine Protein Structure 154
Hydrogen Bonds and the Chelate Effect 158
Hydrophobic Forces 159
Thermodynamic Considerations of Protein Structure 161
Structures within Proteins 162
The Alpha Helix, Beta Sheet, and Beta Turn 164
Calculation of Protein Tertiary Structure 166
Secondary Structure Predictions 168
Structures of DNA-Binding Proteins 170
Salt Effects on Protein-DNA Interactions 173
Locating Specific Residue-Base Interactions 174
Problems 175
References 177
7 Protein Synthesis 183
A. Chemical Aspects 184
Activation of Amino Acids During Protein Synthesis 184
Fidelity of Aminoacylation 185
How Synthetases Identify the Correct tRNA Molecule 187
Decoding the Message 188
Base Pairing between Ribosomal RNA and Messenger 191
Experimental Support for the Shine-Dalgarno Hypothesis 192
Eukaryotic Translation and the First AUG 194
Tricking the Translation Machinery into Initiating 195
Protein Elongation 197
Peptide Bond Formation 198
Translocation 198
Termination, Nonsense, and Suppression 199
Chaperones and Catalyzed Protein Folding 202
Contents ix
Resolution of a Paradox 202
B. Physiological Aspects 203
Messenger Instability 203
Protein Elongation Rates 204
Directing Proteins to Specific Cellular Sites 207
Verifying the Signal Peptide Model 208
The Signal Recognition Particle and Translocation 210
Expectations for Ribosome Regulation 211
Proportionality of Ribosome Levels and Growth Rates 212
Regulation of Ribosome Synthesis 214
Balancing Synthesis of Ribosomal Components 216
Problems 218
References 220
8 Genetics 227
Mutations 227
Point Mutations, Deletions, Insertions, and Damage 228
Classical Genetics of Chromosomes 231
Complementation,
Cis, Trans,
Dominant, and Recessive 233
Mechanism of a
trans
Dominant Negative Mutation 234
Genetic Recombination 235
Mapping by Recombination Frequencies 236
Mapping by Deletions 239
Heteroduplexes and Genetic Recombination 239
Branch Migration and Isomerization 241
Elements of Recombination in
E. coli,
RecA, RecBCD, and Chi 243
Genetic Systems 244
Growing Cells for Genetics Experiments 245
Testing Purified Cultures, Scoring 246
Isolating Auxotrophs, Use of Mutagens and Replica Plating 247
Genetic Selections 248
Mapping with Generalized Transducing Phage 250
Principles of Bacterial Sex 251
Elements of Yeast Genetics 253
Elements of
Drosophila
Genetics 254
Isolating Mutations in Muscle or Nerve in
Drosophila
255
Fate Mapping and Study of Tissue-Specific Gene Expression 256
Problems 257
References 261
9 Genetic Engineering and Recombinant DNA 265
The Isolation of DNA 266
The Biology of Restriction Enzymes 268
Cutting DNA with Restriction Enzymes 271
Isolation of DNA Fragments 272
x Contents
Joining DNA Fragments 272
Vectors: Selection and Autonomous DNA Replication 274
Plasmid Vectors 274
A Phage Vector for Bacteria 278
Vectors for Higher Cells 279
Putting DNA Back into Cells 281
Cloning from RNA 282
Plaque and Colony Hybridization for Clone Identification 283
Walking Along a Chromosome to Clone a Gene 284
Arrest of Translation to Assay for DNA of a Gene 285
Chemical DNA Sequencing 286
Enzymatic DNA Sequencing 289
Problems 291
References 293
10 Advanced Genetic Engineering 297
Finding Clones from a Known Amino Acid Sequence 297
Finding Clones Using Antibodies Against a Protein 298
Southern, Northern, and Western Transfers 300
Polymerase Chain Reaction 302
Isolation of Rare Sequences Utilizing PCR 305
Physical and Genetic Maps of Chromosomes 306
Chromosome Mapping 307
DNA Fingerprinting
—
Forensics 310
Megabase Sequencing 311
Footprinting, Premodification and Missing Contact Probing 313
Antisense RNA: Selective Gene Inactivation 317
Hypersynthesis of Proteins 317
Altering Cloned DNA by
in vitro
Mutagenesis 318
Mutagenesis with Chemically Synthesized DNA 321
Problems 323
References 325
11 Repression and the
lac
Operon 331
Background of the
lac
Operon 332
The Role of Inducer Analogs in the Study of the
lac
Operon 334
Proving
lac
Repressor is a Protein 335
An Assay for
lac
Repressor 336
The Difficulty of Detecting Wild-Type
lac
Repressor 338
Detection and Purification of
lac
Repressor 340
Repressor Binds to DNA: The Operator is DNA 341
The Migration Retardation Assay and DNA Looping 343
The Isolation and Structure of Operator 344
In vivo
Affinity of Repressor for Operator 346
The DNA-binding Domain of
lac
Repressor 346
A Mechanism for Induction 348
Contents xi
Problems 349
References 353
12 Induction, Repression, and the
araBAD
Operon 359
The Sugar Arabinose and Arabinose Metabolism 360
Genetics of the Arabinose System 362
Detection and Isolation of AraC Protein 364
Repression by AraC 366
Regulating AraC Synthesis 368
Binding Sites of the
ara
Regulatory Proteins 369
DNA Looping and Repression of
araBAD
371
In vivo
Footprinting Demonstration of Looping 373
How AraC Protein Loops and Unloops 373
Why Looping is Biologically Sensible 376
Why Positive Regulators are a Good Idea 376
Problems 377
References 379
13 Attenuation and the
trp
Operon 385
The Aromatic Amino Acid Synthetic Pathway and its Regulation 386
Rapid Induction Capabilities of the
trp
Operon 388
The Serendipitous Discovery of
trp
Enzyme Hypersynthesis 390
Early Explorations of the Hypersynthesis 392
trp
Multiple Secondary Structures in
trp
Leader RNA 396
Coupling Translation to Termination 397
RNA Secondary Structure and the Attenuation Mechanism 399
Other Attenuated Systems: Operons,
Bacillus subtilis
and HIV 400
Problems 402
References 404
14 Lambda Phage Genes and Regulatory Circuitry 409
A. The Structure and Biology of Lambda 410
The Physical Structure of Lambda 410
The Genetic Structure of Lambda 411
Lysogeny and Immunity 413
Lambda
’
s Relatives and Lambda Hybrids 414
B. Chronology of a Lytic Infective Cycle 415
Lambda Adsorption to Cells 415
Early Transcription of Genes
N
and
Cro
416
N Protein and Antitermination of Early Gene Transcription 417
The Role of Cro Protein 418
Initiating DNA Synthesis with the O and P Proteins 418
Proteins Kil,
γ
,
β
, and Exo 419
Q Protein and Late Proten Synthesis 420
Lysis 421
xii Contents
C. The Lysogenic Infective Cycle and Induction of Lyso-
gens 422
Chronology of Becoming a Lysogen 422
Site for Cro Repression and CI Activation 423
Cooperativity in Repressor Binding and its Measurement 426
The Need for and the Realization of Hair-Trigger Induction 427
Induction from the Lysogenic State 429
Entropy, a Basis for Lambda Repressor Inactivation 431
Problems 433
References 435
15
Xenopus
5S RNA Synthesis 443
Biology of 5S RNA Synthesis in
Xenopus
443
In vitro
5S RNA Synthesis 446
TFIIIA Binding to the Middle of its Gene as Well as to RNA 447
Switching from Oocyte to Somatic 5S Synthesis 450
Structure and Function of TFIIIA 452
Problems 453
References 454
16 Regulation of Mating Type in Yeast 457
The Yeast Cell Cycle 458
Mating Type Conversion in
Saccharomyces cerevisiae
459
Cloning the Mating Type Loci in Yeast 460
Transfer of Mating Type Gene Copies to an Expression Site 461
Structure of the Mating Type Loci 462
The Expression and Recombination Paradoxes 463
Silencing
HML
and
HMR
464
Isolation of
α
2 Protein 466
α
2 and MCM1 468
Sterile Mutants, Membrane Receptors and G Factors 469
DNA Cleavage at the
MAT
Locus 471
DNA Strand Inheritance and Switching in Fission Yeast 472
Problems 474
References 475
17 Genes Regulating Development 479
General Considerations on Signaling 479
Outline of Early
Drosophila
Development 482
Classical Embryology 484
Using Genetics to Begin Study of Developmental Systems 484
Cloning Developmental Genes 487
Enhancer Traps for Detecting and Cloning Developmental Genes 487
Expression Patterns of Developmental Genes 488
Similarities Among Developmental Genes 491
Overall Model of
Drosophila
Early Development 491
Contents xiii
Problems 492
References 492
18 Lambda Phage Integration and Excision 497
Mapping Integrated Lambda 498
Simultaneous Deletion of Chromosomal and Lambda DNA 499
DNA Heteroduplexes Prove that Lambda Integrates 501
Gene Order Permutation and the Campbell Model 501
Isolation of Integration-Defective Mutants 503
Isolation of Excision-Deficient Mutants 504
Properties of the
int
and
xis
Gene Products 506
Incorrect Excision and
gal
and
bio
Transducing Phage 506
Transducing Phage Carrying Genes Other than
gal
and
bio
508
Use of Transducing Phage to Study Integration and Excision 509
The Double
att
Phage,
att
2
510
Demonstrating Xis is Unstable 512
Inhibition By a Downstream Element 513
In vitro
Assay of Integration and Excision 515
Host Proteins Involved in Integration and Excision 517
Structure of the
att
Regions 517
Structure of the Intasome 519
Holliday Structures and Branch Migration in Integration 521
Problems 523
References 525
19 Transposable Genetic Elements 531
IS Elements in Bacteria 532
Structure and Properties of IS Elements 534
Discovery of Tn Elements 536
Structure and Properties of Tn Elements 538
Inverting DNA Segments by Recombination, Flagellin Synthesis 540
Mu Phage As a Giant Transposable Element 542
An Invertible Segment of Mu Phage 544
In vitro
Transposition, Threading or Global Topology? 545
Hopping by Tn10 547
Retrotransposons in Higher Cells 550
An RNA Transposition Intermediate 552
P Elements and Transformation 553
P Element Hopping by Chromosome Rescue 555
Problems 557
References 558
20 Generating Genetic Diversity: Antibodies 563
The Basic Adaptive Immune Response 563
Telling the Difference Between Foreign and Self 565
The Number of Different Antibodies Produced 566
xiv Contents
Myelomas and Monoclonal Antibodies 567
The Structure of Antibodies 569
Many Copies of V Genes and Only a Few C Genes 571
The J Regions 573
The D Regions in H Chains 575
Induced Mutations and Antibody Diversity 577
Class Switching of Heavy Chains 577
Enhancers and Expression of Immunoglobulin Genes 578
The AIDS Virus 579
Engineering Antibody Synthesis in Bacteria 580
Assaying for Sequence Requirements of Gene Rearrangements 582
Cloning the Recombinase 584
Problems 584
References 586
21 Biological Assembly, Ribosomes and Lambda Phage 591
A. Ribosome Assembly 592
RNAse and Ribosomes 592
The Global Structure of Ribosomes 593
Assembly of Ribosomes 595
Experiments with
in vitro
Ribosome Assembly 597
Determining Details of Local Ribosomal Structure 599
B. Lambda Phage Assembly 601
General Aspects 601
The Geometry of Capsids 602
The Structure of the Lambda Particle 605
The Head Assembly Sequence and Host Proteins 606
Packaging the DNA and Formation of the
cos
Ends 607
Formation of the Tail 609
In vitro
Packaging 610
Problems 610
References 613
22 Chemotaxis 619
Assaying Chemotaxis 620
Fundamental Properties of Chemotaxis 622
Genetics of Motility and Chemotaxis 624
How Cells Swim 625
The Mechanism of Chemotaxis 627
The Energy for Chemotaxis 629
Adaptation 630
Methylation and Adaptation 632
Phosphorylation and the Rapid Response 633
Problems 635
References 637
Contents xv
23 Oncogenesis, Molecular Aspects 643
Bacterially Induced Tumors in Plants 644
Transformation and Oncogenesis by Damaging the Chromosome 645
Identifying a Nucleotide Change Causing Cancer 647
Retroviruses and Cancer 650
Cellular Counterparts of Retroviral Oncogenes 653
Identification of the
src
and
sis
Gene Products 654
DNA Tumor Viruses 656
Recessive Oncogenic Mutations, Tumor Suppressors 658
The
ras-fos-jun
Pathway 660
Directions for Future Research in Molecular Biology 661
Problems 661
References "

secondary_school_biology = "Chemistry . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . 11
Atoms, Molecules, Ions, and Bonds . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
Properties of Water . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 12
Organic Molecules . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 13
Carbohydrates . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 14
Lipids . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . 16
Proteins . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . 17
Nucleic Acids . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 20
Chemical Reactions in Metabolic Processes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
25
Cells . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
33
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . 33
Structure and Function of the Cell . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 33
Prokaryotes and Eukaryotes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
38
Movement of Substances . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
38
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
40
Cellular Respiration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 45
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . 45
Glycolysis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . 45
The Krebs Cycle . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 45
Oxidative Phosphorylation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
46
How Many ATP? . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 47
Mitochondria . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 47
Chemiosmosis in Mitochondria . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 48
Two Types of Phosphorylation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 49
Anaerobic Respiration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 49
Alcohol Fermentation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 49
Lactic Acid Fermentation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 50
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
51
Photosynthesis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 57
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . 57
Noncyclic Photophosphorylation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 57
Cyclic Photophosphorylation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
9
Calvin Cycle . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 59
Chloroplasts . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 60
Chemiosmosis in Chloroplasts . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 60
02_097649 ftoc.qxd 6/13/07 8:44 PM Page iii
Photorespiration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 61
C
4
Photosynthesis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 62
CAM Photosynthesis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 62
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
64
Cell Division . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . 73
Mitosis and Cytokinesis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 74
Meiosis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 76
Mitosis versus Meiosis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 78
Genetic Variation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 80
Regulation of the Cell Cycle . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 80
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
82
Heredity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 89
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . 89
Complete Dominance, Monohybrid Cross . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 90
Complete Dominance, Dihybrid Cross . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 92
Test Crosses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 93
Incomplete Dominance . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 94
Codominance . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 94
Multiple Alleles . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 94
Epistasis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . 95
Pleiotropy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 95
Polygenic Inheritance . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 95
Linked Genes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 95
Sex-Linked Inheritance . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 97
X-Inactivation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 97
Nondisjunction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 98
Human Genetic Defects . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
98
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
99
Molecular Genetics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 107
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . 107
DNA Replication . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 107
Replication of Telomeres . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 109
Protein Synthesis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 111
Transcription . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 112
mRNA Processing . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 113
Translation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 114
Mutations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 116
DNA Organization . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 116
The Molecular Genetics of Viruses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 117
The Molecular Genetics of Bacteria . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 117
Regulation of Gene Expression . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 118
Recombinant DNA . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
119
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
1
Evolution . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 129
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . 129
Evidence for Evolution . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 129
Natural Selection . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 130
Sources of Variation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 132
Causes of Changes in Allele Frequencies . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 134
Genetic Equilibrium . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 134
Speciation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 135
Maintaining Reproductive Isolation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 137
Patterns of Evolution . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 137
Macroevolution . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 138
iv
CliffsAP Biology, 3rd Edition
02_097649 ftoc.qxd 6/13/07 8:44 PM Page iv
The Origin of Life . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 139
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
1
Biological Diversity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 149
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . 149
Domain Archaea . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 150
Domain Bacteria . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 150
Domain Eukarya . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 151
Kingdom Protista . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
1
Kingdom Fungi . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
53
Kingdom Plantae . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 154
Kingdom Animalia . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 157
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
1
Plants . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
7
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . 167
Plant Tissues . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 167
The Seed . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . 168
Germination and Development . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 168
Primary Growth Versus Secondary Growth . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 169
Primary Structure of Roots . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
16 9
Primary Structure of Stems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
171
Secondary Structure of Stems and Roots . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 172
Structure of the Leaf . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 173
Transport of Water . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 174
Control of Stomata . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 174
Transport of Sugars . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 175
Plant Hormones . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 176
Plant Responses to Stimuli . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
17 6
Photoperiodism . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 177
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
9
Animal Form and Function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 185
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . 185
Thermoregulation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 185
The Respiratory System . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 186
The Circulatory System . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 187
The Excretory System . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 189
The Digestive System . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 192
The Nervous System . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 194
The Muscular System . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
19 6
The Immune System . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
19 8
The Endocrine System . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
201
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
3
Animal Reproduction and Development . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 211
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . 211
Characteristics That Distinguish the Sexes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 211
Human Reproductive Anatomy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 211
Gametogenesis in Humans . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 212
Hormonal Control of Human Reproduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 212
Embryonic Development . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
14
Factors That Influence Development . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 217
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
8
Animal Behavior . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 225
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . 225
Genetic Basis of Behavior . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
225
Kinds of Animal Behavior . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
225
v
Table of Contents
02_097649 ftoc.qxd 6/13/07 8:44 PM Page v
Animal Movement . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
227
Communication in Animals . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 227
Foraging Behaviors . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 228
Social Behavior . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . 228
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
0
Ecology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 235
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . 235
Population Ecology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 235
Human Population Growth . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 240
Community Ecology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
240
Coevolution . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 241
Ecological Succession . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. 242
Ecosystems . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . 244
Biogeochemical Cycles . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
245
Biomes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . 246
Human Impact on the Biosphere . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 246
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
8
PART II: LABORATORY REVIEW
Laboratory Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 257
Review . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . 257
Graphing Data . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . 257
Designing an Experiment . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
58
Laboratory 1: Diffusion and Osmosis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 259
Laboratory 2: Enzyme Catalysis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 260
Laboratory 3: Mitosis and Meiosis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 261
Laboratory 4: Plant Pigments and Photosynthesis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 262
Laboratory 5: Cell Respiration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
4
Laboratory 6: Molecular Biology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 265
Laboratory 7: Genetics of
Drosophila
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 267
Laboratory 8: Population Genetics and Evolution . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 269
Laboratory 9: Transpiration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
70
Laboratory 10: Physiology of the Circulatory System . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 272
Laboratory 11: Animal Behavior . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 273
Laboratory 12: Dissolved Oxygen and Aquatic Primary Productivity . . . . . . . . . . . . . . . . . 274
Sample Questions and Answers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ."

primary_education_biology = "1 Being alive: 1.1 Animals and plants alive; 1.2 Local environment; 1.3 Animal babies; 1.4 Healthy food and drink; 1.5 Check your progress. 2 Growing plants: 2.1 Plant parts; 2.2 Growing seeds; 2.3 Plants and light; 2.4 Check your progress. 3 Ourselves: 3.1 We are similar; 3.2 We are different; 3.3 Our bodies; 3.4 Our fantastic senses; 3.5 Check your progress. 4 Materials in my world: 4.1 What is it made of?; 4.2 Using materials; 4.3 Sorting materials; 4.4 Check your progress. 5 Pushes and pulls: 5.1 In the playground; 5.2 How toys work; 5.3 Pushes and pulls around us; 5.4 Changing movement; 5.5 Check your progress. 6 Hearing sounds: 6.1 Where do sounds come from?; 6.2 Our ears; 6.3 Sounds move; 6.4 Check your progress. Glossary and index. - See more at: http://education.cambridge.org/eu/subject/science/cambridge-primary-science/cambridge-primary-science-learners-book-stage-1#sthash.H86yk1IJ.dpuf
1 Going outside: 1.1 Different places to live; 1.2 Can we care for our environment?; 1.3 Our weather; 1.4 Extreme weather; 1.5 Check your progress. 2 Looking at rocks: 2.1 What are rocks?; 2.2 Uses of rocks; 2.3 Soil; 2.4 Other natural materials. 3 Changing materials: 3.1 Materials changing shape; 3.2 Bending and twisting; 3.3 Fantastic elastic; 3.4 Heating and cooling; 3.5 Check your progress. 4 Light and dark: 4.1 Light sources; 4.2 Darkness; 4.3 Making shadows; 4.4 Shadow shapes; 4.5 Check your progress. 5 Electricity: 5.1 Electricity around us; 5.2 Staying safe; 5.3 Making a circuit; 5.4 Using motors and buzzers; 5.5 Switches; 5.6 Check your progress. 6 The Earth and the Sun: 6.1 Day and night; 6.2 Does the Sun move?; 6.3 Changing shadows; 6.4 Check your progress. Glossary and index. - See more at: http://education.cambridge.org/eu/subject/science/cambridge-primary-science/cambridge-primary-science-learners-book-stage-2#sthash.flVvij8Q.dpuf
1 Looking after plants: 1.1 Plants and their parts; 1.2 Plants need light and water; 1.3 Transporting water; 1.4 Plant growth and temperature; 1.5 Check your progress. 2 Looking after ourselves: 2.1 Food groups; 2.2 A healthy diet; 2.3 An unhealthy diet; 2.4 Exercise and sleep; 2.5 Check your progress. 3 Living things: 3.1 Living and non-living; 3.2 Growth and nutrition; 3.3 Movement and reproduction; 3.4 Sorting humans; 3.5 Sorting living things; 3.6 Check your progress. 4 Our five senses: 4.1 Hearing and touch; 4.2 Taste and smell; 4.3 Sight; 4.4 Check your progress. 5 Investigating materials: 5.1 Properties of materials; 5.2 Sorting materials; 5.3 Uses of materials; 5.4 Testing materials; 5.5 Magnetic materials; 5.6 Check your progress. 6 Forces and movement: 6.1 Push and pull; 6.2 Changing shape; 6.3 How big is that force?; 6.4 Forcemeters; 6.5 Friction; 6.6 Check your progress. Glossary and index. - See more at: http://education.cambridge.org/eu/subject/science/cambridge-primary-science/cambridge-primary-science-learners-book-stage-3#sthash.tTPmpSyp.dpuf
1 Humans and animals: 1.1 Skeletons; 1.2 The human skeleton; 1.3 Why do we need a skeleton?; 1.4 Skeletons and movement; 1.5 Drugs as medicines; 1.6 Check your progress. 2 Living things and environments: 2.1 Amazing birds; 2.2 A habitat for snails; 2.3 Animals in local habitats; 2.4 Identification keys; 2.5 Identifying invertebrates; 2.6 How we affect the environment; 2.7 Wonderful water; 2.8 Recycling can save the Earth!; 2.9 Check your progress. 3 Solids, liquids and gases: 3.1 Matter; 3.2 Matter is made of particles; 3.3 How do solids, liquids and gases behave?; 3.4 Melting, freezing and boiling; 3.5 Melting in different solids; 3.6 Melting and boiling points; 3.7 Check your progress. 4 Sound: 4.1 Sound travels through materials; 4.2 Sound travels through different materials; 4.3 How sound travels; 4.4 Loud and soft sounds; 4.5 Sound volume; 4.6 Muffling sounds; 4.7 High and low sounds; 4.8 Pitch and percussion instruments; 4.9 Having fun with wind instruments; 4.10 Check your progress. 5 Electricity and magnetism: 5.1 Electricity flows in circuits; 5.2 Components and a simple circuit; 5.3 Switches; 5.4 Circuits with more components; 5.5 Circuits with buzzers; 5.6 Main electricity; 5.7 Magnets in everyday life; 5.8 Magnetic poles; 5.9 Strength of magnets; 5.10 What metals are magnetic?; 5.11 Check your progress. Glossary and index. - See more at: http://education.cambridge.org/eu/subject/science/cambridge-primary-science/cambridge-primary-science-learners-book-stage-4#sthash.WezErVRF.dpuf
   1 Investigating plant growth: 1.1 Seeds; 1.2 How seeds grow; 1.3 Investigating germination; 1.4 What do plants need to grow?; 1.5 Plants and light; 1.6 Check your progress. 2 The life cycle of flowering plants: 2.1 Why plants have flowers; 2.2 How seeds are spread; 2.3 Other ways seeds are spread; 2.4 The parts of a flower; 2.5 Pollination; 2.6 Investigating pollination; 2.7 Plant life cycles; 2.8 Check your progress. 3 States of matter: 3.1 Evaporation; 3.2 Why evaporation is useful; 3.3 Investigating evaporation; 3.4 Investigating evaporation from solution; 3.5 Condensation; 3.6 The water cycle; 3.7 Boiling; 3.8 Melting; 3.9 Who invented the temerature scale?; 3.10 Check your progress. 4 The way we see things: 4.1 Light travels from a source; 4.2 Mirrors; 4.3 Seeing behind you; 4.4 Which surfaces reflect light the best?; 4.5 Light changes direction; 4.6 Check your progress. 5 Shadows: 5.1 Light travels in straight lines; 5.2 Which materials let light through?; 5.3 Silhouettes and shadow puppets; 5.4 What affects the size of a shadow?; 5.5 Investigating shadow lengths; 5.6 Measuring light intensity; 5.7 How scientists measured and understood light; 5.8 Check your progress. 6 Earth's movements: 6.1 The Sun, the Earth and the Moon; 6.2 Does the Sun move?; 6.3 The Earth rotates on its axis; 6.4 Sunrise and sunset; 6.5 The Earth revolves around the Sun; 6.6 Exploring the solar system; 6.7 Check your progress. Glossary and index. - See more at: http://education.cambridge.org/eu/subject/science/cambridge-primary-science/cambridge-primary-science-learners-book-stage-5#sthash.WPPSDdyA.dpuf"


university_computer_science =  "Preface
i
1 Overview 1
1.1 Aspects of Networks . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
2
1.2 Central Themes and Topics . . . . . . . . . . . . . . . . . . . . . . . . . . .
8
I Graph Theory and Social Networks 21
2 Graphs
23
2.1 Basic Denitions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
23
2.2 Paths and Connectivity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
25
2.3 Distance and Breadth-First Search . . . . . . . . . . . . . . . . . . . . . . .
32
2.4 Network Datasets: An Overview . . . . . . . . . . . . . . . . . . . . . . . . .
40
2.5 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
44
3 Strong and Weak Ties 47
3.1 Triadic Closure . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
48
3.2 The Strength of Weak Ties . . . . . . . . . . . . . . . . . . . . . . . . . . . .
50
3.3 Tie Strength and Network Structure in Large-Scale Data . . . . . . . . . . .
56
3.4 Tie Strength, Social Media, and Passive Engagement . . . . . . . . . . . . .
60
3.5 Closure, Structural Holes, and Social Capital . . . . . . . . . . . . . . . . . .
64
3.6 Advanced Material: Betweenness Measures and Graph Partitioning . . . . .
69
3.7 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
83
4 Networks in Their Surrounding Contexts 85
4.1 Homophily . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
86
4.2 Mechanisms Underlying Homophily: Selection and Social In uence . . . . . .
90
4.3 Aliation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
93
4.4 Tracking Link Formation in On-Line Data . . . . . . . . . . . . . . . . . . .
97
4.5 A Spatial Model of Segregation . . . . . . . . . . . . . . . . . . . . . . . . .
107
4.6 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
116
3
4
CONTENTS
5 Positive and Negative Relationships 119
5.1 Structural Balance . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
120
5.2 Characterizing the Structure of Balanced Networks . . . . . . . . . . . . . .
123
5.3 Applications of Structural Balance . . . . . . . . . . . . . . . . . . . . . . .
126
5.4 A Weaker Form of Structural Balance . . . . . . . . . . . . . . . . . . . . . .
129
5.5 Advanced Material: Generalizing the Denition of Structural Balance . . . .
132
5.6 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
148
II Game Theory 153
6 Games 155
6.1 What is a Game? . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
156
6.2 Reasoning about Behavior in a Game . . . . . . . . . . . . . . . . . . . . . .
158
6.3 Best Responses and Dominant Strategies . . . . . . . . . . . . . . . . . . . .
163
6.4 Nash Equilibrium . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
166
6.5 Multiple Equilibria: Coordination Games . . . . . . . . . . . . . . . . . . . .
168
6.6 Multiple Equilibria: The Hawk-Dove Game . . . . . . . . . . . . . . . . . . .
172
6.7 Mixed Strategies . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
173
6.8 Mixed Strategies: Examples and Empirical Analysis . . . . . . . . . . . . . .
179
6.9 Pareto-Optimality and Social Optimality . . . . . . . . . . . . . . . . . . . .
184
6.10 Advanced Material: Dominated Strategies and Dynamic Games . . . . . . .
186
6.11 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
200
7 Evolutionary Game Theory 209
7.1 Fitness as a Result of Interaction . . . . . . . . . . . . . . . . . . . . . . . .
210
7.2 Evolutionarily Stable Strategies . . . . . . . . . . . . . . . . . . . . . . . . .
211
7.3 A General Description of Evolutionarily Stable Strategies . . . . . . . . . . .
216
7.4 Relationship Between Evolutionary and Nash Equilibria . . . . . . . . . . . .
218
7.5 Evolutionarily Stable Mixed Strategies . . . . . . . . . . . . . . . . . . . . .
220
7.6 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
225
8 Modeling Network Trac using Game Theory 229
8.1 Trac at Equilibrium . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
229
8.2 Braess's Paradox . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
231
8.3 Advanced Material: The Social Cost of Trac at Equilibrium . . . . . . . .
233
8.4 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
243
9 Auctions 249
9.1 Types of Auctions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
249
9.2 When are Auctions Appropriate? . . . . . . . . . . . . . . . . . . . . . . . .
251
9.3 Relationships between Dierent Auction Formats . . . . . . . . . . . . . . .
252
9.4 Second-Price Auctions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
254
9.5 First-Price Auctions and Other Formats . . . . . . . . . . . . . . . . . . . .
257
9.6 Common Values and The Winner's Curse . . . . . . . . . . . . . . . . . . . .
258
CONTENTS
5
9.7 Advanced Material: Bidding Strategies in First-Price and All-Pay Auctions .
260
9.8 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
268
III Markets and Strategic Interaction in Networks 275
10 Matching Markets 277
10.1 Bipartite Graphs and Perfect Matchings . . . . . . . . . . . . . . . . . . . .
277
10.2 Valuations and Optimal Assignments . . . . . . . . . . . . . . . . . . . . . .
282
10.3 Prices and the Market-Clearing Property . . . . . . . . . . . . . . . . . . . .
284
10.4 Constructing a Set of Market-Clearing Prices . . . . . . . . . . . . . . . . . .
288
10.5 How Does this Relate to Single-Item Auctions? . . . . . . . . . . . . . . . .
291
10.6 Advanced Material: A Proof of the Matching Theorem . . . . . . . . . . . .
293
10.7 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
302
11 Network Models of Markets with Intermediaries 311
11.1 Price-Setting in Markets . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
311
11.2 A Model of Trade on Networks . . . . . . . . . . . . . . . . . . . . . . . . .
315
11.3 Equilibria in Trading Networks . . . . . . . . . . . . . . . . . . . . . . . . .
322
11.4 Further Equilibrium Phenomena: Auctions and Ripple Eects . . . . . . . .
326
11.5 Social Welfare in Trading Networks . . . . . . . . . . . . . . . . . . . . . . .
330
11.6 Trader Prots . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
332
11.7 Re ections on Trade with Intermediaries . . . . . . . . . . . . . . . . . . . .
334
11.8 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
334
12 Bargaining and Power in Networks 339
12.1 Power in Social Networks . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
339
12.2 Experimental Studies of Power and Exchange . . . . . . . . . . . . . . . . .
342
12.3 Results of Network Exchange Experiments . . . . . . . . . . . . . . . . . . .
344
12.4 A Connection to Buyer-Seller Networks . . . . . . . . . . . . . . . . . . . . .
348
12.5 Modeling Two-Person Interaction: The Nash Bargaining Solution . . . . . .
349
12.6 Modeling Two-Person Interaction: The Ultimatum Game . . . . . . . . . . .
352
12.7 Modeling Network Exchange: Stable Outcomes . . . . . . . . . . . . . . . .
355
12.8 Modeling Network Exchange: Balanced Outcomes . . . . . . . . . . . . . . .
359
12.9 Advanced Material: A Game-Theoretic Approach to Bargaining . . . . . . .
361
12.10Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
369
IV Information Networks and the World Wide Web 373
13 The Structure of the Web 375
13.1 The World Wide Web . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
376
13.2 Information Networks, Hypertext, and Associative Memory . . . . . . . . . .
378
13.3 The Web as a Directed Graph . . . . . . . . . . . . . . . . . . . . . . . . . .
384
13.4 The Bow-Tie Structure of the Web . . . . . . . . . . . . . . . . . . . . . . .
388
6
CONTENTS
13.5 The Emergence of Web 2.0 . . . . . . . . . . . . . . . . . . . . . . . . . . . .
392
13.6 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
394
14 Link Analysis and Web Search 397
14.1 Searching the Web: The Problem of Ranking . . . . . . . . . . . . . . . . . .
397
14.2 Link Analysis using Hubs and Authorities . . . . . . . . . . . . . . . . . . .
399
14.3 PageRank . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
406
14.4 Applying Link Analysis in Modern Web Search . . . . . . . . . . . . . . . .
412
14.5 Applications beyond the Web . . . . . . . . . . . . . . . . . . . . . . . . . .
415
14.6 Advanced Material: Spectral Analysis, Random Walks, and Web Search . . .
417
14.7 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
429
15 Sponsored Search Markets 437
15.1 Advertising Tied to Search Behavior . . . . . . . . . . . . . . . . . . . . . .
437
15.2 Advertising as a Matching Market . . . . . . . . . . . . . . . . . . . . . . . .
440
15.3 Encouraging Truthful Bidding in Matching Markets: The VCG Principle . .
444
15.4 Analyzing the VCG Procedure: Truth-Telling as a Dominant Strategy . . . .
449
15.5 The Generalized Second Price Auction . . . . . . . . . . . . . . . . . . . . .
452
15.6 Equilibria of the Generalized Second Price Auction . . . . . . . . . . . . . .
456
15.7 Ad Quality . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
459
15.8 Complex Queries and Interactions Among Keywords . . . . . . . . . . . . .
461
15.9 Advanced Material: VCG Prices and the Market-Clearing Property . . . . .
462
15.10Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
478
V Network Dynamics: Population Models 481
16 Information Cascades 483
16.1 Following the Crowd . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
483
16.2 A Simple Herding Experiment . . . . . . . . . . . . . . . . . . . . . . . . . .
485
16.3 Bayes' Rule: A Model of Decision-Making Under Uncertainty . . . . . . . . .
489
16.4 Bayes' Rule in the Herding Experiment . . . . . . . . . . . . . . . . . . . . .
494
16.5 A Simple, General Cascade Model . . . . . . . . . . . . . . . . . . . . . . . .
496
16.6 Sequential Decision-Making and Cascades . . . . . . . . . . . . . . . . . . .
500
16.7 Lessons from Cascades . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
503
16.8 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
505
17 Network Eects 509
17.1 The Economy Without Network Eects . . . . . . . . . . . . . . . . . . . . .
510
17.2 The Economy with Network Eects . . . . . . . . . . . . . . . . . . . . . . .
514
17.3 Stability, Instability, and Tipping Points . . . . . . . . . . . . . . . . . . . .
517
17.4 A Dynamic View of the Market . . . . . . . . . . . . . . . . . . . . . . . . .
519
17.5 Industries with Network Goods . . . . . . . . . . . . . . . . . . . . . . . . .
526
17.6 Mixing Individual Eects with Population-Level Eects . . . . . . . . . . . .
528
17.7 Advanced Material: Negative Externalities and The El Farol Bar Problem .
533
CONTENTS
7
17.8 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
541
18 Power Laws and Rich-Get-Richer Phenomena 543
18.1 Popularity as a Network Phenomenon . . . . . . . . . . . . . . . . . . . . . .
543
18.2 Power Laws . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
545
18.3 Rich-Get-Richer Models . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
547
18.4 The Unpredictability of Rich-Get-Richer Eects . . . . . . . . . . . . . . . .
549
18.5 The Long Tail . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
551
18.6 The Eect of Search Tools and Recommendation Systems . . . . . . . . . . .
554
18.7 Advanced Material: Analysis of Rich-Get-Richer Processes . . . . . . . . . .
555
18.8 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
559
VI Network Dynamics: Structural Models 561
19 Cascading Behavior in Networks 563
19.1 Diusion in Networks . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
563
19.2 Modeling Diusion through a Network . . . . . . . . . . . . . . . . . . . . .
565
19.3 Cascades and Clusters . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
573
19.4 Diusion, Thresholds, and the Role of Weak Ties . . . . . . . . . . . . . . .
578
19.5 Extensions of the Basic Cascade Model . . . . . . . . . . . . . . . . . . . . .
580
19.6 Knowledge, Thresholds, and Collective Action . . . . . . . . . . . . . . . . .
583
19.7 Advanced Material: The Cascade Capacity . . . . . . . . . . . . . . . . . . .
587
19.8 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
603
20 The Small-World Phenomenon 611
20.1 Six Degrees of Separation . . . . . . . . . . . . . . . . . . . . . . . . . . . .
611
20.2 Structure and Randomness . . . . . . . . . . . . . . . . . . . . . . . . . . . .
612
20.3 Decentralized Search . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
616
20.4 Modeling the Process of Decentralized Search . . . . . . . . . . . . . . . . .
619
20.5 Empirical Analysis and Generalized Models . . . . . . . . . . . . . . . . . .
622
20.6 Core-Periphery Structures and Diculties in Decentralized Search . . . . . .
629
20.7 Advanced Material: Analysis of Decentralized Search . . . . . . . . . . . . .
631
20.8 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
642
21 Epidemics 645
21.1 Diseases and the Networks that Transmit Them . . . . . . . . . . . . . . . .
645
21.2 Branching Processes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
647
21.3 The SIR Epidemic Model . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
650
21.4 The SIS Epidemic Model . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
656
21.5 Synchronization . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
659
21.6 Transient Contacts and the Dangers of Concurrency . . . . . . . . . . . . . .
662
21.7 Genealogy, Genetic Inheritance, and Mitochondrial Eve . . . . . . . . . . . .
666
21.8 Advanced Material: Analysis of Branching and Coalescent Processes . . . . .
672
21.9 Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
685
8
CONTENTS
VII Institutions and Aggregate Behavior 689
22 Markets and Information 691
22.1 Markets with Exogenous Events . . . . . . . . . . . . . . . . . . . . . . . . .
692
22.2 Horse Races, Betting, and Beliefs . . . . . . . . . . . . . . . . . . . . . . . .
694
22.3 Aggregate Beliefs and the Wisdom of Crowds . . . . . . . . . . . . . . . .
700
22.4 Prediction Markets and Stock Markets . . . . . . . . . . . . . . . . . . . . .
704
22.5 Markets with Endogenous Events . . . . . . . . . . . . . . . . . . . . . . . .
708
22.6 The Market for Lemons . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
709
22.7 Asymmetric Information in Other Markets . . . . . . . . . . . . . . . . . . .
714
22.8 Signaling Quality . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
718
22.9 Quality Uncertainty On-Line: Reputation Systems and Other Mechanisms .
720
22.10Advanced Material: Wealth Dynamics in Markets . . . . . . . . . . . . . . .
723
22.11Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
730
23 Voting 735
23.1 Voting for Group Decision-Making . . . . . . . . . . . . . . . . . . . . . . .
735
23.2 Individual Preferences . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
737
23.3 Voting Systems: Majority Rule . . . . . . . . . . . . . . . . . . . . . . . . .
740
23.4 Voting Systems: Positional Voting . . . . . . . . . . . . . . . . . . . . . . . .
745
23.5 Arrow's Impossibility Theorem . . . . . . . . . . . . . . . . . . . . . . . . .
748
23.6 Single-Peaked Preferences and the Median Voter Theorem . . . . . . . . . .
750
23.7 Voting as a Form of Information Aggregation . . . . . . . . . . . . . . . . . .
756
23.8 Insincere Voting for Information Aggregation . . . . . . . . . . . . . . . . . .
758
23.9 Jury Decisions and the Unanimity Rule . . . . . . . . . . . . . . . . . . . . .
761
23.10Sequential Voting and the Relation to Information Cascades . . . . . . . . .
766
23.11Advanced Material: A Proof of Arrow's Impossibility Theorem . . . . . . . .
767
23.12Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
772
24 Property Rights 775
24.1 Externalities and the Coase Theorem . . . . . . . . . . . . . . . . . . . . . .
775
24.2 The Tragedy of the Commons . . . . . . . . . . . . . . . . . . . . . . . . . .
780
24.3 Intellectual Property . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
783
24.4 Exercises . . . . . . . . "

secondary_school_computer_science = "Chapter 1 INTRODUCTION TO COMPUTERS
1
1.1 History of Computers
1
1.2 Data, Information and Program
8
1.3 Hardware and Software
10
1.4 Types of Computers
15
Summary
21
Exercises
22
Chapter 2 NUMBER SYSTEMS
25
2.1 Introduction
25
2.2 Bits and Bytes
26
2.3 Decimal Number System
27
2.4 Binary Number System
28
2.5 Hexadecimal Number System
29
2.6 Decimal to Binary Conversion
30
2.7 Conversion of fractional decimal to binary 34
2.8 Conversion of Decimal to Hexadecimal 35
2.9 Octal Representation
36
2.10 Representation of signed numbers
37
2.11 Binary Arithmetic
42
2.12 Boolean Algebra
48
Exercises
61
Chapter 3 COMPUTER ORGANIZATION
64
3.1 Basic Components of a Digital Computer 64
3.2 Central Processing Unit
68
3.3 Arithmetic and Logic Unit – ALU
72
3.4 Memory Unit
74
3.5 Input and Output Devices
78
Summary
96
Exercises
98
Chapter 4 WORKING PRINCIPLE OF DIGITAL LOGIC 101
4.1 Logic Gates
101
4.2 Conversion of Boolean Function
115
4.3 Half Adder
122
4.4 Full Adder
124
4.5 The Flip-Flop
127
4.6 Electronic Workbench
131
Summary
151
Exercises
152
Chapter 5 OPERATING SYSTEMS
155
5.1 Introduction
155
5.2 Major Features of the Operating System 160
5.3 Most Desirable Characters of the
Operating System
162
Summary
168
Exercises
169
Chapter 6 COMPUTER COMMUNICATIONS
171
6.1 Introduction
171
6.2 Network
171
6.3 Some Important Reasons for Networking 171
6.4 Applications of Network
172
6.5 Benefits of Network
172
6.6 Types of Network
173
6.7 Network Topology
174
6.8 Basics of Networking
176
6.9 Common Network Services
177
6.10 Co-Ordinating Data Communication
179
6.11 Forms of Data Transmission
180
6.12 Modem
181
6.13 Data Transfer Rate
182
6.14 Transmission Mode
182
6.15
Internet
183
6.16 Communication Protocol
184
6.17
Who Governs the Internet ?
184
6.18
Future of Internet
185
6.19
Uses of Internet
185
6.20
Getting Connected to Internet
187
6.21 Popular Uses of the Web
190
6.22
Intranet and Extranet
191
Exercise"

primary_school_computer_science = "ntroduction1I Data: the raw material—Representing information71 Count the dots—Binary numbers112 Color by numbers—Image representation193 You can say that again!—Text compression274 Card flip magic—Error detection and correction335 Twenty guesses—Information theory41II Putting computers to work—Algorithms496 Battleships—Searching algorithms557 Lightest and heaviest—Sorting algorithms738 Beat the clock—Sorting networks839 The muddy city—Minimal spanning trees9110 The orange game—Routing and deadlock in networks97III Telling computers what to do—Representing procedures10311 Treasure hunt—Finite-state automata10712 Marching orders—Programming languages119From “Computer Science Unplugged”c©Bell, Witten, and Fellows, 1998Page vIV Really hard problems—Intractability12513 The poor cartographer—Graph coloring12914 Tourist town—Dominating sets14315 Ice roads—Steiner trees151V Sharing secrets and fighting crime—Cryptography16316 Sharing secrets—Information hiding protocols16917 The Peruvian coin flip—Cryptographic protocols17318 Kid krypto—Public-key encryption185VI The human face of computing—Interacting with computers19519 The chocolate factory—Human interface design19920 Conversations with computers—The Turing test213Conclusion 227Bibliography 229References 229Index2"

      wikipediator = Wikipediator.new
      
      new_item = ReutersNewItem.new      
      new_item.description = university_maths
      new_item.topics = "mathematics"
      new_item.has_topics =  "university"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = secondary_school_maths
      new_item.topics = "mathematics"
      new_item.has_topics =  "secondary_school"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = primary_school_maths
      new_item.topics = "mathematics"
      new_item.has_topics =  "primary_school"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = university_geography
      new_item.topics = "geography"
      new_item.has_topics =  "university"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = secondary_school_geography
      new_item.topics = "geography"
      new_item.has_topics =  "secondary_school"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = primary_school_geography
      new_item.topics = "geography"
      new_item.has_topics =  "primary_school"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = university_history
      new_item.topics = "history"
      new_item.has_topics =  "university"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = secondary_school_history
      new_item.topics = "history"
      new_item.has_topics =  "secondary_school"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = primary_school_history
      new_item.topics = "history"
      new_item.has_topics =  "primary_school"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = biology_university
      new_item.topics = "biology"
      new_item.has_topics =  "university"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = secondary_school_biology
      new_item.topics = "biology"
      new_item.has_topics =  "secondary_school"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit        
      
      new_item = ReutersNewItem.new      
      new_item.description = primary_education_biology
      new_item.topics = "biology"
      new_item.has_topics =  "primary education"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit             

      new_item = ReutersNewItem.new      
      new_item.description = university_computer_science
      new_item.topics = "computer_science"
      new_item.has_topics =  "university"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit  
      
      new_item = ReutersNewItem.new      
      new_item.description = secondary_school_computer_science
      new_item.topics = "computer_science"
      new_item.has_topics =  "secondary_school"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit        

      new_item = ReutersNewItem.new      
      new_item.description = primary_school_computer_science
      new_item.topics = "computer_science"
      new_item.has_topics =  "primary_school"
      new_item.extract_wikitopics("", new_item.description, [])
      new_item.save
      new_item.reload
      Sunspot.index new_item
      Sunspot.commit             
      
   end
   
   
   
   
end
                  