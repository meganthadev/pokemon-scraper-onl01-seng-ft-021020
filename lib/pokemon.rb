class Pokemon
  
  attr_accessor :name, :type, :db 
  attr_reader :id
  
  @@all = []
  
  def initialize(id=nil, name:, type:, db:)
   @id = id
   @name = name
   @type = type
   @db = db
   @@all << self
  end  
  
  def self.new_from_db(row)
    new_poke = self.new 
    new_poke.id = row[0]
    new_poke.name = row[1]
    new_poke.type = row[2]
    new_poke 
  end   
  
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 

  def self.find(num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    return new_pokemon
  end
  
  
  
  
end
