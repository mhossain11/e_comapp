
import 'package:e_comapp/features/homepage/domain/model/searchmodel.dart';
import 'package:e_comapp/features/homepage/presentation/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  HomeController controller = Get.find<HomeController>();

  void _deleteOneCharacter() {
    final text = searchController.text;
    if (text.isNotEmpty) {
      final newText = text.substring(0, text.length - 1);
      // Instead of directly assigning to .text, update value
      searchController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchBar(context),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Recent Search',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                _buildRecentSearchList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔍 Search Bar Widget
  Widget _buildSearchBar(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged:  (value) {
                controller.searchData(value); // 🔍 instant search as you type
              },
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                filled: true,
                fillColor: Colors.grey.shade300,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: _deleteOneCharacter,
                      icon: const Icon(Icons.close),
                    ),
                  /*  IconButton(
                      onPressed: () {
                        controller.searchData(searchController.text);
                      },
                      icon: const Icon(Icons.saved_search),
                    ),*/
                  ],
                ),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  /// 🕓 Recent Search List Widget
  Widget _buildRecentSearchList() {

    return Obx(
      ()=> ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // keeps inside column scrollable
      itemCount: controller.searchList.length,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.grey,
        thickness: 0.5,
        height: 20,
      ),
      itemBuilder: (context, index) {
        return _buildRecentSearchItem(controller.searchList[index]);
      },
    ),
    );
  }

  /// 🧩 Single Search Item Widget
  Widget _buildRecentSearchItem(SearchModel modelItem) {
    final List<String> recentSearches = [
      "Laptop",
      "Smartphone",
      "Headphones",
      "Camera",
      "Shoes",
      "Backpack",
      "Watch",
      "Tablet",
      "Power Bank",
      "Keyboard"
    ];
    return GestureDetector(
      onTap: (){

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            modelItem.image.toString(),
            fit: BoxFit.cover,
            width: 60,
            height: 60,),
          const SizedBox(width: 10),
          SizedBox(
              width: 150,
              child: Text('${modelItem.name}',
                overflow: TextOverflow.ellipsis,
                maxLines:2,style: TextStyle(fontSize: 14),))

        ],
      ),
    );

   /* return ListTile(
      leading: const Icon(Icons.history),
      title: Text(title),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          // Remove from recent search
        },
      ),
      onTap: () {
        // Handle search click
      },
    );*/
  }
}
