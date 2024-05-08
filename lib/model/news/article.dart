class Article{
  Source? source;
  String? auther;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Article.fromJson(Map<String,dynamic>json){
    source=Source.fromJson(json['source']);
    title= json['title'];
    auther= json['author'];
    content= json['content'];description= json['description'];
    publishedAt= json['publishedAt'];
    url= json['url'];
    urlToImage= json['urlToImage'];
  }


  Article(
      {this.source,

      this.auther,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});




}
class Source{
  String? id;
  String? name;
  Source({this.id, this.name});
  Source.fromJson(Map<String,dynamic>json){
    name=json['name'];
    id=json['id'];
  }



}