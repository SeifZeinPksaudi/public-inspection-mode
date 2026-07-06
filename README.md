# 🐳 InspectMode

Lightweight setup using **Docker only** (no local Python required).

---

## 🚀 Setup (Docker Required)

### 1) Clone project

```bash
git clone <repo-url>
cd InspectMode
```
### 2) Create environment file and edite values
```bash
cp .env.example .env
```

### 3) Build and run everything
```
docker compose up --build
```

### First time setup (inside Docker)
#### create superuser
```bash
docker compose exec web python manage.py createsuperuser
```
## 🌐 Services URLs

| Service           | URL                          |
|------------------|------------------------------|
| Django App       | http://127.0.0.1:8000       |
| Admin Panel      | http://127.0.0.1:8000/admin |
| RabbitMQ UI      | http://127.0.0.1:15672      |
| Elasticsearch    | http://127.0.0.1:9200       |
