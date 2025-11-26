money = int(input("돈을 투입하시오: "))
price = int(input("물건값을 입력하시오: "))

remain = money-price
coin500 = remain//500
coin100 = (remain-coin500*500)//100

print(f"투입한 돈: {money}\n물건값: {price}\n잔돈: {remain}\n500원: {coin500}개\n100원: {coin100}개")
