class BlogModel {

  
    int ?id;
    String? cartegory;
    String ?headline;
     
    String? date;
    String ?image;
    String ?content;
    BlogModel({
        this.id,
        this.cartegory,
        this.headline,
          
        this.content,
        this.image,
        this.date,
    });


    factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        id: json["id"],
        cartegory: json["cartegory"],
         
        headline: json["headline"],
          content: json["content"],
        image: json["image"],
        date: json["date"],
    );

    Map<String, dynamic> toJson()  {
      final Map<String, dynamic> data = <String, dynamic>{};
data["id"]=id;
      
       data[ "headline"]=headline;
        data[ "cartegory"]=cartegory;
        data[  "date"]=date;
        data[ "image"]=image;
        data[ "content"]=content;
        return data;
    }
}