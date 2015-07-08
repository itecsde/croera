# encoding: utf-8
class TranslateTemplate
  
    def translate_activity
      # "The teacher may look forward to..."
      text1=Activity.find(15).boxes[0].components[0].texts[0]      
      save_text_translation("es",text1.id,"El profesor puede desear...")
      save_text_translation("fi",text1.id,"Opettaja voi odottaa ...")
      save_text_translation("fr",text1.id,"L'enseignant peut se réjouir de...")
      save_text_translation("lt",text1.id,"Mokytojas gali laukti...")
      save_text_translation("nl",text1.id,"De leerkracht kan zich verheugen op...")
      save_text_translation("no",text1.id,"Læreren kan se frem til ...")
      save_text_translation("pt",text1.id,"O professor pode esperar que ...")
      save_text_translation("sk",text1.id,"Učiteľ sa môže tešiť na...")
      save_text_translation("tr",text1.id,"Öğretmenin bekleyebilecekleri...")
      
      #"The students may learn..."
      text2=Activity.find(15).boxes[1].components[0].texts[0]
      save_text_translation("es",text2.id,"Los estudiantes pueden aprender...")
      save_text_translation("fi",text2.id,"Opiskelijat voivat oppia ...")
      save_text_translation("fr",text2.id,"Les élèves peuvent apprendre...")
      save_text_translation("lt",text2.id,"Mokiniai gali mokytis...")
      save_text_translation("nl",text2.id,"De studenten kunnen leren...")
      save_text_translation("no",text2.id,"Elevene kan lære ...")
      save_text_translation("pt",text2.id,"Os alunos podem aprender ...")
      save_text_translation("sk",text2.id,"Študenti sa môžu naučiť...")
      save_text_translation("tr",text2.id,"Öğrencilerin öğrenebilecekleri...")
     
      #"Guidelines"
      text3=Activity.find(15).boxes[3].components[0].texts[0]
      save_text_translation("es",text3.id,"Directrices")
      save_text_translation("fi",text3.id,"Ohjeet")
      save_text_translation("fr",text3.id,"Consignes")
      save_text_translation("lt",text3.id,"Gairės")
      save_text_translation("nl",text3.id,"Richtlijnen")
      save_text_translation("no",text3.id,"Retningslinjer")
      save_text_translation("pt",text3.id,"Orientações")
      save_text_translation("sk",text3.id,"Návod")
      save_text_translation("tr",text3.id,"Yönergeler")
      
      #"1. Preparation"
      text4=Activity.find(15).boxes[4].components[0].texts[0]
      save_text_translation("es",text4.id,"1. Preparación")
      save_text_translation("fi",text4.id,"1. Valmistautuminen")
      save_text_translation("fr",text4.id,"1. Préparation")
      save_text_translation("lt",text4.id,"1. Pasiruošimas")
      save_text_translation("nl",text4.id,"1. Voorbereiding")
      save_text_translation("no",text4.id,"1. Forberedelse")
      save_text_translation("pt",text4.id,"1. Preparação")
      save_text_translation("sk",text4.id,"1. Príprava")
      save_text_translation("tr",text4.id,"1. Hazırlama")      

      #"2. Introduction"
      text5=Activity.find(15).boxes[5].components[0].texts[0]
      save_text_translation("es",text5.id,"2. Introducción")
      save_text_translation("fi",text5.id,"2. Johdanto")
      save_text_translation("fr",text5.id,"2. Introduction")
      save_text_translation("lt",text5.id,"2. Įvadas")
      save_text_translation("nl",text5.id,"2. Introductie")
      save_text_translation("no",text5.id,"2. Innledning")
      save_text_translation("pt",text5.id,"2. Introdução")
      save_text_translation("sk",text5.id,"2. Úvod")
      save_text_translation("tr",text5.id,"2. Giriş")
      
      #"3. Development"
      text6=Activity.find(15).boxes[6].components[0].texts[0]
      save_text_translation("es",text6.id,"3. Desarrollo")
      save_text_translation("fi",text6.id,"3. Kehittäminen")
      save_text_translation("fr",text6.id,"3. Développement")
      save_text_translation("lt",text6.id,"3. Kūrimas")
      save_text_translation("nl",text6.id,"3. Ontwikkeling")
      save_text_translation("no",text6.id,"3. Utvikling")
      save_text_translation("pt",text6.id,"3. Desenvolvimento")
      save_text_translation("sk",text6.id,"3. Rozvoj")
      save_text_translation("tr",text6.id,"3. Geliştirme")      
      
      #"4. Assessment"
      text7=Activity.find(15).boxes[7].components[0].texts[0]
      save_text_translation("es",text7.id,"4. Evaluación")
      save_text_translation("fi",text7.id,"4. Arviointi")
      save_text_translation("fr",text7.id,"4. Évaluation")
      save_text_translation("lt",text7.id,"4. Įvertinimas")
      save_text_translation("nl",text7.id,"4. Beoordeling")
      save_text_translation("no",text7.id,"4. Vurdering")
      save_text_translation("pt",text7.id,"4. Avaliação")
      save_text_translation("sk",text7.id,"4. Hodnotenie")
      save_text_translation("tr",text7.id,"4. Değerlendirme")      

      #"Ideas for using technology"
      text8=Activity.find(15).boxes[9].components[0].texts[0]
      save_text_translation("es",text8.id,"Ideas para usar la tecnología")
      save_text_translation("fi",text8.id,"Ideoita käyttää teknologiaa")
      save_text_translation("fr",text8.id,"Idées pour utiliser la technologie...")
      save_text_translation("lt",text8.id,"Technologijų panaudojimo idėjos...")
      save_text_translation("nl",text8.id,"Ideeën om technologie te gebruiken...")
      save_text_translation("no",text8.id,"Ideer til bruk av teknologi ...")
      save_text_translation("pt",text8.id,"Ideias para usar a tecnologia ...")
      save_text_translation("sk",text8.id,"Námety na využívanie technológií...")
      save_text_translation("tr",text8.id,"Teknoloji kullanmak fikirleri...")       
      
    end
    
    
    
    def translate_scenario
      #Core purpose
      text1=Scenario.first.boxes[0].components[0].texts[0]
      save_text_translation("es",text1.id,"Propósito principal")
      save_text_translation("fi",text1.id,"Ydintarkoitus")
      save_text_translation("fr",text1.id,"Objectif principal")
      save_text_translation("lt",text1.id,"Pagrindinis tikslas")
      save_text_translation("nl",text1.id,"Kerndoel")
      save_text_translation("no",text1.id,"Nøkkelformål")
      save_text_translation("pt",text1.id,"Propósito principal")
      save_text_translation("sk",text1.id,"Hlavný účel")
      save_text_translation("tr",text1.id,"Temel amaç")
      
      #Narrative overview
      text2=Scenario.first.boxes[2].components[0].texts[0]
      save_text_translation("es",text2.id,"Resumen narrativo")
      save_text_translation("fi",text2.id,"Narratiivinen yleiskatsaus")
      save_text_translation("fr",text2.id,"Aperçu narratif")
      save_text_translation("lt",text2.id,"Pasakojamoji apžvalga")
      save_text_translation("nl",text2.id,"Overzichtsverhaal")
      save_text_translation("no",text2.id,"Beskrivende oversikt")
      save_text_translation("pt",text2.id,"Visão global da narrativa")
      save_text_translation("sk",text2.id,"Popis")
      save_text_translation("tr",text2.id,"Öykü özeti")
      
      #Trend/s
      text3=Scenario.first.boxes[4].components[0].texts[0]
      save_text_translation("es",text3.id,"Tendencia/s")
      save_text_translation("fi",text3.id,"Suuntaukset")
      save_text_translation("fr",text3.id,"Tendance/s")
      save_text_translation("lt",text3.id,"Tendencija (-os)")
      save_text_translation("nl",text3.id,"Trend/s")
      save_text_translation("no",text3.id,"Trend/er")
      save_text_translation("pt",text3.id,"Tendência/s")
      save_text_translation("sk",text3.id,"Trend/y")
      save_text_translation("tr",text3.id,"Trend/ler")
      
      #Possible approaches to teaching and assessment      
      text4=Scenario.first.boxes[6].components[0].texts[0]
      save_text_translation("es",text4.id,"Posibles enfoques para la enseñanza y la evaluación")
      save_text_translation("fi",text4.id,"Mahdollisia lähestymistapoja opetus ja arviointi")
      save_text_translation("fr",text4.id,"Approches possibles à l'enseignement et l'évaluation")
      save_text_translation("lt",text4.id,"Galimi mokymo ir vertinimo metodai")
      save_text_translation("nl",text4.id,"Mogelijke les- en beoordelingsaanpakken")
      save_text_translation("no",text4.id,"Mulige tilnærminger til undervisning og vurdering")
      save_text_translation("pt",text4.id,"Possíveis abordagens para o ensino e avaliação")
      save_text_translation("sk",text4.id,"Možné prístupy k vyučovaniu a hodnoteniu")
      save_text_translation("tr",text4.id,"Öğretim ve değerlendirmeye olası yaklaşımlar")
      
      #Environment
      text5=Scenario.first.boxes[7].components[0].texts[0]
      save_text_translation("es",text5.id,"Entorno")
      save_text_translation("fi",text5.id,"Ympäristö")
      save_text_translation("fr",text5.id,"Environment")
      save_text_translation("lt",text5.id,"Aplinka")
      save_text_translation("nl",text5.id,"Omgeving")
      save_text_translation("no",text5.id,"Miljø")
      save_text_translation("pt",text5.id,"Ambiente")
      save_text_translation("sk",text5.id,"Prostredie")
      save_text_translation("tr",text5.id,"Çevre")
      
      #People and roles
      text6=Scenario.first.boxes[9].components[0].texts[0]
      save_text_translation("es",text6.id,"Personas y roles")
      save_text_translation("fi",text6.id,"Ihmiset ja roolit")
      save_text_translation("fr",text6.id,"Personnes et rôles")
      save_text_translation("lt",text6.id,"Žmonės ir vaidmenys")
      save_text_translation("nl",text6.id,"Mensen en rollen")
      save_text_translation("no",text6.id,"Kontakter og roller")
      save_text_translation("pt",text6.id,"Pessoas e papéis")
      save_text_translation("sk",text6.id,"Ľudia a úlohy")
      save_text_translation("tr",text6.id,"İnsanlar ve roller")
      
      #Activities
      text7=Scenario.first.boxes[11].components[0].texts[0]
      save_text_translation("es",text7.id,"Actividades")
      save_text_translation("fi",text7.id,"Aktiviteetit")
      save_text_translation("fr",text7.id,"Activités")
      save_text_translation("lt",text7.id,"Veikla")
      save_text_translation("nl",text7.id,"Activiteiten")
      save_text_translation("no",text7.id,"Aktiviteter")
      save_text_translation("pt",text7.id,"Atividades")
      save_text_translation("sk",text7.id,"Aktivity")
      save_text_translation("tr",text7.id,"Etkinlikler")
      
      #Resources (Including technologies)
      text8=Scenario.first.boxes[12].components[0].texts[0]
      save_text_translation("es",text8.id,"Recursos (Incluyendo tecnologias)")
      save_text_translation("fi",text8.id,"Resurssit (mukaan luettuina tekniikat)")
      save_text_translation("fr",text8.id,"Ressources (technologies y comprises)")
      save_text_translation("lt",text8.id,"Ištekliai (įskaitant technologijas)")
      save_text_translation("nl",text8.id,"Middelen (Inclusief technologieën)")
      save_text_translation("no",text8.id,"Ressurser (inkludert teknologi)")
      save_text_translation("pt",text8.id,"Recursos (incluindo tecnologias)")
      save_text_translation("sk",text8.id,"Zdroje (vrátane technológií)")
      save_text_translation("tr",text8.id,"Kaynaklar (Teknolojiler dahil)")
                  
    end
    
    
    def save_text_translation(iso_language,text_id,text)
      translate1=TextTranslation.new
      translate1.text_id=text_id
      translate1.locale=iso_language
      translate1.content=text
      translate1.save
    end
      
end