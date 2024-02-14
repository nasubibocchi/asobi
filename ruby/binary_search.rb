# 二分探索
# arr = (1..100000).to_a
# arr = (1..15).to_a
arr = [1,3,5,7,9,11,13,15,17,19,21]

# 整数Kのインデックスを求める関数
def indexOf(k, arr)
  if k > arr[-1]
    p (-1)
    return
  end

  left = 0
  right = arr.length

  while left < right do
    index = left + ((right - left) / 2).round
    ans = 0

    if arr[index - 1] < k && k <= arr[index + 1]
      right = left
      ans = arr[index + 1]
    elsif arr[index] > k
      right = index - 1
    else
      left = index + 1
    end
  end
  p ans
end

indexOf(8, arr)
