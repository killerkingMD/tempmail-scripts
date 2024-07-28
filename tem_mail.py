import requests
import colorama
from colorama import Fore, Style

colorama.init(autoreset=True)

API_URL = "https://www.1secmail.com/api/v1/"

def generate_email():
    response = requests.get(API_URL + "?action=genRandomMailbox&count=1")
    email = response.json()[0]
    print(f"{Fore.GREEN}E-mail temporário gerado: {email}")
    return email

def check_inbox(email):
    login, domain = email.split("@")
    response = requests.get(API_URL + f"?action=getMessages&login={login}&domain={domain}")
    messages = response.json()
    if not messages:
        print(f"{Fore.RED}A caixa de entrada está vazia.")
    else:
        print(f"{Fore.BLUE}Caixa de entrada:")
        for msg in messages:
            print(f"ID: {msg['id']}, De: {msg['from']}, Assunto: {msg['subject']}")

def read_email(email, email_id):
    login, domain = email.split("@")
    response = requests.get(API_URL + f"?action=readMessage&login={login}&domain={domain}&id={email_id}")
    if response.status_code == 200:
        message = response.json()
        print(f"De: {message['from']}")
        print(f"Assunto: {message['subject']}")
        print(f"Data: {message['date']}")
        print(f"Mensagem:\n{message['textBody']}")
    else:
        print(f"{Fore.RED}Erro ao ler o e-mail. ID inválido.")

def main():
    email = generate_email()
    while True:
        show_menu()
        choice = input()
        if choice == "1":
            email = generate_email()
        elif choice == "2":
            check_inbox(email)
        elif choice == "3":
            email_id = input("Digite o ID do e-mail que deseja ler: ")
            if email_id.isdigit():
                read_email(email, email_id)
            else:
                print(f"{Fore.RED}ID inválido. Por favor, insira um número válido.")
        elif choice == "4":
            print("Saindo...")
            break
        else:
            print(f"{Fore.RED}Opção inválida. Por favor, tente novamente.")

def show_menu():
    print(f"{Fore.YELLOW}========================================")
    print(f"{Fore.YELLOW}Menu: Gerador👑")
    print(f"{Fore.YELLOW}========================================")
    print(f"{Fore.YELLOW}█▀▀▀▀▀▀▀▀           ▀▀▀▀▀▀▀▀█")
    print(f"{Fore.YELLOW}1. Gerar um e-mail temporário")
    print(f"{Fore.YELLOW}2. Verificar a caixa de entrada")
    print(f"{Fore.YELLOW}3. Ler um e-mail específico")
    print(f"{Fore.YELLOW}4. Sair")
    print(f"{Fore.YELLOW}█▄▄▄▄▄▄▄▄           ▄▄▄▄▄▄▄▄█")
    print(f"{Fore.YELLOW}Escolha uma opção:")

if __name__ == "__main__":
    main()
