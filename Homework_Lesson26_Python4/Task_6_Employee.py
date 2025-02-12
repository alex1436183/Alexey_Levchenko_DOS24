class Employee:
    company_name = "IT Development"

    def __init__(self, name, position):
        self.name = name
        self.position = position

    def get_info(self):
        return f"Employee: {self.name}, Position: {self.position}, Company: {Employee.company_name}"

employee1 = Employee("Petya", "Developer")
employee2 = Employee("Vova", "DevOps")

print(employee1.get_info())
print(employee2.get_info())