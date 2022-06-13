from django import forms
from .models import Post, Category

choices = Category.objects.all().values_list('name', 'name')
choice_list = []
for item in choices:
    choice_list.append(item)
class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ('title', 'author', 'image', 'category', 'summary', 'content', 'draft')

        widgets = {
            'title': forms.TextInput(attrs={"class": "form-control col-md-6"}),
            #'author': forms.TextInput(attrs={"class": "form-control"}),
            'author': forms.Select(attrs={"class": "form-control",'id': 'username'}),
            #'image': forms.ImageField(attrs={"class": "form-control"}),
            'category': forms.Select(choices=choice_list, attrs={"class": "form-control"}),
            'summary': forms.Textarea(attrs={"class": "form-control",'id': "exampleFormControlTextarea2"}),
            'content': forms.Textarea(attrs={"class": "form-control"}),
            #'draft': forms.CheckboxInput(attrs={"class": "form-control"})
        }