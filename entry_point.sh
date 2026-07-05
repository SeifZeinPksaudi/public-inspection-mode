#!/bin/sh

set -e

# انتظار جاهزية قاعدة البيانات
./wait_for_db.sh db

# تنفيذ migrations لإنشاء جداول قاعدة البيانات
python manage.py migrate --noinput

# تجميع الملفات الثابتة
python manage.py collectstatic --noinput

# تشغيل التطبيق  
python manage.py runserver 0.0.0.0:8000 