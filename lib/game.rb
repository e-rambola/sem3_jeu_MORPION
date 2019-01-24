require_relative 'board'
require_relative 'player'
class Game

  def initialize
    @board = Board.new
    @current_player = ""
    @winner = false
    @turn = 0
  end
#Méthode permettant de lancer le jeu et de démarrer la partie et déterminer l'issue de la partie. On crée de nouveaux joueurs avec des noms récupérés de la méthode 'get_names'.
  def start_game
    names = get_names
    @player1 = Player.new(names[0], :X, @board)
    @player2 = Player.new(names[1], :O, @board)
    @current_player = @player1
    @board.show_board
    turn until @winner || @turn == 9
    if @winner
      puts "#{@winner.name} wins!"
    else
      puts "Draw!"
    end
  
  end

  private
 #le jouer peut entrer un nombre compris entre 1 et 9, si le nombre n'est pas compris dans cet intervalle un message s'affiche demandant de redonner une valeur.
  def turn
    puts "C\'est a #{@current_player.name} de jouer. Choisissez votre cellule(1-9):"
    print ">"
    choice = gets.chomp.to_i
    if choice > 9 || choice < 1
      puts "Attention!!!: Chiffre entre 1 et 9 seulement"
    elsif @current_player.move(choice) != false
      @winner = @current_player if @current_player.winner?
      @turn += 1
      switch_player
    end
  end
# Méthode permettant de mettre en place les changement de joueur
  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
#Méthode permettant d'obtenir le nom des joueurs, on utilise le gest.chomp
  def get_names
    puts "***************************************"
    puts "*                                     *"
    puts "*            TIC TAC TOE              *"
    puts "*                                     *"
    puts "***************************************"
    puts "Entrer le nom du joueur qui utilise \'X\'"
    print '>'
    name1 = gets.chomp
    puts "Entrer le nom du joueur qui utilise \'O\'"
    print '>'
    name2 = gets.chomp
    [name1, name2]
  end
end