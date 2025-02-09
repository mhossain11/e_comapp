

import '../../../../core/res/media.dart';

class SliderModel{
  final String name;
  final String author;
  final String img;

  SliderModel({required this.name,required this.author,required this.img});
}

List<SliderModel> sliderList =[
  SliderModel(
      name: "The Dissapearance of Emila Zola",
      author: "Michael Rosen",
      img: Media.slider1),

  SliderModel(
      name: "Fatherhood",
      author: "Marcus Berkmann",
      img: Media.slider2),

  SliderModel(
      name: "The Time Travellers Handbook",
      author: "Stride Lottie",
      img: Media.slider3),

  SliderModel(
      name: "The Dissapearance of Emila Zola",
      author: "Michael Rosen",
      img: Media.slider4),

];