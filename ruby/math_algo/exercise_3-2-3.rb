# ユーグリッドの互除法を用いて、N個の整数A1,A2, ..., AN
# の最小公倍数を計算するプログラムを作成してください。

# ユーグリッドの互除法とは
# 大きい方の数を「大きい方を小さい方で割った数」に置き換え
# 片方が０になるまで繰り返す。
# ０にならなかった方が最大公約数である。

# またある整数a, bに対して、それらの最大公約数をg、
# 最小公倍数をlとおくと、

# a * b = g * l

# となる。つまり「最大公約数と最小公倍数の積」が
# 元の2つの数の積に等しい
# ことを利用する。

# l = a * b / g

# 難しそうに思えますが、
# 要は n 個の自然数の先頭の２つの自然数の最小公倍数を求め、
# その結果と次の自然数の最小公倍数を求め、その結果と次の
# 自然数の最小公倍数を求め…、といった処理を
# n - 1 回分繰り返せば良いだけです。
# 最後に求めた最小公倍数が、n 個の自然数の最小公倍数となります。

# 手順
# ①Ai, Ai+1積を求める
# ②Ai, Ai+1の最大公約数を求める（ユークリッド互除法）
# ③①÷②を前の結果にかける

require "../gcd.rb"

# main
def least_commom_multiple(arr)
  least_commom_multiple = arr.first

  (1..arr.length - 1).each do |i|
    puts "i: #{i}"
    multiple = least_commom_multiple * arr[i]

    # "gcd(x, y)"のところにeuclidean_method(a, b)を使ってもいい
    greatest_common_divisor = gcd(least_commom_multiple, arr[i])
    puts "最大公約数：#{greatest_common_divisor}"
    least_commom_multiple = multiple / greatest_common_divisor
    puts "最小公倍数：#{least_commom_multiple}"
  end

  least_commom_multiple
end

def euclidean_method(a, b)
  if a > b
    x = a
    y = b
  else
    x = b
    y = a
  end

  # x > y
  r = x % y
  while r != 0 do
    x = y
    y = r
    r = x % y
  end
  y
end

# 実行
arr = [10, 20, 30, 40, 50]
p least_commom_multiple(arr)
