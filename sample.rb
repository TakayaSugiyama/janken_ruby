class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    @hand = gets.chomp
    #空白文字を防ぐ
    unless @hand.empty? 
      #その他の文字を防ぐ
      hand = @hand.to_i
      unless hand == 0 || hand == 1 || hand == 2 
         @hand = @hand.to_i
      end
    end
    @hand
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する 
    @hand = rand(3)
    @hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    options = %w(グー チョキ パー)
    if player_hand == 2 && enemy_hand == 0 || player_hand == 1 && enemy_hand == 2 || player_hand == 0 && enemy_hand == 1
      puts "相手の手は#{options[enemy_hand]}です。あなたの勝ちです。"
      exit
    elsif player_hand == 2 && enemy_hand == 1 || player_hand == 1 && enemy_hand == 0 || player_hand == 0 && enemy_hand == 1
      puts "相手の手は#{options[enemy_hand]}です。あなたの負けです。"
      exit
    elsif  player_hand == 0 && enemy_hand == 0 || player_hand == 0 && enemy_hand == 0 || player_hand == 1 && enemy_hand == 1
      puts "あいこです。"
    else  
      puts "0〜2の数字を入力してください。"
   end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
while true
   setup_options = %w(数字を入力してください。 0:グー  1:チョキ  2:パー)
   setup_options.each do |setup_option|
      puts setup_option
   end
   puts " "
   janken.pon(player.hand, enemy.hand)
end




