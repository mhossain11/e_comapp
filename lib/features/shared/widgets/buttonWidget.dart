import 'package:flutter/material.dart';

import '../../../core/res/styles/colors.dart';

class RoundButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double wight;
  final double height;
  const RoundButtonWidget({super.key,
    required this.onPressed,
    required this.title,
    this.color = Colours.primary,
    this.textColor =Colors.white,
    this.wight =double.infinity,
    this.height =50});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(wight,height),
       // maximumSize: const Size(double.infinity,50),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),

      ),
      child: Text(title,style: TextStyle(fontSize: 17,color:textColor, fontWeight: FontWeight.w500),),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ButtonsWidget({super.key,required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: getColor(Colors.white, Colours.primary),
        foregroundColor: getColor(Colours.primary, Colors.white),
        shadowColor: WidgetStateProperty.resolveWith((state)=>Colours.primary),
        minimumSize: WidgetStateProperty.resolveWith((state)=>
        const Size(double.maxFinite, 50)),
        elevation:WidgetStateProperty.resolveWith((state)=>
        state.contains(WidgetState.pressed)?1:0),
        shape: WidgetStateProperty.resolveWith((state)=>
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side:BorderSide(
                    width: 1,
                    color: state.contains(WidgetState.pressed)
                        ? Colors.transparent
                        : Colours.primary
                ) ),
        ),


      ),


      child: Text(title,style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),

    );


  }
  WidgetStateProperty<Color>getColor(Color color, Color colorPressed){
    return WidgetStateProperty.resolveWith((state)=>state.contains(WidgetState.pressed)? colorPressed :color);
  }
}

class IconRoundButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final IconData? icon;
  const IconRoundButtonWidget({super.key,required this.onPressed, required this.title, this.color = Colours.primary,this.textColor =Colors.white, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity,50),
        // maximumSize: const Size(double.infinity,50),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(title,style: TextStyle(fontSize: 17,color:textColor, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}

class IconButtonsWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const IconButtonsWidget({super.key,required this.onPressed, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: getColor(Colours.primary, Colours.wColor),
        foregroundColor: getColor( Colors.white, Colours.primary),
        shadowColor: WidgetStateProperty.resolveWith((state)=>Colours.wColor),
        minimumSize: WidgetStateProperty.resolveWith((state)=>
        const Size(double.maxFinite, 50)),
        elevation:WidgetStateProperty.resolveWith((state)=>
        state.contains(WidgetState.pressed)?1:0),
        shape: WidgetStateProperty.resolveWith((state)=>
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side:BorderSide(
                    width: 1,
                    color: state.contains(WidgetState.pressed)
                        ? Colors.transparent
                        : Colours.primary
                ) ),
        ),


      ),


      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(title,style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
        ],
      ),

    );


  }
  WidgetStateProperty<Color>getColor(Color color, Color colorPressed){
    return WidgetStateProperty.resolveWith((state)=>state.contains(WidgetState.pressed)? colorPressed :color);
  }
}







