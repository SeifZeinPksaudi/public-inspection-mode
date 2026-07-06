from __future__ import annotations
import os
from celery import Celery
from celery.schedules import crontab
from celery.signals import setup_logging

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'incpectionmode.settings')

app = Celery('incpectionmode')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()