class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	raise NoSuchStrategyError unless jogada_valida(game)

	if( (game[0][1]=="R" && game[1][1]=="P") || (game[0][1]=="P" && game[1][1]=="S") || (game[0][1]=="S" && game[1][1]=="R") )
		return game[1]
	end
	return game[0]
end

def jogada_valida(game)
	((game[0][1] == "R" || game[0][1] == "P" || game[0][1] == "S") && (game[1][1] == "R" || game[1][1] == "P" || game[1][1] == "S"))
end

def rps_tournament_winner(torneio)
	if(torneio[0][0].class == Array)
		torneio[0] = rps_tournament_winner(torneio[0])
	end
	if(torneio[1][0].class == Array)
		torneio[1] = rps_tournament_winner(torneio[1])
	end
	rps_game_winner(torneio)
end

jogo = [[[ ["Armando", "P"], ["Dave", "S"] ],[ ["Richard", "R"], ["Michael", "S"] ],],
[[ ["Allen", "S"], ["Omer", "P"] ],[ ["David E.", "R"], ["Richard X.", "P"] ]]]
puts rps_tournament_winner(jogo)
