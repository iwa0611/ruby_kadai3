coin = 500
point = 0
count = 1

loop do
    sleep 0.2
    puts"--------\n#{count}ゲーム目"
    puts"残りコイン数#{coin}\nポイント#{point}\n何コイン入れますか？"
    puts"1(10コイン) 2(30コイン) 3(50コイン) 4(やめとく)"
    puts"--------"

    bets=[0,10,30,50]
    bet_no = gets.to_i
    if bet_no == 4 #ゲームを終了する処理
        break
    end

    if bet_no == 2 && coin < 30 #コインが足りない時の処理
        puts"コインが足りません"
        next
    elsif bet_no == 3 && coin <50
        puts"コインが足りません"
        next
    else
    end

    if bet_no == 1 || bet_no == 2 || bet_no == 3 #入力された値の確認
        puts"エンターを３回押しましょう\n--------"
    else
        puts"1か2か3を押してください。"
        next
    end
    
    values=[]

    for a in 0..8 do
    a = rand(1..9)
    values << a
    end

    gets
    puts"--------"
    puts"|#{values[0]}|"
    puts"|#{values[1]}|"
    puts"|#{values[2]}|"
    puts"--------"

    gets
    puts"--------"
    puts"|#{values[0]}|#{values[3]}|"
    puts"|#{values[1]}|#{values[4]}|"
    puts"|#{values[2]}|#{values[5]}|"
    puts"--------"

    gets
    puts"--------"
    puts"|#{values[0]}|#{values[3]}|#{values[6]}|"
    puts"|#{values[1]}|#{values[4]}|#{values[7]}|"
    puts"|#{values[2]}|#{values[5]}|#{values[8]}|"
    puts"--------"
    count = count + 1 #ゲームカウント+1

    if values[0] == values[3] && values[3] == values[6] #一段目横
        result = "win"
    elsif values[1] == values[4] && values[4] == values[7] #二段目横
        result = "win"
    elsif values[2] == values[5] && values[5] == values[8] #三段目横
        result = "win"
    elsif values[0] == values[4] && values[4] == values[8] #斜め↘️
        result = "win"
    elsif values[2] == values[4] && values[4] == values[6] #斜め↙️
        result = "win"
    else
        result = "lose"
    end

    case result
     when "win" #揃った時の処理
        get_coin = (100 * bet_no)
        get_point = (100 * bet_no)
        puts"--------"
        puts"*****\n当たり\n*****"
        puts"#{get_coin}コイン獲得\n#{get_point}ポイント獲得"
        puts"--------"
        coin = coin + get_coin
        point = point + get_point
     when "lose" #揃わなかった時の処理
        puts"ハズレ"
        coin = coin - bets[bet_no]
     end

     if coin <= 0 #コインが0になったら終了
        puts"コインが0です"
        break
    end
end
