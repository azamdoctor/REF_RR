#!/bin/bash
# Скрипт для первичной заливки проекта в GitHub: azamdoctor/REF_RR
# Запускать из папки проекта: bash push_to_github.sh

set -e

cd "$(dirname "$0")"

# 1. Удаляем сломанный .git (был создан в песочнице с ограниченными правами)
if [ -d .git ]; then
  echo "→ Удаляю старый .git ..."
  rm -rf .git
fi

# 2. Чистая инициализация
echo "→ git init"
git init -b main

# 3. Локальный user/email (поменяйте, если нужно)
git config user.email "thanhhiennguyena4117@gmail.com"
git config user.name "azamdoctor"

# 4. Add + commit
git add -A
git status --short
git commit -m "Initial commit: ТЗ, прототипы v1–v3, сводная таблица"

# 5. Подключаем remote и пушим
git remote add origin https://github.com/azamdoctor/REF_RR.git
git branch -M main

echo ""
echo "→ Пушу в origin/main ..."
echo "  GitHub попросит логин и пароль/токен."
echo "  Введите username = azamdoctor, password = ваш Personal Access Token"
echo "  (создать токен: https://github.com/settings/tokens — scope: repo)"
echo ""

git push -u origin main

echo ""
echo "✓ Готово. Откройте https://github.com/azamdoctor/REF_RR"
