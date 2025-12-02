class TV:
    def __init__(self):
        self.channel = 1
        self.volume = 1
        self.on = False

    def turnOn(self):
        self.on = True
        print("TV 켜졌습니다.")

    def turnOff(self):
        self.on = False
        print("TV가 꺼졌습니다.")

    def setChannel(self, channel):
        if self.on:
            self.channel = channel
            print(f"채널을 {channel}번으로 변경했습니다.")
        else:
            print("TV가 꺼져있습니다.")

    def setVolume(self, volume):
        if self.on:
            self.volume = volume
            print(f"볼륨을 {volume}으로 변경했습니다.")
        else:
            print("TV가 꺼져있습니다.")

    def print(self):
            print(f"현재 채널: {self.channel}, 현재 볼륨: {self.volume}")

tv = TV()
        
while True:
    print("1. 켜기 2. 끄기 3. 채널변경 4. 볼륨변경 5. 현재상태출력 6. 종료")

    n = input("메뉴를 선택하세요: ")

    if n == "1":
        tv.turnOn()
    elif n == "2":
        tv.turnOff()
    elif n == "3":
        ch = int(input("채널 번호를 입력하세요: "))
        tv.setChannel(ch)
    elif n == "4":
        vol = int(input("볼륨을 입력하세요: "))
        tv.setVolume(vol)
    elif n == "5":
        tv.print()
    elif n == "6":
        print("프로그램을 종료합니다.")
        break
    else:
        print("잘못된 입력입니다. 다시 선택하세요.")



    
