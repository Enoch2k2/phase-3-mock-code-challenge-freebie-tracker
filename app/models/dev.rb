class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  #received_one?(item_name)
  def received_one?(item_name)
    # accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false
    # binding.pry
    # self.freebies.where(item_name: item_name).length > 0
    !self.freebies.where(item_name: item_name).empty?
  end



  # give_away(dev, freebie)
  
  def give_away(dev, freebie)
    # accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away

    if freebie.dev.id == self.id
      freebie.update(dev: dev)
    end
  end
end
