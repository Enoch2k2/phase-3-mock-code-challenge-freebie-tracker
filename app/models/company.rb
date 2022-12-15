class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

#   Company#give_freebie(dev, item_name, value)

  def give_freebie(dev, item_name, value)
    # takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev
    self.freebies.create(dev: dev, item_name: item_name, value: value)
  end

  def self.oldest_company
    # we need to get the oldest company by founding_year
    self.order(founding_year: :asc)[0]
  end
end
