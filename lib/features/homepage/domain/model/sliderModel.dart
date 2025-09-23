

import '../../../../core/res/media.dart';

class SliderModels{
  final String name;
  final String author;
  final String img;

  SliderModels({required this.name,required this.author,required this.img});
}

List<SliderModels> sliderList =[
  SliderModels(
      name: "The Dissapearance of Emila Zola",
      author: "Michael Rosen",
      img: Media.slider1),

  SliderModels(
      name: "Fatherhood",
      author: "Marcus Berkmann",
      img: Media.slider2),

  SliderModels(
      name: "The Time Travellers Handbook",
      author: "Stride Lottie",
      img: Media.slider3),

  SliderModels(
      name: "The Dissapearance of Emila Zola",
      author: "Michael Rosen",
      img: Media.slider4),

];