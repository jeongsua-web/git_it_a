class Friend:
    def __init__(self, name, phone, addr):
        self.name = name
        self.phone = phone
        self.addr = addr

    def __str__(self):
        return f"이름: {self.name}, 전화: {self.phone}, 주소: {self.addr}"

class FriendManager:
    def __init__(self):
        self.friends = []

    # 1. 신규 친구 등록
    def insert_friend(self):
        name = input("친구이름: ")
        phone = input("친구전화: ")
        addr = input("친구주소: ")
        self.friends.append(Friend(name, phone, addr))
        print(f"[{name}] 친구가 등록되었습니다.")

    # 2. 이름으로 검색
    def search_by_name(self):
        name = input("검색할 친구이름: ")
        found = [f for f in self.friends if f.name == name]
        if not found:
            print(f"[{name}] 친구를 찾을 수 없습니다.")
        else:
            for f in found:
                print(f)

    # 3. 전화로 검색
    def search_by_phone(self):
        phone = input("검색할 친구전화: ")
        found = [f for f in self.friends if f.phone == phone]
        if not found:
            print(f"[{phone}] 친구를 찾을 수 없습니다.")
        else:
            for f in found:
                print(f)

    # 4. 이름으로 찾아 내용 수정
    def change_by_name(self):
        name = input("변경할 친구이름: ")
        found = [f for f in self.friends if f.name == name]
        
        if not found:
            print(f"[{name}] 친구를 찾을 수 없습니다.")
            return
        
        if len(found) == 1:
            f = found[0]
            print(f"현재 정보: {f}")
            f.phone = input("새 전화번호: ")
            f.addr = input("새 주소: ")
            print(f"[{name}] 친구 정보가 변경되었습니다.")
        else:
            print(f"[{name}] 친구가 여러 명 검색되었습니다.")
            for i, f in enumerate(found):
                print(f"{i+1}. {f}")
            choice = int(input("변경할 친구 번호 선택: ")) - 1
            if 0 <= choice < len(found):
                f = found[choice]
                print(f"현재 정보: {f}")
                f.phone = input("새 전화번호: ")
                f.addr = input("새 주소: ")
                print(f"[{name}] 친구 정보가 변경되었습니다.")
            else:
                print("잘못된 선택입니다.")

    # 5. 이름으로 삭제
    def delete_by_name(self):
        name = input("삭제할 친구이름: ")
        found = [f for f in self.friends if f.name == name]

        if not found:
            print(f"[{name}] 친구를 찾을 수 없습니다.")
            return

        if len(found) == 1:
            self.friends.remove(found[0])
            print(f"[{name}] 친구가 삭제되었습니다.")
        else:
            print(f"[{name}] 친구가 여러 명 검색되었습니다.")
            for i, f in enumerate(found):
                print(f"{i+1}. {f}")
            choice = int(input("삭제할 친구 번호 선택: ")) - 1
            if 0 <= choice < len(found):
                self.friends.remove(found[choice])
                print(f"[{name}] 친구가 삭제되었습니다.")
            else:
                print("잘못된 선택입니다.")

    # 6. 전체 출력
    def all_friend_print(self):
        if not self.friends:
            print("등록된 친구가 없습니다.")
            return
        print("\n--- 전체 친구 목록 ---")
        for f in self.friends:
            print(f)
        print("---------------------\n")

# ----------------- 실행 -----------------
if __name__ == '__main__':
    manager = FriendManager()
    
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
            manager.insert_friend()
        elif n == 2:
            manager.search_by_name()
        elif n == 3:
            manager.search_by_phone()
        elif n == 4:
            manager.change_by_name()
        elif n == 5:
            manager.delete_by_name()
        elif n == 6:
            manager.all_friend_print()
        elif n == 7:
            print("프로그램을 종료합니다.")
            break
        else:
            print("1~7 중에서 선택하세요!")
