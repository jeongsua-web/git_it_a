'''
메뉴: 1. 영어/한글 단어 뜻 검색 2. 단어등록 3. 단어 삭제 4. 전체 단어 출력 5. 종료
3번 - 메뉴 선택 후 "없는 단어" 에러체크
2번 - 메뉴 선택 후 단어등록, 단어 등록 시 영어단어면 한글 뜻 한글단어면 영문 뜻 입력
조회, 등록, 삭제기능 한글 영문 상관없이 단어 입력 가능.
추가요구사항 -> 전체 영어단어 한글 뜻 출력 또는 한글단어 영어단어 출력되는 메뉴 추가
'''

dict = {} # {영어단어: 한글뜻} 형식. 한영/영한 모두 지원하도록 한글이나 영어단어 중복 등록되면 예외 처리 필수

def word_check(str):
    if str in sorted(dict.keys()):
        return 0 # 0: 영어단어
    elif str in dict.values():
        return 1 # 1: 한글단어
    else:
        return -1 # -1: 없는 단어

def insert_word(flag, str):
    value = input("뜻 입력 : ")
    if flag == 0: # 영어단어
        dict[str] = value
    elif flag == 1: # 한글단어
        for key in sorted(dict.keys()):
            if dict[key] == str:
                dict[key] = value # 값 덮어쓰기
    print(f"[{str}] 등록 완료")

def delete_word(flag, str):
    if flag == 0: # 영어단어로 해당 영어단어를 key로 하는 항목 삭제
        dict.pop(str)
    else: # 한글어로 해당 단어를 value로 하는 영어 단어 찾아 삭제
        for key in sorted(dict.keys()):
            if dict[key] == str:
                dict.pop(key)
                break
    print(f"[{str}] 삭제 완료")

def find_word(flag, str):
    if flag == 0: # 영어단어로 해당 영어단어를 key로 하는 항목 조회
        print(f"[{str}]의 뜻은 [{dict[str]}]입니다")
    else: # 한글어로 한글을 value로 하는 영어 단어 찾아 조회
        for key in sorted(dict.keys()):
            if dict[key] == str:
                print(f"[{str}]의 뜻은 [{key}]입니다")
                break

if __name__ == '__main__':
    while True:
        n = input("1. 영어/한글 단어 등록 2. 단어 검색 3. 단어 삭제 4. 종료 : ")
        if n == '4':
            print("프로그램 종료")
            break
        if n not in ['1', '2', '3']:
            print("메뉴선택은 1~3 사이로 해주세요")
            continue

        flag = -1
        str = ""
        while flag == -1:
            str = input("단어 입력 : ")
            flag = word_check(str)
            if flag == -1:
                print("없는 단어입니다. 다시 입력해주세요.")

        m = input(f"1. 등록 2. 조회 3. 삭제 : ")

        if m == '1':
            if flag != -1: # 이미 있는 단어
                print("이미 등록된 단어입니다.")
                continue
            insert_word(flag, str)

        elif m == '2':
            if flag == -1: # 없는 단어
                print("없는 단어입니다.")
                continue
            find_word(flag, str)

        elif m == '3':
            if flag == -1: # 없는 단어
                print("없는 단어입니다.")
                continue
            delete_word(flag, str)

        else:
            print("잘못된 메뉴 선택입니다.")