from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('add-post', views.AddPostView.as_view(), name = "add-post"),
    path('published-posts', views.myposts, name = "published-posts"),
    path('draft-posts', views.myposts, name = "draft-posts"),
    path('posts', views.posts, name = "posts"),
    path('category/<str:cat>/', views.categoryview, name="category"),
    path('category', views.showcategory, name = "showcategory"),
    path('article/<int:id>/<str:title>', views.articleview, name = "article")
    #path('posts', views.dashboardView, name = "allpost"),
]