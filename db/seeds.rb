# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#create map
Salon.destroy_all
Salon.create(address: '225 Chemin Saint-Georges, Residence Lou Casteu, 13150 Tarascon', name:"Relook Esthétique", latitude: '43.80929033885456', longitude: '4.665644661374886')
puts 'Map créée'

#create epilations
Epilation.destroy_all

Epilation.create(description: "homme", name:"Oreilles, narines", price_cents:700, user_id:1)
Epilation.create(description: "homme", name:"Torse, dos", price_cents:2000, user_id:1)
Epilation.create(description: "homme",name:"Bras", price_cents:2000, user_id:1)
Epilation.create(description: "homme",name:"Jambes", price_cents:3000, user_id:1)


Epilation.create(description: "femme", name:"Lèvres, sourcils", price_cents:700, user_id:1)
Epilation.create(description: "femme", name:"Structuration des sourcils", price_cents:1300, user_id:1)
Epilation.create(description: "femme", name:"Aisselles", price_cents:1000, user_id:1)
Epilation.create(description: "femme", name:"Bras", price_cents:1500, user_id:1)
Epilation.create(description: "femme", name:"Maillot échancré", price_cents:1500, user_id:1)
Epilation.create(description: "femme", name:"Maillot intégral", price_cents:2200, user_id:1)
Epilation.create(description: "femme", name:"1/2 jambe", price_cents:1500, user_id:1)
Epilation.create(description: "femme", name:"Jambes", price_cents:2400, user_id:1)
Epilation.create(description: "femme", name:"Forfait lèvres ~ sourcils ~ aisselles ~ maillot échancré ~ 1/2 jambes", price_cents:4000, user_id:1)






puts 'Epilations créées'
Massage.destroy_all
#create massages
Massage.create(name:"Massage drainant: 1h", price_cents:5000, user_id:1)
Massage.create(name:"Massage relaxant (californien): 1h", price_cents:5000, user_id:1)
Massage.create(name:"Rééquilibrage énergétique: 1h", price_cents:5000, user_id:1)
Massage.create(name:"Massage spécifique du dos: 30 mn", price_cents:3000, user_id:1)
Massage.create(name:"Massage spécifique des pieds: 30 mn", price_cents:3000, user_id:1)

puts 'Massages créés'


Soinvisage.destroy_all
#create soins du visage

Soinvisage.create(description: "Soins du visage", name:"Soin Homme 60 mn", price_cents: 5000, user_id:1)
Soinvisage.create(description: "Soins du visage", name:"Soin Junior 30 mn", price_cents:2500, user_id:1)
Soinvisage.create(description: "Soins du visage", name:"Soin régénérant 60 mn", price_cents:5000, user_id:1)
Soinvisage.create(description: "Soins du visage", name:"Soin purifiant 60 mn", price_cents: 5000, user_id:1)
Soinvisage.create(description: "Soins du visage", name:"Soin spécifique et anti âge repulpant 70 mn", price_cents:6000, user_id:1)
Soinvisage.create(description: "Soins du visage", name:"Forfait spécifique et anti âge repulpant ~ 5 soins ~ 5 semaines", price_cents:25000, user_id:1)
Soinvisage.create(description: "Soins du visage", name:"Forfait matinée ou après midi bien-être: Soin visage + Modelage (1h) + Manucure 2h30", price_cents:9500, user_id:1)

Soinvisage.create(description: "Soins Esthétiques", name:"Teinture cils ou sourcils", price_cents: 1000, user_id:1)
Soinvisage.create(description: "Soins Esthétiques", name:"Manucure ", price_cents:2500, user_id:1)
Soinvisage.create(description: "Soins Esthétiques", name:"Soin spécifique des pieds", price_cents:3500, user_id:1)
Soinvisage.create(description: "Soins Esthétiques", name:"Pose vernis", price_cents:800, user_id:1)


puts 'Soins du Visage créés'

Maquillage.destroy_all
#create maquillage permanent
Maquillage.create(name:"Contour des lèvres", price_cents:31000, user_id:1)
Maquillage.create(name:"Contour des lèvres + remplissage", price_cents:39000, user_id:1)
Maquillage.create(name:"Sourcil effet naturel (poil à poil)", price_cents:29000, user_id:1)
Maquillage.create(name:"Eye liner supérieur", price_cents:21000, user_id:1)
Maquillage.create(name:"Eye liner inférieur", price_cents:17000, user_id:1)
Maquillage.create(name:"Eye liner supérieur + inférieur", price_cents:34000, user_id:1)


puts 'Maquillages permanents créés'