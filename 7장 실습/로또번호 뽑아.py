import random

def getLottoNumbers():
    lotto_numbers = set()
    while len(lotto_numbers) < 6:
        number = random.randint(1, 45)
        lotto_numbers.add(number)
    return sorted(lotto_numbers)

print("이번 주 로또 번호는:", getLottoNumbers())