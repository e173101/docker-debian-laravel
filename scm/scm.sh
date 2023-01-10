#!/bin/bash -e

git init
git pull --no-rebase https://gitee.com/yongtian/todo-pi-server.git master

composer install
cp .env.example .env
php artisan key:generate

while [ true ]
do
    last_revision=$(git log -n 1 --format="%H")
    remote_revision=$(git ls-remote -h https://gitee.com/yongtian/todo-pi-server.git master)

    if [[ $last_revision != $remote_revision* ]]; then
        echo "========== UPDATE START =========="
        date
        echo "========== UPDATE START =========="

        echo "last revision: $last_revision"
        echo "remote revision: ${remote_revision}"
        
        # update code
        git pull --no-rebase https://gitee.com/yongtian/todo-pi-server.git master


        # update app
        php artisan view:clear
        # php artisan migrate

        echo "========== UPDATE END =========="
        date
        echo "========== UPDATE END =========="
    fi

    sleep 60
done
