import 'package:expense_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
   final List expenseData =[
    {
      "day": "Tuesday, 14",
      "total": "-\$1380",
      "items": [
        {"title": "Shop", "subtitle": "Buy new clothes", "amount": "-\$90", "icon": Icons.shopping_bag, "color":Color(0XFFEEF0FF),"iconColor": Color(0XFF5B5FD3)},
        {"title": "Electronic", "subtitle": "Buy new iphone 14", "amount": "-\$1290", "icon":Icons.phone_iphone, "color":Color(0XFFFDF4E3),"iconColor":Color(0XFFD9A441),},
      ]
    },
    {
      "day": "Monday, 13",
      "total": "-\$60",
      "items": [
        {"title": "Transportation", "subtitle": "Trip to Malang", "amount": "-\$60","icon":Icons.directions_bus_filled, "color":Color(0XFFFDECEC),"iconColor":Color(0XFFE2457E)},
      ]
    },
     {
       "day": "Tuesday, 14",
       "total": "-\$1380",
       "items": [
         {"title": "Shop", "subtitle": "Buy new clothes", "amount": "-\$90", "icon": Icons.shopping_bag, "color":Color(0XFFEEF0FF),"iconColor": Color(0XFF5B5FD3)},
         {"title": "Electronic", "subtitle": "Buy new iphone 14", "amount": "-\$1290", "icon":Icons.phone_iphone, "color":Color(0XFFFDF4E3),"iconColor":Color(0XFFD9A441),},
       ]
     },

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child:Padding(
         padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Image.asset('assets/image/MonetyLogo.png'),
                 Spacer(),
                 InkWell(
                   onTap: (){
                   },
                   child:Icon(Icons.search,
                   color:Colors.black,
                   size: 26,
                   ),
                 ),
                 SizedBox(width: 25,),
                 InkWell(
                   onTap: ()async{
                     final prefs = await SharedPreferences.getInstance();
                     await prefs.setBool('isLoggedIn', false);
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(),));
                   },
                   child:Icon(Icons.logout_outlined,
                   color:Colors.black,
                   size: 24,
                   ),
                 ),
               ],

             ),
             SizedBox(height: 20,),
             Row(
               children:[
                Row(
                  children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0XFF897BE8),
                        child: Icon(
                         Icons.person,
                         color: Colors.white,
                         size: 40,
                        ),

                        ),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Morning',
                             style: TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.w500,
                               color: Color(0XFF8E8EA6),
                             ),

                          ),
                          Text('Blaszczykowski',
                            style: TextStyle(
                              fontSize:16,
                              color: Color(0XFF1C1B3A),
                              fontWeight: FontWeight.w600

                            ),
                          ),
                        ],

                      ),

                  ],


                ),
                Spacer(),
                Container(
                  width: 114,
                  height: 34,
                  decoration: BoxDecoration(
                  color: Color(0XFFF1F2FB),
                  borderRadius: BorderRadius.circular(4),),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 5),
                        child: Text("This month",
                        style: TextStyle(
                          color: Color(0XFF1C1B3A),
                        ),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),


                ),
               ],

             ),
             SizedBox(height: 18,),
             Container(
               width: 388,
               height: 114,
               decoration: BoxDecoration(
               color: Color(0XFF5B5FD3),
               borderRadius: BorderRadius.circular(10)
               ),
               child: Row(
                 children: [
                   Padding(
                     padding: EdgeInsets.only(left: 20),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Expense total",
                           style: TextStyle(
                             color: Color(0XFFFFFFFF),
                             fontWeight: FontWeight.w400,
                             fontSize: 14,
                           ),

                         ),
                         Text("\$3,734",
                           style: TextStyle(
                             color: Color(0XFFFFFFFF),
                             fontSize: 34,
                             fontWeight: FontWeight.bold,
                           ),

                         ),
                         Row(
                           children: [
                             Container(
                               width: 52,
                               height: 21,
                               decoration: BoxDecoration(
                               color: Color(0XFFE05A5A),
                               borderRadius: BorderRadius.circular(4)
                               ),

                               child: Center(
                                 child: Text('+\$240',
                                   style: TextStyle(
                                   color: Color(0XFFFFFFFF),
                                    fontSize: 12,
                                     fontWeight: FontWeight.w600,

                                   ),

                                 ),
                               ),

                             ),
                             SizedBox(width: 10,),//Red
                             Text('than last month',
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 color: Colors.white70,
                               ),
                             ),

                           ],
                         ),


                       ],
                     ),
                   ),
                   Spacer(),
                   Image.asset('assets/image/PieIllustration.png')
                 ],
               ),
             ),
             SizedBox(height: 25,),
             Text("Expense List",
             style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 20,
             ),
             ),
             SizedBox(height: 10,),
             Expanded(
               child: ListView.builder(
                 shrinkWrap: true,
                 itemCount: expenseData.length,
                 itemBuilder: (context, index){
                 final dayItem = expenseData[index];
                 final listItems = dayItem['items'];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16,right: 2, left: 2),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(
                      color: Color(0XFFD4D4D4),
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                          Text(dayItem["day"],
                            style:TextStyle(
                              color: Color(0XFF1C1B3A),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                          ),),
                          Spacer(),
                          Text(dayItem["total"], style: TextStyle(
                            color: Color(0XFF1C1B3A),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),),
                          ],
                        ),
                        SizedBox(height: 14,),
                        Container(
                          width: 354,
                          height: 1,
                          color: Color(0XFFD4D4D4),
                        ),
                        ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:listItems.length,
                        itemBuilder: ( context,index){
                        final items = listItems[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom:10,top:15),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                color: items['color'],
                                borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  items["icon"],
                                  color: items["iconColor"],
                                ),
                              ),
                              SizedBox(width: 12,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items["title"],
                                  style: TextStyle(
                                   fontSize: 15,
                                   color: Color(0XFF1C1B3A),
                                   fontWeight: FontWeight.w600
                                  ),
                                  ),
                                  Text(items["subtitle"])
                                ],
                              ),
                              Spacer(),
                              Text(
                                items["amount"],
                                style: TextStyle(
                                  color: Color(0XFFE2659B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,

                                ),
                              ),
                            ],
                          ),
                        );

                        },


                        ),

                      ],
                    )

                 );

                 },

               ),
             ),


           ],
         ),
       ),

      ),


    );
  }
}
