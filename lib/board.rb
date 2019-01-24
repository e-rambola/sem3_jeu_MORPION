class Board
  attr_accessor :cells
#Permet de mettre à jour le tableau en fonction des inputs du joueur tout en garatissant que la cellule soit vide
  def initialize
    @cells = [
    "1", "2", "3",
    "4", "5", "6",
    "7", "8", "9"
    ]
  end
end