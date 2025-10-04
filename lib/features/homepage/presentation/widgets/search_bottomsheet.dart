
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        suffixIcon: Icon(Icons.close),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.close))
                ],
              ),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.only(left: 5),
                child: Text('Recent Search',style: TextStyle(
                    fontSize: 18,fontWeight: FontWeight.bold),
              ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {  },)
              
            ],
          ),
          )
            ),
    );
  }
}
