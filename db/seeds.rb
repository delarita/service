# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#create map

Salon.create(address: '225 Chemin Saint-Georges, Residence Lou Casteu, 13150 Tarascon', name:"Relook Esthétique", latitude: '43.80929033885456', longitude: '4.665644661374886')
puts 'Map créée'

#create epilations
Epilation.create(name:"Forfait 1/2 jambes:", description: "Lèvres + sourcils + 1/2 jambes + maillot intégral ou intégral + aisselles", price_cents:4000, user_id:1)
Epilation.create(name:"Forfait Jambes entières:", description:"Lèvres + sourcils + jambes entières + maillot intégral ou intégral + aisselles", price_cents:4500, user_id:1)
Epilation.create(name:"Lèvres, sourcils ou menton", price_cents:700, user_id:1)
Epilation.create(name:"Structuration des sourcils", price_cents:1300, user_id:1)
Epilation.create(name:"Aisselles", price_cents:1000, user_id:1)
Epilation.create(name:"Bras", price_cents:1500, user_id:1)
Epilation.create(name:"Torse", price_cents:2000, user_id:1)
Epilation.create(name:"Dos", price_cents:2000, user_id:1)
Epilation.create(name:"Maillot simple", price_cents:1400, user_id:1)
Epilation.create(name:"Maillot intégral", price_cents:2200, user_id:1)
Epilation.create(name:"1/2 jambe", price_cents:1500, user_id:1)
Epilation.create(name:"Jambes entières", price_cents:2400, user_id:1)




puts 'Epilations créées'

#create massages
Massage.create(name:"Drainant ou relaxant: 30 mnts", price_cents:3000, user_id:1)
Massage.create(name:"Drainant ou relaxant: 1h", price_cents:5000, user_id:1)

puts 'Massages créés'

#create soins du visage
Soinvisage.create(name:"Forfait Matinée ou Après midi « Bien être » – (3h)", description: "Soins du visage + modelage du corps  + manucure", price_cents: 9500, user_id:1)

Soinvisage.create(name:"Soin du visage à l'Aloe Vera", price_cents:5000, user_id:1)
Soinvisage.create(name:"Soin du visage galvanic spa", price_cents:5500, user_id:1)
Soinvisage.create(name:"Teinture des cils ou sourcils", price_cents:1000, user_id:1)
puts 'Soins du Visage créés'

#create maquillage permanent
Maquillage.create(name:"Contour des lèvres", price_cents:31000, user_id:1)
Maquillage.create(name:"Contour des lèvres + remplissage", price_cents:39000, user_id:1)
Maquillage.create(name:"Sourcil effet naturel (poil à poil)", price_cents:29000, user_id:1)
Maquillage.create(name:"Eye liner supérieur", price_cents:21000, user_id:1)
Maquillage.create(name:"Eye liner inférieur", price_cents:17000, user_id:1)
Maquillage.create(name:"Eye liner supérieur + inférieur", price_cents:34000, user_id:1)


puts 'Maquillages permanents créés'