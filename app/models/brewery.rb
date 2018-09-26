class Brewery < ApplicationRecord
  include RatingAverage

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true

  validates :score, numericality: { greater_than_or_equal_to: 1040, less_than_or_equal_to: ->(_) { Time.now.year }, only_integer: true }

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2018
    puts "changed year to #{year}"
  end
end
