# 入力された値 "n" が素数であるかを判定する
# 確率的素数判定

# フェルマーの小定理
# ⚫︎ 素数pとaが互いに素
# ⚫︎ a ** p-1 / p の余りが1

# 手順
=begin
①パラメータとして、２以上n未満の自然数aを決める
②aとnが「互いに素」（2つの数の最大公約数が１）でない場合、nは合成数（素数ではない）→終了
③「a ^ n-1 / n」の余りが「１」でない場合、nは合成数である→終了
④「a ^ n-1 / n」の余りが「１」である場合、nは素数である”可能性”がある
⑤aの値を変更して②〜④の判定を指定した回数繰り返す
⑥指定回数繰り返してもなお合成数判定が出なければ素数と判定する
=end


def is_prime_number?(n)
  calculateTime = 100
  count = 0

  isPrimeNumber = true
  # ①
  a = 2 + rand(n - 3)
  # puts "a: #{a}"

  while count <= calculateTime do
    # ②
    if !mutually_prime?(n, a)
      isPrimeNumber = false
      break
    end
    # ③
    if a ** (n - 1) % n != 1
      isPrimeNumber = false
      break
    else
      # ④
      count += 1
      # puts "count: #{count}"
    end
  end
  isPrimeNumber
end

# ユーグリッドの互除法
# 「互いに素」であるかの判定
def mutually_prime?(a, b)
  # 余りが0になるまで徐算を繰り返す
  # = １以外の数で割り切れるなら、最大公約数は割り切れたその数になる。
  while b != 0 do
    # 最大公約数 "x"（r = 0になった時の最後のyの値）
    # が１であればtrue, そうでなければfalseを返す
    a, b = b, a % b
    puts "a: #{a}"
    puts "b: #{b}"
  end
  a == 1

  # 上記を再帰関数として定義する
  # gcd(a, b) == 1
end

def gcd(x, y)
  puts "x: #{x}"
  puts "y: #{y}"
  return x if y == 0
  return gcd(y, x % y)
end

p is_prime_number?(137)
