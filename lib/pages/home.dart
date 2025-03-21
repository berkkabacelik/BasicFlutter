import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_flutter_app/models/category_model.dart';
import 'package:my_flutter_app/models/diet_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getInitialInfo(){
  
  categories = CategoryModel.getCategories();
  diets = DietModel.getDiets();

  }
  

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          SizedBox(height: 40),
          
          _categoriesSection(),
          SizedBox(height: 40,),
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
              children: [

                Padding(padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Recommendation\nfor diet',
                   style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    


                   ),
                ),  

                ),
                SizedBox(height: 15,),
                Container(
                
                  height: 240,
                  child: ListView.separated(
                     itemBuilder: (context, index){
                      return Container(
                          width: 210,
                          decoration: BoxDecoration(
                            color: diets[index].boxColor,
                            borderRadius: BorderRadius.circular(20)

                          ),

                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(diets[index].iconPath),
                                Text(
                                  diets[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16

                                  ),

                                ),
                                Text(diets[index].level +' | '+diets[index].duration +' | ' +diets[index].calorie,
                                style: TextStyle(
                                  color: Color(0xff7B6F72),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400

                                ),

                               
                                
                                ),

                                Container(
                                height: 45 ,
                                 width: 130,
                                  child: Center(
                                    child: Text(
                                        'View',
                                        style: TextStyle(
                                       color: diets[index].viewIsSelected ?  Colors.white : Color(0xffC58BF2),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14
                                      

                                      ),

                                     ),

                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      diets[index].viewIsSelected ?Color(0xff9DCEFF) : Colors.transparent,
                                      diets[index].viewIsSelected ? Color(0Xff92A3FD) : Colors.transparent

                                    ]),
                                    borderRadius: BorderRadius.circular(50)

                                  ),

                                )
                              ],

                          ) ,


                      );

                     },
                     separatorBuilder: (context, index) => SizedBox(width: 25,),
                     itemCount: diets.length,
                     scrollDirection: Axis.horizontal, 
                     padding: EdgeInsets.only(
                      left: 20,
                      right: 20

                     ),


                  ),


                )

              ],


          )
        ],
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 150,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => SizedBox(width: 25),
                itemBuilder: (context, index) {
                  return Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index]
                          .boxColor
                          .withAlpha((0.3 * 255).toInt()),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        SizedBox(height: 8), // Text ile container arasında boşluk ekledim
                        Text(
                          categories[index].name, // Doğru kullanım
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withAlpha((0.11 * 255).toInt()),
            blurRadius: 40,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          hintText: 'Search Pancake',
          hintStyle: TextStyle(
            color: Color(0xffDDDADA),
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/filters-2.svg'),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/nav-arrow-left.svg',height: 20, width: 20, ),
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(  'assets/icons/horizontal-ellipsis.svg',height: 20, width: 20, ),
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
