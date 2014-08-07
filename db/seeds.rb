# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

director = Person.create(name: :Akira, lastname: :Toriyama, age: 35)
writer = Person.create(name: :Shigeru, lastname: :Miyamoto, age: 25)
studio = Studio.create(name: :Gonzo, industry: :Anime, website: "www.gonzo.jp", founded: Date.today.mongoize)
network = Network.create(name: :Gainax, region: :Asian)
e_network= Network.create(name: :Animax, region: :Latin_American)

director.save
writer.save
studio.save
network.save
e_network.save

publisher = Entity.create(name: :publisher1, entity_type: :publisher)
engish_publisher = Entity.create(name: :publisher2, entity_type: :publisher)
magazine = Entity.create(name: :magazine1, entity_type: :magazine)

publisher.save
engish_publisher.save
magazine.save

manga = Manga.create(name: :Gantz,english_publisher:engish_publisher, writer: writer, publisher: publisher, magazine: magazine,start_run_date: Date.today.mongoize, end_run_date: Date.today.mongoize,volumes: 5)

manga.save

anime = Anime.create(director: director, studio: studio, network: network,
    english_network: e_network, start_run_date: Date.today.mongoize, end_run_date: Date.today.mongoize,
    episode: 24, manga: manga)

anime.save
