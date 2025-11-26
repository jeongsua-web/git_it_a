'''
<편의점 물품 제고 관리>
신규물품 재고 등록하는 함수 추가해보기

items_dict = {"커피" : 7, "펜" : 3, "종이컵" : 2, "우유" : 1, "콜라" : 4, "책" : 5}
item = input("물건의 이름을 입력하라.")
quantity = int(input("물건의 수량을 입력하라."))

items_dict[quantity] = item
'''

msg = "1. 물품등록 2. 재고량증가 3. 재고량감소 4. 물품삭제 5. 전체물품 출력 6. 종료"
item_dict = {}

def insert_item ():
    if len(item_dict) >= 50:
        print("더이상 등록할 수 없습니다.")
        return
    while True:
        item_name = input("물건의 이름을 입력하라.")
        if item_name in item_dict:
            print("이미 등록된 물품입니다.")
        else:
            item_quantity = int(input("물건의 수량을 입력하라."))
            if item_quantity < 0:
                print("수량은 0이상으로 입력하라.")
            else:
                item_dict[item_name] = item_quantity
                break

def increase_count ():
    item_name = input("증가할 물건의 이름을 입력하라.")
    if item_name in item_dict:
        item_dict[item_name] += 1
    else:
        print("등록되지 않은 물품입니다.")

def decrease_count ():
    item_name = input("감소할 물건의 이름을 입력하라.")
    if item_name in item_dict and item_dict[item_name] > 0:
        item_dict[item_name] -= 1
    else:
        print("등록되지 않은 물품입니다.")

def delete_item():
    item_name = input("삭제할 물건의 이름을 입력하라.")
    if item_name in item_dict:
        item_dict.pop(item_name)
    else:
        print("등록되지 않은 물품입니다.")

def all_item_print():
    for item, qty in item_dict.items():
        print(f"{item} : {qty}")
    
if __name__ == '__main__':
    while True:
        n = int(input(msg))

        if n == 1:
            insert_item()
        elif n == 2:
            increase_count()
        elif n == 3:
            decrease_count()
        elif n == 4:
            delete_item()
        elif n == 5:
            all_item_print()
        elif n == 6:
            print("프로그램 종료\n")
            break
        else:
            print("1-6중에 선택")