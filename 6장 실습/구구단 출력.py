# 구구단 전체 출력
print('\n\n# 구구단 출력\n')

for i in range(10):
    for dan in range(2, 10):
        if i == 0:
            print('| %5d%s ' % (dan, "단"), end=' ')
        else:
            print('| %d X %d = %2d' % (dan, i, dan * i), end=' ')
    print('|')  # for 문 내에 작성하면 |가 두 개 작성됨

# 구구단 순서 변경 (역순)
print('\n\n# 구구단 역순 출력\n')

for i in range(10):
    for dan in range(9, 1, -1):
        if i == 0:
            print('| %5d%s ' % (dan, "단"), end=' ')
        else:
            print('| %d X %d = %2d' % (dan, i, dan * i), end=' ')
    print('|')
