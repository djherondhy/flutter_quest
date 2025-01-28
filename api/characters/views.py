from rest_framework import generics, permissions
from .models import Character
from .serializers import CharacterSerializer
from django.contrib.auth.models import User
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

class CharacterListCreateView(generics.ListCreateAPIView):
    serializer_class = CharacterSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        # Define o usuário autenticado como o criador do Character
        serializer.save(user=self.request.user)

    def get_queryset(self):
        # Retorna apenas os personagens do usuário autenticado
        return Character.objects.filter(user=self.request.user)
    
    def get_queryset(self):
        return Character.objects.filter(user=self.request.user)

class CharacterDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Character.objects.all()
    serializer_class = CharacterSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Character.objects.filter(created_by=self.request.user)

class UserCharacterListView(generics.ListAPIView):
    serializer_class = CharacterSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # Retorna os personagens de um usuário específico (baseado no ID)
        user_id = self.kwargs['user_id']
        return Character.objects.filter(user_id=user_id)
    
class RegisterUserView(APIView):
    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')

        if not username or not password:
            return Response({'error': 'Username e senha são obrigatórios'}, status=status.HTTP_400_BAD_REQUEST)

        if User.objects.filter(username=username).exists():
            return Response({'error': 'Usuário já existe'}, status=status.HTTP_400_BAD_REQUEST)

        user = User.objects.create_user(username=username, password=password)
        user.save()

        return Response({'message': 'Usuário registrado com sucesso'}, status=status.HTTP_201_CREATED)
