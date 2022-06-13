from django.shortcuts import render
from django.views.generic import CreateView
from .models import Post
from .forms import PostForm
from django.contrib.messages.views import SuccessMessageMixin
from .models import Category

# Create your views here.


class AddPostView(SuccessMessageMixin, CreateView):
    model = Post
    form_class = PostForm
    template_name = 'add-post.html'
    success_message = "Post Saved Sucessfully"

def myposts(request):
    if request.user.is_authenticated:
        if request.user.is_doctor:
            userid = request.user.id
            if request.path == '/blog/draft-posts':
                posts = Post.objects.filter(author=userid, draft=True).values()
                post_type = 'Draft Posts'
            else:
                posts = Post.objects.filter(author=userid, draft=False).values()
                post_type = 'Published Posts'
            return render(request, 'posts.html', {'posts': posts,'post_type':post_type})
        else:
            msg = 'You Dont Have Pemission To Access This Page'
    else:
        msg = 'You Dont Have Pemission To Access This Page'
    return render(request, 'posts.html', {'msg': msg})
    
def articleview(request,title, id):
    if request.user.is_authenticated:
        if request.user.is_doctor:
            userid = request.user.id
            posts = Post.objects.filter(author=userid,id=id).values()
            return render(request, 'article.html', {'posts': posts})
        elif request.user.is_patient:
            posts = Post.objects.filter(id=id, draft=False).values()
            return render(request, 'article.html', {'posts': posts})
        else:
            msg = 'You Dont Have Pemission To Access This Page'
    else:
        msg = 'You Dont Have Pemission To Access This Page'
    return render(request, 'posts.html', {'msg': msg})


def posts(request):
    if request.user.is_authenticated:
        if request.user.is_patient:
            posts = Post.objects.filter(draft=False).values()
            return render(request, 'posts.html', {'posts': posts,'post_type':'Posts'})
        else:
            msg = 'You Dont Have Pemission To Access This Page'
    else:
        msg = 'You Dont Have Pemission To Access This Page'
    return render(request, 'posts.html', {'msg': msg})
    
def categoryview(request, cat):
    if request.user.is_authenticated:
        if request.user.is_patient:
            posts = Post.objects.filter(category=cat.replace('-', ' '), draft=False).values()
            return render(request, 'posts.html', {'posts': posts,'post_type':cat.title().replace('-', ' ')})
        else:
            msg = 'You Dont Have Pemission To Access This Page'
    else:
        msg = 'You Dont Have Pemission To Access This Page'
    return render(request, 'posts.html', {'msg': msg})

def showcategory(request):
    if request.user.is_authenticated:
        if request.user.is_patient:
            category = Category.objects.all().values_list('name', 'name')
            category_list = []
            for item in category:
                item = str(item).split("'")
                item = item[1]
                category_list.append(item)
            print(category_list)
            return render(request, 'category.html', {'category': category_list})
        else:
            msg = 'You Dont Have Pemission To Access This Page'
    else:
        msg = 'You Dont Have Pemission To Access This Page'
    return render(request, 'posts.html', {'msg': msg})

