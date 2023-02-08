puts "🌱 seeding database..."

tr = Dog.create(
  name: "Tiger Rose", 
  birthdate: "2017-07-04", 
  breed: "Jindo", 
  image_url: "https://www.akc.org/wp-content/uploads/2017/11/Jindo-standing-in-the-yard.jpg"
)
lola = Dog.create(
  name: "Lola",	
  birthdate: "2018-03-31",
  breed:	"Lab Mix",
  image_url: "https://puppyintraining.com/wp-content/uploads/black-lab-border-collie-mix.jpeg"
)

# create a couple of walks and feedings for Lennon 
Walk.create(time: 1.hour.ago, dog: tr)
Walk.create(time: 1.day.ago, dog: lola)

# create a couple of walks and feedings for Olivia
Feeding.create(time: 3.hours.ago, dog_id: tr.id)
Feeding.create(time: 2.days.ago, dog: lola)

puts "seeding complete... 🌱"