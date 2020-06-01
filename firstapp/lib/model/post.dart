class Post {
    String body;
    String email;
    int id;
    String name;
    int postId;

    Post({this.body, this.email, this.id, this.name, this.postId});

    factory Post.fromJson(Map<String, dynamic> json) {
        return Post(
            body: json['body'], 
            email: json['email'], 
            id: json['id'], 
            name: json['name'], 
            postId: json['postId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['body'] = this.body;
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        data['postId'] = this.postId;
        return data;
    }
}

class PostList {
    final List<Post> posts;

    PostList({this.posts});

    factory PostList.fromJson(List<dynamic> parsedJson) {
        List<Post> posts = new List<Post>();
        posts = parsedJson.map((i) => Post.fromJson(i)).toList();

        return new PostList(posts: posts);
    }
}
