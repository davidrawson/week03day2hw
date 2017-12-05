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

  def update
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "UPDATE bounty_hunters set
    (name, species, weapon, bounty_value)
    =
    ($1, $2, $3, $4)
    WHERE id=$5"
    values = [@name, @species, @weapon, @bounty_value, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "DELETE FROM bounty_hunters WHERE id = $1"

    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def find
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "SELECT * FROM bounty_hunters WHERE id=$1"
    values = [@id]
    db.prepare("find", sql)
    hunters = db.exec_prepared("find", values)
    db.close()
    return hunters.map {|hunter| Bounty.new(hunter)}
  end

end
