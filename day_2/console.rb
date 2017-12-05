require ('pry-byebug')

require_relative('./models/bounty.rb')


bounty_hunter1 = Bounty.new({
  'name' => 'Boba Fett',
  'species'  => 'human',
  'weapon'  => 'blaster',
  'bounty_value' => '900'
})
bounty_hunter2 = Bounty.new({
  'name' => 'Jango Fett',
  'species'  => 'slug',
  'weapon'  => 'whip',
  'bounty_value' => '100'
})

bounty_hunter1.save()
bounty_hunter2.save()


bounty_hunter1.name = ("Trevor Fett")

bounty_hunter1.update

bounty_hunter1.delete
