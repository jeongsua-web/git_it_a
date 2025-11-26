# 일정 저장 딕셔너리: {날짜: [일정1, 일정2, ...]}
schedule = {}

# 특정 날짜의 일정 조회
def view_schedule():
    date = input("조회할 날짜: ")
    if date in schedule:
        print(f"\n[{date}]")
        for i, todo in enumerate(schedule[date], 1):
            print(f"{i}. {todo}")
    else:
        print("등록된 일정이 없습니다.")

# 일정 등록
def add_schedule():
    date = input("날짜: ")
    todo = input("일정: ")
    # 날짜가 있으면 일정 추가, 없으면 새로 생성
    if date in schedule:
        schedule[date].append(todo)
    else:
        schedule[date] = [todo]
    print("등록 완료")

# 일정 수정
def modify_schedule():
    date = input("날짜: ")
    if date not in schedule:
        print("등록된 일정이 없습니다.")
        return
    
    # 일정 목록 출력
    print(f"\n[{date}]")
    for i, todo in enumerate(schedule[date], 1):
        print(f"{i}. {todo}")
    
    # 수정할 일정 선택
    num = int(input("수정할 번호: "))
    if 1 <= num <= len(schedule[date]):
        new_todo = input("새로운 일정: ")
        schedule[date][num-1] = new_todo
        print("수정 완료")
    else:
        print("잘못된 번호입니다.")

# 일정 삭제
def delete_schedule():
    date = input("날짜: ")
    if date not in schedule:
        print("등록된 일정이 없습니다.")
        return
    
    # 일정 목록 출력
    print(f"\n[{date}]")
    for i, todo in enumerate(schedule[date], 1):
        print(f"{i}. {todo}")
    
    # 삭제할 일정 선택 (0: 전체 삭제)
    num = int(input("삭제할 번호 (전체 삭제는 0): "))
    if num == 0:
        del schedule[date]
        print("삭제 완료")
    elif 1 <= num <= len(schedule[date]):
        schedule[date].pop(num-1)
        # 일정이 모두 삭제되면 날짜도 제거
        if not schedule[date]:
            del schedule[date]
        print("삭제 완료")
    else:
        print("잘못된 번호입니다.")

# 전체 일정 출력
def view_all():
    if not schedule:
        print("등록된 일정이 없습니다.")
        return
    
    print("\n===== 전체 일정 =====")
    # 날짜 순으로 정렬하여 출력
    for date in sorted(schedule.keys()):
        print(f"\n[{date}]")
        for i, todo in enumerate(schedule[date], 1):
            print(f"{i}. {todo}")

# 메인 프로그램
while True:
    print(" ")
    print("1. 일정 조회")
    print("2. 일정 등록")
    print("3. 일정 수정")
    print("4. 일정 삭제")
    print("5. 전체 일정")
    print("6. 종료")
    
    menu = input("선택: ")
    
    if menu == '1':
        view_schedule()
    elif menu == '2':
        add_schedule()
    elif menu == '3':
        modify_schedule()
    elif menu == '4':
        delete_schedule()
    elif menu == '5':
        view_all()
    elif menu == '6':
        print("종료")
        break
    else:
        print("잘못된 입력입니다.")
