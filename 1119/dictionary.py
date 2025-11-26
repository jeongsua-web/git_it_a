'''
메뉴: 1. 영어/한글 단어 뜻 검색 2. 단어등록 3. 단어 삭제 4. 전체 단어 출력 5. 종료
3번 - 메뉴 선택 후 "없는 단어" 에러체크
2번 - 메뉴 선택 후 단어등록, 단어 등록 시 영어단어면 한글 뜻 한글단어면 영문 뜻 입력
조회, 등록, 삭제기능 한글 영문 상관없이 단어 입력 가능.
추가요구사항 -> 전체 영어단어 한글 뜻 출력 또는 한글단어 영어단어 출력되는 메뉴 추가
'''

# 사전 데이터
word_dict = {}  # {단어: 뜻} 형식으로 영한/한영 모두 저장

def is_korean(word):
    """단어에 한글이 포함되어 있는지 확인"""
    return any('가' <= char <= '힣' for char in word)

def search_word():
    """1. 단어 검색"""
    word = input("검색할 단어 입력: ").strip()
    
    if word in word_dict:
        print(f"[{word}]의 뜻: {word_dict[word]}")
    else:
        print("사전에 없는 단어입니다.")

def register_word():
    """2. 단어 등록"""
    word = input("등록할 단어 입력: ").strip()
    
    if word in word_dict:
        print("이미 등록된 단어입니다.")
        return
    
    if is_korean(word):
        meaning = input("영어 뜻 입력: ").strip()
    else:
        meaning = input("한글 뜻 입력: ").strip()
    
    word_dict[word] = meaning
    print(f"[{word}] 등록 완료")

def delete_word():
    """3. 단어 삭제"""
    word = input("삭제할 단어 입력: ").strip()
    
    if word in word_dict:
        del word_dict[word]
        print(f"[{word}] 삭제 완료")
    else:
        print("없는 단어입니다.")

def print_all_words():
    """4. 전체 단어 출력"""
    if not word_dict:
        print("등록된 단어가 없습니다.")
        return
    
    # 영어 단어와 한글 단어 분리
    eng_words = {}
    kor_words = {}
    
    for word, meaning in word_dict.items():
        if is_korean(word):
            kor_words[word] = meaning
        else:
            eng_words[word] = meaning
    
    print("\n=== 전체 단어 목록 ===")
    
    if eng_words:
        print("\n[영어 -> 한글]")
        for word in sorted(eng_words.keys()):
            print(f"  {word}: {eng_words[word]}")
    
    if kor_words:
        print("\n[한글 -> 영어]")
        for word in sorted(kor_words.keys()):
            print(f"  {word}: {kor_words[word]}")
    print()

def main():
    """메인 프로그램"""
    while True:
        print("\n=== 영한/한영 사전 ===")
        print("1. 단어 검색")
        print("2. 단어 등록")
        print("3. 단어 삭제")
        print("4. 전체 단어 출력")
        print("5. 종료")
        
        choice = input("메뉴 선택: ").strip()
        
        if choice == '1':
            search_word()
        elif choice == '2':
            register_word()
        elif choice == '3':
            delete_word()
        elif choice == '4':
            print_all_words()
        elif choice == '5':
            print("프로그램을 종료합니다.")
            break
        else:
            print("잘못된 메뉴 선택입니다. 1~5 중에서 선택해주세요.")

if __name__ == '__main__':
    main()
