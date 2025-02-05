import platform
import subprocess

def check_ips(ip_list):
    if platform.system().lower() == "windows":
        param = "-n"
    else:
        param = "-c"

    for ip in ip_list:
        result = subprocess.run(["ping", param, "1", ip], stdout=subprocess.DEVNULL)
        if result.returncode == 0:
            status = "Доступен"
        else:
            status = "Недоступен"
        print(f"{ip}: {status}")


user_input = input("Введите IP-адреса через пробел: ")
ip_list = user_input.split()
check_ips(ip_list)