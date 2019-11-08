## One time ingridient upload

# Ingredient.destroy_all
# require 'json'
# require 'open-uri'

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# ingredients_serialized = open(url).read
# ingredients = JSON.parse(ingredients_serialized)

# puts 'Creating ingredients...'

# ingredients["drinks"].each do |ingredient|
#   Ingredient.create!(name: ingredient["strIngredient1"])
# end

# puts 'Finished creating generic ingredients!'

cocktails_hash =
{
  "I Am Sean Archer" =>
  {
    "ingredients" => ["Old Overholt Rye", "Noilly Pratt Vermouth", "Cinnamon syrup", "lemon and pineapple juices"],
    "image_url" => "https://bevvyco.s3.amazonaws.com/img/drinks/hy/bfhy/penicillin-2d142816380e1e79f377b3871781b479-lg.jpg"
  },
  "I Am Castor Troy" =>
  {
    "ingredients" => ["Lemonhart 151 Rum", "Cardamaro", "Fernet Branca", "Swedish Punsch", "soda"],
    "image_url" => "https://i.pinimg.com/originals/e0/5d/93/e05d936b38adc743e20d1abed6594953.jpg"
  },
  "I Could Eat a Peach For Hours" =>
  {
    "ingredients" => ["Old Granddad Bonded Bourbon", "Dolin Blanc Vermouth", "Creme de Peche", "honey", "lime juice", "angostura bitters"],
    "image_url" => "https://stripedspatula.com/wp-content/uploads/2018/08/bourbon-peach-smash-4-680x952.jpg"
  },
  "Golden Pistols" =>
  {
    "ingredients" => ["Sombra Mezcal", "Pineau de Charentes", "Pierre Ferrand Dry Curacao", "Plymouth Gin", "Campari", "Cane syrup"],
    "image_url" => "https://cdn.pastemagazine.com/www/articles/shade%20mezcal%20long.jpg"
  },
  "Doves At a Firefight" =>
  {
    "ingredients" => ["Byrrh", "Black Grouse Scotch", "Poire William eau de vie", "Peychaud's bitters", "long hot tincture"],
    "image_url" => "https://pbs.twimg.com/media/Dqs6mkHWwAIBFcs.jpg"
  },
  "Face Palm" =>
  {
    "ingredients" => ["A shot", "a beer"],
    "image_url" => "https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1440,w_2559,x_0,y_0/dpr_1.5/c_limit,w_1044/fl_lossy,q_auto/v1507074391/171003-rothbuam-beer-shot-tease_vxnu3w"
  }
}

####################
puts "Destroying all doses, cocktails and ingredients"
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all
puts "Finished destroying all doses, cocktails and ingredients"

####################
puts "Creating NC cocktails"
cocktails_hash.each do |key, value|
  Cocktail.create!(name: key, image_url: value["image_url"])
end
puts "Finished creating NC cocktails"

####################
puts "Creating NC ingredients"
cocktails_hash.each do |key, value |
  value["ingredients"].each { |ingredient| Ingredient.create!(name: ingredient) }
end
puts "Finished creating NC ingredients"


####################
puts "Creating NC doses"
cocktails_hash.each do |key, value|

  value["ingredients"].each do |ingredient|
     Dose.create!(
      description: "1",
      cocktail: Cocktail.find_by(name: key),
      ingredient: Ingredient.find_by(name: ingredient)
    )
  end

end
puts "Finished creating NC doses"
