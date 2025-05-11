class FibController < ApplicationController
  def show
    n = params[:id].to_i
    result = fib_sequence(n)

    if result.is_a?(Integer)
      render json: { result: result}
    else
      render json: { ststus: 400, message: "Bad request"}, status: 400
    end
  end


  private
  def fib_sequence(n)
    if n <= 0 || n.is_a?(String)
      return "エラー"

    elsif n <= 2
      return 1

    else
      result = 0
      fib_0 = 1
      fib_1 = 1

      (3..n).each do
        result = fib_0 + fib_1
        fib_0 = fib_1
        fib_1 = result
      end
      
      return result

    end
  end
end
