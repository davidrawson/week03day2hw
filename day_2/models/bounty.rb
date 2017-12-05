require ('pg')

class Bounty

  attr_accessor :name, :species, :weapon, :bounty_value
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @species = options['species']
    @weapon = options['weapon']
    @bounty_value = options['bounty_value'].to_i
  end

  def save()
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "INSERT INTO bounty_hunters
      (name, species, weapon, bounty_value)
      VALUES
      ($1, $2, $3, $4)
      RETURNING *"

    values = [@name, @species, @weapon, @bounty_value]

    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

end
