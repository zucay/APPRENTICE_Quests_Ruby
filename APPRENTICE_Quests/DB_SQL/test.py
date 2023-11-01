"ok = 1000 # 解が存在する"
"ng = -1 # 解が存在しない"
""
"while abs(ok - ng) > 1:"
"    mid = (ok + ng) / 2"
"    if solve(mid):"
"        ok = mid"
"    else:"
"        ng = mid"
ok = 1000 # 解が存在する

walk=[
    (1,0),
    (-1,0),
    (0,1),
    (0,-1),
]
ok = 1000 # 解が存在する
ng = -1 # 解が存在しない

while abs(ok - ng) > 1:
    mid = (ok + ng) / 2
    if solve(mid):
        ok = mid
    else:
        ng = mid
        
        walk
    walk=[
        (1,0),
        (-1,0),
        (0,1),
        (0,-1),
    ]

ok = 1 # 解が存在する
ng = 10000 # 解が存在しない

while abs(ok - ng) > 1:
    mid = (ok + ng) / 2
    if solve(mid):
        ok = mid
    else:
        ng = mid

# 半開区間 [ok, ng) or (ng, ok]
ok = 1 # 解が存在する
ng = 10000 # 解が存在しない

while abs(ok - ng) > 1:
    mid = (ok + ng) / 2
    if solve(mid):
        ok = mid
    else:
        ng = mid