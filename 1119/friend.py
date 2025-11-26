# 예제: 신규친구등록(동명이인인 친구). 이름으로 검색하기. 주소로 변경하기. 이름으로 찾아 내용을 수정하기. 이름으로 삭제하기(같은 이름 여러 명인 경우 사용자가 그중에서 골라서 삭제)

# 1 친구 등록
def insert_friend():
    name = input("친구이름: ")
    phone = input("친구전화: ")
    addr = input("친구주소: ")
    friend.append([name, phone, addr])
    print(f"[{name}] 친구가 등록되었습니다.")

# 2 친구 조회 (친구이름으로 검색)
def search_by_name():
    name = input("검색할 친구이름: ")
    found = False
    for f in friend:
        if f[0] == name:
            print(f"이름: {f[0]}, 전화: {f[1]}, 주소: {f[2]}")
            found = True
    if not found:
        print(f"[{name}] 친구를 찾을 수 없습니다.")

# 3 친구 조회 (친구전화로 검색)
def search_by_phone():
    phone = input("검색할 친구전화: ")
    found = False
    for f in friend:
        if f[1] == phone:
            print(f"이름: {f[0]}, 전화: {f[1]}, 주소: {f[2]}")
            found = True
    if not found:
        print(f"[{phone}] 친구를 찾을 수 없습니다.")

# 4 친구 정보 변경 (이름으로 찾아 내용 수정)
def change_by_name():
    name = input("변경할 친구이름: ")
    found_count = 0
    indices = [] # 동명이인인 경우를 대비하여 인덱스를 저장
    
    for i, f in enumerate(friend):
        if f[0] == name:
            found_count += 1
            indices.append(i)

    if found_count == 0:
        print(f"[{name}] 친구를 찾을 수 없습니다.")
    elif found_count == 1:
        idx = indices[0]
        print(f"현재 정보: 이름: {friend[idx][0]}, 전화: {friend[idx][1]}, 주소: {friend[idx][2]}")
        friend[idx][1] = input("새 전화번호: ")
        friend[idx][2] = input("새 주소: ")
        print(f"[{name}] 친구 정보가 변경되었습니다.")
    else: # 동명이인인 경우
        print(f"[{name}] 친구가 여러 명 검색되었습니다.")
        for i, idx in enumerate(indices):
            print(f"{i+1}. 이름: {friend[idx][0]}, 전화: {friend[idx][1]}, 주소: {friend[idx][2]}")
        
        choice = int(input("변경할 친구의 번호를 선택하세요: ")) - 1
        if 0 <= choice < found_count:
            idx = indices[choice]
            print(f"현재 정보: 이름: {friend[idx][0]}, 전화: {friend[idx][1]}, 주소: {friend[idx][2]}")
            friend[idx][1] = input("새 전화번호: ")
            friend[idx][2] = input("새 주소: ")
            print(f"[{name}] 친구 정보가 변경되었습니다.")
        else:
            print("잘못된 선택입니다.")

# 5 친구 삭제 (이름으로 찾아 삭제)
def delete_by_name():
    name = input("삭제할 친구이름: ")
    found_count = 0
    indices = []
    
    for i, f in enumerate(friend):
        if f[0] == name:
            found_count += 1
            indices.append(i)

    if found_count == 0:
        print(f"[{name}] 친구를 찾을 수 없습니다.")
    elif found_count == 1:
        idx = indices[0]
        del friend[idx]
        print(f"[{name}] 친구가 삭제되었습니다.")
    else: # 동명이인인 경우
        print(f"[{name}] 친구가 여러 명 검색되었습니다.")
        for i, idx in enumerate(indices):
            print(f"{i+1}. 이름: {friend[idx][0]}, 전화: {friend[idx][1]}, 주소: {friend[idx][2]}")
        
        choice = int(input("삭제할 친구의 번호를 선택하세요: ")) - 1
        if 0 <= choice < found_count:
            # 삭제 시 리스트 인덱스가 변경될 수 있으므로, 뒤에서부터 삭제하거나 새 리스트를 만드는 것이 안전
            # 여기서는 편의상 선택된 인덱스 삭제
            del friend[indices[choice]] 
            print(f"[{name}] 친구가 삭제되었습니다.")
        else:
            print("잘못된 선택입니다.")

# 6 전체 친구 목록 출력
def all_friend_print():
    if not friend:
        print("등록된 친구가 없습니다.")
        return
    print("\n--- 전체 친구 목록 ---")
    for f in friend:
        print(f"이름: {f[0]}, 전화: {f[1]}, 주소: {f[2]}")
    print("---------------------\n")

friend = [] # 친구 정보를 저장할 리스트 (전역 변수)

if __name__ == '__main__':
    while True:
        print("\n--- 친구 관리 프로그램 ---")
        print("1. 신규 친구 등록")
        print("2. 이름으로 검색하기")
        print("3. 전화로 검색하기")
        print("4. 이름으로 찾아 내용 변경하기")
        print("5. 이름으로 찾아 삭제하기")
        print("6. 전체 출력")
        print("7. 종료")
        n = int(input("메뉴를 선택하세요: "))

        if n == 1:
            insert_friend()
        elif n == 2:
            search_by_name()
        elif n == 3:
            search_by_phone()
        elif n == 4:
            change_by_name()
        elif n == 5:
            delete_by_name()
        elif n == 6:
            all_friend_print()
        elif n == 7:
            print("프로그램을 종료합니다.")
            break
        else:
            print("1~7 중에서 선택하세요!")