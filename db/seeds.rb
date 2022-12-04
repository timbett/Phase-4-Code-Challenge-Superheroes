# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
    Hero.create(
        name:Faker::Name.name,
        super_name:Faker::Superhero.name

    )
end

10.times do
    Power.create(
        name:Faker::Superhero.power,
        description:Faker::Superhero.descriptor
    )
end

20.times do
    HeroPower.create(
        strength:['Strong', 'Weak', 'Average'].sample,
        power_id:rand(1..10),
        hero_id:rand(1..10)

    )
end