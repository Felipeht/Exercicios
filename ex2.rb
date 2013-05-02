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

jogo = [[[ ["Armando", "P"], ["Dave", "S"] ],[ ["Richard", "R"], ["Michael", "S"] ],],
[[ ["Allen", "S"], ["Omer", "P"] ],[ ["David E.", "R"], ["Richard X.", "P"] ]]]

def rps_tournament_winner(torneio)
	num_rodada = 0
	torneio.each do |rodada|
		novo_torneio[(num_rodada/2).floor] = rps_game_winner(rodada)
		num_rodada=num_rodada+1
	end

	rps_tournament_winner(novo_torneio)
end