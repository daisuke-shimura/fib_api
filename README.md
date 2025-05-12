# フィボナッチ数を返すAPI
このrailsアプリケーションは、指定した整数に対するフィボナッチ数を返すシンプルなAPIです。


## URL
https://fib-api-89oe.onrender.com/fib/:n
※:nに任意の数値を入力してください


## ファイル構成と主な役割
'app/controllers/fib_controller.rb' | APIのロジックの記述

'config/routes.rb' | URLルーティングの設定

'test/controllers/fib_controller_test.rb' | テストの記述


## ソースコードの概要
'app/controllers/fib_controller.rb'ファイルの記載

### 任意の項のフィボナッチ数を求めるメソッド

```
  def fib_sequence(n)
    if n <= 0  #渡された値（n）が定義外の数（文字列）の場合 "エラー" を返す
      return "エラー"

    elsif n <= 2  #フィボナッチ数列の第一項、第二項が指定された場合、1を返す
      return 1

    else
      result = 0
      fib_0 = 1
      fib_1 = 1

      (3..n).each do  #任意の値（項数）まで計算のループを行う
        result = fib_0 + fib_1
        fib_0 = fib_1
        fib_1 = result
      end
      
      return result #ループ終了時の result が指定された項のフィボナッチ数です

    end
  end
```

### showアクション

```
  def show
    n = params[:id].to_i  #URLから数値を取得
    result = fib_sequence(n)  #取得した数値を引数にして、フィボナッチ数を求めるメソッドを呼び出します

    if result.is_a?(Integer)
      render json: { result: result}  #メソッドの返り値が整数の場合その値を出力
    else
      render json: { status: 400, message: "Bad request"}, status: 400  #数値ではない（"エラー"）の場合エラーメッセージを出力
    end
  end
```


## テスト

以下のコマンドでテストを実行できます

`rails test`
