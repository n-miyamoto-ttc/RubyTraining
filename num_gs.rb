class Number_guess
  
  def input_dec      #入力&判断メソッド
    cnt = 0
    cor = rand(1..100)      #正解ランダム生成
    begin
      loop do
        p "please number 1~100"
        num = gets.to_i      #数値入力、文字列は0
        cnt += 1
        if (1..100).include?(num) #1~100以内か判断
          p "choice#{num}, Ans smaller" if num > cor     #入力＞答え
          p "choice#{num}, Ans larger" if num < cor      #入力＜答え
          if num == cor      #正解
            p "Ans #{cor}, #{cnt}th Challenge is correct!!"
            break
          end
        else      #要件外入力
          p "Not 1~100 number, pls try again"
        end
      end
    rescue => e
      p "Error,#{e}"
    ensure
      p "Done."
    end
  end
  
end

ng = Number_guess.new
ng.input_dec
