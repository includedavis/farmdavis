# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# These crop names are ridiculious so don't load them into production
unless rails.env.production?
corn = Crop.create(name: "corn").category_crops
broc = Crop.create(name: "broccoli").category_crops
devl = Crop.create(name: "devil's lettuce").category_crops
kush = Crop.create(name: "kuuuush").category_crops
greenCategory = Category.create(name: "dat green")

broc.save(category: greenCategory)
devl.save(category: greenCategory)
kush.save(category: greenCategory)
end
