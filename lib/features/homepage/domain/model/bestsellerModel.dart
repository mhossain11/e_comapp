


class SellerModel{
  final int id;
  final String name;
  final String? author;
  final String img;
  final double? rating;
  final double? price;
  final String? offer;
  final String? brandName;
  //------ new
  final String? category;
  final String? editor;
  final String? edition;
  final int? stock;
  final int? copiesAvailable;
  final int? ratings;
  final int? reviews;

  SellerModel({
    required this.id ,
    required this.name,
    this.author,
    required this.img,
    this.rating,
    this.price,
    this.offer,
    this.brandName,
    this.category,
    this.editor,
    this.edition,
    this.stock,
    this.copiesAvailable,
    this.ratings,
    this.reviews,
  });
}



List<SellerModel> bestList =[
  SellerModel(
      id: 1,
      name: "Fatherhood",
      author:  "by Christopher Wilson",
      img: "assets/img/4.jpg",
      offer:'25%',
      rating: 5.0,
      price: 180.0,
    brandName: 'Nike',

  ),
  SellerModel(
      id: 2,
      name:"In A Land Of Paper Gods",
      author:"by Rebecca Mackenzie",
      img:  "assets/img/5.jpg",
      rating:  4.0,
      offer:'35%',
      price: 250.0),
  SellerModel(
      id: 3,
      name:"Tattletale",
      author:"by Sarah J. Noughton",
      img: "assets/img/6.jpg",
      rating:  3.0,
      offer:'25%',
      price: 300.0,
      brandName: 'Nike'
  ),
  SellerModel(
      id: 3,
      name:"Tattletale",
      author:"by Sarah J. Noughton",
      img: "assets/img/6.jpg",
      rating:  3.0,
      offer:'25%',
      price: 300.0,
      brandName: 'Nike'
  ),
  SellerModel(
      id: 3,
      name:"Tattletale",
      author:"by Sarah J. Noughton",
      img: "assets/img/6.jpg",
      rating:  3.0,
      offer:'25%',
      price: 300.0,
      brandName: 'Nike'
  ),

];


List<SellerModel> recentList =[
  SellerModel(
      id: 1,
      name: "The Fatal Tree",
      author:  "by Jake Arnott",
      img: "assets/img/10.jpg",),
  SellerModel(
      id: 2,
      name:"Day Four",
      author:"by LOTZ, SARAH",
      img:  "assets/img/11.jpg",),
  SellerModel(
      id: 3,
      name:"Door to Door",
      author:"by Edward Humes",
      img: "assets/img/12.jpg",),

];

List<SellerModel>  genresList =[
  SellerModel(
      id: 1,
      name: "Graphic Novels",
      img:"assets/img/g1.png",),
  SellerModel(
      id: 2,
      name:"Graphic Novels",
      img:  "assets/img/g1.png",),
  SellerModel(
      id: 3,
      name:"Graphic Novels",
      img:"assets/img/g1.png",),

];
