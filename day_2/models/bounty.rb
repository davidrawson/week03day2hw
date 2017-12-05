require ('pg')

class Bounty()

  attr_accessor :name, :species, :weapon, :bounty_value
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @species = options['species']
    @weapon = options['weapon']
    @bounty_value = options['weapon']
  end


end
