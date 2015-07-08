# encoding: utf-8
class ReviewDatabase
   def self.translate_educational_levels_portuguese
      a = EducationLevel.find(1)
      I18n.locale = :pt
      a.name = "Pós-graduação"
      I18n.locale = :en
      a.save
      a = EducationLevel.find(2)
      I18n.locale = :pt
      a.name = "Ensino Superior"
      I18n.locale = :en
      a.save
      a = EducationLevel.find(3)
      I18n.locale = :pt
      a.name = "Secundário"
      I18n.locale = :en
      a.save
      a = EducationLevel.find(4)
      I18n.locale = :pt
      a.name = "3º Ciclo do Ensino Básico"
      I18n.locale = :en
      a.save
      a = EducationLevel.find(5)
      I18n.locale = :pt
      a.name = "2º Ciclo do Ensino Básico"
      I18n.locale = :en
      a.save
      a = EducationLevel.find(6)
      I18n.locale = :pt
      a.name = "1º Ciclo do Ensino Básico"
      I18n.locale = :en
      a.save
      a = EducationLevel.find(7)
      I18n.locale = :pt
      a.name = "Pré-escolar"
      I18n.locale = :en
      a.save
   end
   

   def self.translate_subjects_portuguese
      a = Subject.find(1)
      I18n.locale = :pt
      a.name = "Arte"
      I18n.locale = :en
      a.save
      
      a = Subject.find(2)
      I18n.locale = :pt
      a.name = "Astronomia"
      I18n.locale = :en
      a.save
      
      a = Subject.find(3)
      I18n.locale = :pt
      a.name = "Biologia"
      I18n.locale = :en
      a.save
      
      a = Subject.find(4)
      I18n.locale = :pt
      a.name = "Química"
      I18n.locale = :en
      a.save
      
      a = Subject.find(5)
      I18n.locale = :pt
      a.name = "Cidadania"
      I18n.locale = :en
      a.save

      a = Subject.find(6)
      I18n.locale = :pt
      a.name = "Línguas Clássicas (Latim ou Grego)"
      I18n.locale = :en
      a.save
      
      a = Subject.find(7)
      I18n.locale = :pt
      a.name = "Educação Transdisciplinar"
      I18n.locale = :en
      a.save
      
      a = Subject.find(8)
      I18n.locale = :pt
      a.name = "Cultura"
      I18n.locale = :en
      a.save
      
      a = Subject.find(9)
      I18n.locale = :pt
      a.name = "Economia"
      I18n.locale = :en
      a.save
      
      a = Subject.find(10)
      I18n.locale = :pt
      a.name = "Administração Escolar"
      I18n.locale = :en
      a.save
      
      a = Subject.find(11)
      I18n.locale = :pt
      a.name = "Educação Ambiental"
      I18n.locale = :en
      a.save
      
      a = Subject.find(12)
      I18n.locale = :pt
      a.name = "Ética"
      I18n.locale = :en
      a.save
      
      a = Subject.find(13)
      I18n.locale = :pt
      a.name = "Estudos Europeus"
      I18n.locale = :en
      a.save
      
      a = Subject.find(14)
      I18n.locale = :pt
      a.name = "Linguas Estrangeiras"
      I18n.locale = :en
      a.save
      
      a = Subject.find(15)
      I18n.locale = :pt
      a.name = "Geografia"
      I18n.locale = :en
      a.save
      
      a = Subject.find(16)
      I18n.locale = :pt
      a.name = "Geologia"
      I18n.locale = :en
      a.save
      
      a = Subject.find(17)
      I18n.locale = :pt
      a.name = "Saúde"
      I18n.locale = :en
      a.save
      
      a = Subject.find(18)
      I18n.locale = :pt
      a.name = "Historía"
      I18n.locale = :en
      a.save
      
      a = Subject.find(19)
      I18n.locale = :pt
      a.name = "Economia Doméstica"
      I18n.locale = :en
      a.save
      
      a = Subject.find(20)
      I18n.locale = :pt
      a.name = "Informática/TIC"
      I18n.locale = :en
      a.save
      
      a = Subject.find(21)
      I18n.locale = :pt
      a.name = "Português" #"Lingua e Literatura"
      I18n.locale = :en
      a.save
      
      a = Subject.find(22)
      I18n.locale = :pt
      a.name = "Dereito"
      I18n.locale = :en
      a.save
      
      a = Subject.find(23)
      I18n.locale = :pt
      a.name = "Matemática"
      I18n.locale = :en
      a.save
      
      a = Subject.find(24)
      I18n.locale = :pt
      a.name = "Educação Multimédia"
      I18n.locale = :en
      a.save
      
      a = Subject.find(25)
      I18n.locale = :pt
      a.name = "Educação Musical"
      I18n.locale = :en
      a.save
      
      a = Subject.find(26)
      I18n.locale = :pt
      a.name = "Ciéncias Naturais"
      I18n.locale = :en
      a.save
      
      a = Subject.find(27)
      I18n.locale = :pt
      a.name = "Filosofía"
      I18n.locale = :en
      a.save
      
      a = Subject.find(28)
      I18n.locale = :pt
      a.name = "Educação Física"
      I18n.locale = :en
      a.save
      
      a = Subject.find(29)
      I18n.locale = :pt
      a.name = "Física"
      I18n.locale = :en
      a.save
      
      a = Subject.find(30)
      I18n.locale = :pt
      a.name = "Politica"
      I18n.locale = :en
      a.save
      
      a = Subject.find(31)
      I18n.locale = :pt
      a.name = "Ensino Pré-escolar"
      I18n.locale = :en
      a.save
      
      a = Subject.find(32)
      I18n.locale = :pt
      a.name = "1º Ciclo do Ensino Básico"
      I18n.locale = :en
      a.save
      
      a = Subject.find(33)
      I18n.locale = :pt
      a.name = "Psicologia"
      I18n.locale = :en
      a.save
      
      a = Subject.find(34)
      I18n.locale = :pt
      a.name = "Educação Moral e Religiosa"
      I18n.locale = :en
      a.save
      
      a = Subject.find(35)
      I18n.locale = :pt
      a.name = "Relação Escola-comunidade"
      I18n.locale = :en
      a.save
      
      a = Subject.find(36)
      I18n.locale = :pt
      a.name = "Ciências Sociais"
      I18n.locale = :en
      a.save
      
      a = Subject.find(37)
      I18n.locale = :pt
      a.name = "Ensino Especial"
      I18n.locale = :en
      a.save
      
      a = Subject.find(38)
      I18n.locale = :pt
      a.name = "Tecnologia"
      I18n.locale = :en
      a.save
      
      b = Subject.new
      b.name = "Other"      
      I18n.locale = :es
      b.name = "Otra"
      I18n.locale = :gl
      b.name = "Outra"
      I18n.locale = :pt
      b.name = "Outra"
      I18n.locale = :en
      b.name = "Other"      
      b.save
   end
   
   
   
end