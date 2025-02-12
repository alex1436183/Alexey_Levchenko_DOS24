class BankAccount:
    def __init__(self, initial_balance=0):
        self.__balance = initial_balance

    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            print(f'Вы внесли {amount}. Новый баланс: {self.__balance}')
        else:
            print('Сумма депозита должна быть положительной!')

    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            print(f'Вы сняли {amount}. Новый баланс: {self.__balance}')
        else:
            print('Недостаточно средств или некорректная сумма.')

    def get_balance(self):
        return self.__balance

account = BankAccount(1000)
account.deposit(200)
account.withdraw(100)
print(f'Текущий баланс: {account.get_balance()}')