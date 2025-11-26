# 모음이랑 자음 수 세기
def countVowelConsonant(string):
    vowels = ['a', 'e', 'i', 'o', 'u']
    vowel_count = 0
    consonant_count = 0

    for ch in string.lower(): #소문자 변환  
        if ch.isalpha():       
            if ch in vowels:
                vowel_count += 1
            else:
                consonant_count += 1

    return vowel_count, consonant_count


s = input("문자열을 입력하시오: ")
v, c = countVowelConsonant(s)
print(f"모음의 개수는 {v}개, 자음의 개수는 {c}개입니다.")
