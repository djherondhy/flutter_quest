from rest_framework import serializers
from .models import Character

class CharacterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Character
        fields = ['id', 'nome', 'classe', 'forca', 'imagem', 'user']
        read_only_fields = ['user']
        