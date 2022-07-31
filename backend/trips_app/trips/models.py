from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class Trip(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=50)
    description = models.TextField()
    image = models.ImageField()

    def __str__(self):
        return self.title


class Profile(models.Model):

    gender_choices = [
        ("male", "male"),
        ("female", "female"),
    ]

    user = models.OneToOneField(
        User, on_delete=models.CASCADE, primary_key=True)
    gender = models.CharField(max_length=10, choices=gender_choices)
    birth_date = models.DateField()
    image = models.ImageField()
    bio = models.TextField()
    date_joined = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.user
