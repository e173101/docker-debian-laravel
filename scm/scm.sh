#!/bin/bash -e

GIT_URL=$1
GIT_BRANCH=$2

git init
git pull --no-rebase $GIT_URL $GIT_BRANCH

# backend
composer install

cp .env.example .env # once
php artisan key:generate # once
php artisan migrate

# frontend
npm install
npm run dev

echo "========== INIT DONE =========="

while [ true ]
do
    last_revision=$(git log -n 1 --format="%H")
    remote_revision=$(git ls-remote -h $GIT_URL $GIT_BRANCH)

    if [[ ${remote_revision} != *${last_revision}* ]]; then
        echo "========== UPDATE START =========="
        date

        echo "last revision: $last_revision"
        echo "     revision: ${remote_revision}"
        
        # update code
        git pull --no-rebase https://gitee.com/yongtian/todo-pi-server.git master

        # update backend
        composer install
        
        # update frontend
        npm install
        npm run dev
        

        # update app
        php artisan migrate
        php artisan view:clear

        date
        echo "========== UPDATE END =========="
    fi

    sleep 60
done
