while abs(ok - ng) > 1
  mid = (ok + ng) / 2
  if solvefn(mid)
    ok = mid
  else
    ng = mid
  end
end

# 半開区間 [ok, ng) or (ng, ok]
ok = 0 # 解が存在する
ng = 10000 # 解が存在しない

while abs(ok - ng) > 1
  mid = (ok + ng) / 2 # 小数切り捨て
  if solvefn(mid)
    ok = mid
  else
    ng = mid
  end
end
