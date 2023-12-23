require_relative '../lib/card'
require_relative '../lib/player'
require_relative '../lib/dealer'

class Game
    def start
        puts "ブラックジャックを開始します。"
        initialize
        show_info
        game_play
        puts "ブラックジャックを終了します。"
    end

    #カード情報の開示
    def show_info
        @player.cards.each do |card|
            show_player_info(card)
        end

        show_dealer_info(@dealer.cards[0])
        puts "ディーラーの2枚目のカードは分かりません。"
    end
