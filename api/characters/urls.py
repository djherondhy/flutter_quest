from django.urls import path
from .views import CharacterListCreateView, CharacterDetailView, RegisterUserView, UserCharacterListView

urlpatterns = [
    path('register/', RegisterUserView.as_view(), name='register'),
    path('', CharacterListCreateView.as_view(), name='character-list-create'),
    path('<int:pk>/', CharacterDetailView.as_view(), name='character-detail'),
    path('user/<int:user_id>/', UserCharacterListView.as_view(), name='user-character-list'),
]