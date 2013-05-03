class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


def rps_game_winner(game)
  player1 = game[0]
  player2 = game[1]
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless jogada_valida(game)

  if( (player1[1]=="R" && player2[1]=="P") || 
      (player1[1]=="P" && player2[1]=="S") || 
      (player1[1]=="S" && player2[1]=="R") )
    return player2
  end
  return player1
end
 
def jogada_valida(game)
  jogada_player1 = game[0][1]
  jogada_player2 = game[1][1]

  ((jogada_player1 == "R" || jogada_player1 == "P" || jogada_player1 == "S") && 
   (jogada_player2 == "R" || jogada_player2 == "P" || jogada_player2 == "S"))
end

def rps_tournament_winner(torneio)
  if(mais_que_duas_jogadas?(torneio))
    torneio[0] = rps_tournament_winner(torneio[0])
  end
  if(mais_que_duas_jogadas?(torneio))
    torneio[1] = rps_tournament_winner(torneio[1])
  end
  rps_game_winner(torneio)
end

def mais_que_duas_jogadas?(torneio)
  (torneio[0][0].class == Array) || (torneio[1][0].class == Array)
end

jogo = [
          [
            [["Armando", "P"], ["Dave", "S"]],
            [["Richard", "R"], ["Michael", "S"]]
          ],
          [
            [["Allen", "S"], ["Omer", "P"]],
            [["David E.", "R"], ["Richard X.", "P"]]
          ]
        ]
puts rps_tournament_winner(jogo)
