#!/bin/bash

echo ">> Güçlü Python şifre oluşturucu yükleniyor..."

# Doğru kurulum dizinini belirle
if [ -d "$PREFIX/bin" ]; then
    BIN_PATH="$PREFIX/bin"
else
    BIN_PATH="/usr/local/bin"
fi

cat << 'EOF' > "$BIN_PATH/passwordgen"
#!/usr/bin/env python3
import random
import string
import os

def clear():
    os.system("clear" if os.name != "nt" else "cls")

def generate_password(length=20):
    chars = string.ascii_letters + string.digits + string.punctuation
    password = "".join(random.choice(chars) for _ in chars)  # düzeltildi
    return password

def main():
    while True:
        clear()
        print("\033[1;32m" + " " * 50 + "Telegram: @thanatus098" + "\033[0m\n")
        print("=== Güçlü Şifre Üretici ===")
        try:
            length = int(input("Şifre uzunluğu (varsayılan 20): ") or 20)
        except:
            print("Geçersiz değer! Varsayılan 20 kullanılıyor.")
            length = 20

        print("\nÜretilen Şifre:")
        print("\033[1;33m" + generate_password(length) + "\033[0m")

        again = input("\nYeni bir şifre üretmek ister misiniz? (e/h): ").lower()
        if again != "e":
            break

if __name__ == "__main__":
    main()
EOF

chmod +x "$BIN_PATH/passwordgen"

echo ">> Kurulum tamamlandı!"
echo ">> Programı çalıştırmak için terminale: passwordgen yazın."
