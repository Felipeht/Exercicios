class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

JOGADAS_VALIDAS = ['R', 'P', 'S']

def rps_game_winner(game)
  excecao_se_num_jogadores_errado(game)

  player1 = game[0]
  player2 = game[1]

  jogada_player1 = game[0][1]
  jogada_player2 = game[1][1]

  excecao_se_jogada_invalida(jogada_player1,jogada_player2)

  jogador2venceu?(jogada_player1,jogada_player2)?  player2 : player1
end 

def excecao_se_num_jogadores_errado(game)
  raise WrongNumberOfPlayersError unless game.length == 2
end

def excecao_se_jogada_invalida(jogada_player1,jogada_player2)
  raise NoSuchStrategyError unless jogada_valida?(jogada_player1,jogada_player2)
end

def jogador2venceu?(jogada_player1,jogada_player2)
  ( (jogada_player1=="R" && jogada_player2=="P") || 
      (jogada_player1=="P" && jogada_player2=="S") || 
      (jogada_player1=="S" && jogada_player2=="R") ) 
end

def jogada_valida?(jogada_player1,jogada_player2)
  JOGADAS_VALIDAS.member?(jogada_player1) && JOGADAS_VALIDAS.member?(jogada_player2)
end

def rps_tournament_winner(torneio)
  
  torneio[0] = rps_tournament_winner(torneio[0]) if(mais_que_duas_jogadas?(torneio))
  torneio[1] = rps_tournament_winner(torneio[1]) if(mais_que_duas_jogadas?(torneio))
  
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
