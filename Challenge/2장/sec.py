# 사용자에게 입력받은 초값을 시간 분 초 로 변환해주는 프로그램
total_second = int(input("초값을 입력하시오: "))

hour = total_second//3600
remaining_second = total_second%3600
minute = remaining_second//60
second = remaining_second%60

print(f"입력받은 {total_second}초를 시각으로 변환하면 {hour}시 {minute}분 {second}초 입니다.")
