FROM python:3.14-slim

WORKDIR /app

# تثبيت pipenv وأدوات PostgreSQL
#RUN apt-get update && apt-get install -y postgresql-client && apt-get clean
# ----------------------------
# تثبيت متطلبات النظام الأساسية
# ----------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client \
    build-essential \
    pkg-config \
    libglib2.0-0 \
    libgobject-2.0-0 \
    libcairo2 \
    libpango-1.0-0 \
    git \
    libpango1.0-dev \
    libgdk-pixbuf-xlib-2.0-0 \
    libffi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# ----------------------------
RUN pip install pipenv  

# نسخ ملفات Pipenv
COPY Pipfile Pipfile.lock ./

# تثبيت التبعيات
RUN pipenv install --deploy --system

# نسخ كود المشروع
COPY . .

# جعل ملفات البرمجة النصية قابلة للتنفيذ
RUN chmod +x wait_for_db.sh entry_point.sh

EXPOSE 8000

# تعيين نقطة الدخول
CMD ["./entry_point.sh"]

