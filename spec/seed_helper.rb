def fake_seed
  corn = Crop.create(name: "corn").category_crop
  broc = Crop.create(name: "broccoli").category_crop
  devl = Crop.create(name: "devil's lettuce").category_crop
  kush = Crop.create(name: "kuuuush").category_crop
  greenCategory = Category.create(name: "dat green")

  broc.save(category: greenCategory)
  devl.save(category: greenCategory)
  kush.save(category: greenCategory)
end
