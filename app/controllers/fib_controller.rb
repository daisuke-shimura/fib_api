class FibController < ApplicationController
  def show
    
  end


  private
  def fib_sequence(n)
    if n <= 0 || n.is_a?(String)
      return "エラー\n1以上の整数を入力してください。"

    elsif n <= 2
      return 1

    else
      a = 1
      b = 1

      
    end
  end
end
