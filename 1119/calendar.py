mydict = {}

while True:
    date = input("날짜 입력 (종료는 quit) : ")
    if date == 'quit':
        print("프로그램 종료")
        break
    job = input("할 일 입력 : ")
    if date not in mydict:
        mydict[date] = [job]  # 리스트로 저장
    else:
        mydict[date].append(job)  # 기존 리스트에 추가
        print(f"{date}에 일정이 추가되었습니다.")
    print(mydict)
        