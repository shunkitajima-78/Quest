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

    #ゲームの処理
    def game_play
        until @player.finished
            player_hit_stand
        end

        if @player.bust
            puts "#{@player.total}点でバーストしました。"
        end

        if @player.twenty_one
            show_player_total_info
        end

        puts "ディーラーの2枚目のカードは#{@dealer.cards[1].card_info}"

        until @dealer.finished
            dealer_hit
        end

        show_dealer_total_info

        if @dealer.bust
            puts "#{@dealer.total}点でバーストしました。"
        end

        bust_judge_result

    end

    #プレイヤーのカード追加を判定
    def player_hit_stand
        puts "あなたの現在の得点は#{@player.total}です。カードを引きますか？（y/n）"
        input = gets.chomp.downcase
        if input == 'y'
            card = Card.new(@cards.shift.send(:suit), @cards.shift.send(:number))
            @player.hit(card)
            show_player_info(card)
        else
            @player.stand!
        end
    end