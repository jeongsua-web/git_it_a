import random

nansu = random.randrange(1, 101)
answer = 0
tries = 0

print('1부터 100 사이의 숫자를 맞추세요')

while answer != nansu and tries < 10:
    tries += 1
    answer = int(input('숫자를 입력하세요: '))

    if answer > nansu:
        print('높음!')
    if answer < nansu:
        print('낮음!')

if tries == 10:
    print(f'시도 횟수가 10번을 넘었으므로 실패하셨습니다. 정답은 {nansu}입니다.')
else:
    print(f'축하합니다! 시도 횟수 = {tries}')
