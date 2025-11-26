import time

total_sec = time.time() # 1970년 1월  1일 후 흘러온 초값!
sec = int(total_sec) # 실수인 total_sec를 정수로 변환

sec_day = sec % 86400
hours = sec_day // 3600
rem_hours = sec_day % 3600

minutes = rem_hours // 60

print(f"현재시간(GMT): {hours}시 {minutes}분")
