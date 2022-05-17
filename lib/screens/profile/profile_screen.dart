import 'package:flutter/material.dart';
import 'package:yes_demo/helpers/colors.dart';

import '../../widgets/bottom_login_sheet.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: whiteColor,
        title:  const Text(
          'Profile',
          style: TextStyle( fontSize: 17, color: secondaryColor, fontWeight: FontWeight.bold,),
          ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              alignment: Alignment.center,
              children:[
                Container(
                  child: Column(
                    children: [
                      Container(
                        color: grey1,
                        height:100,
                      ),
                      Container(
                        color: whiteColor,
                        height:100,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                      border:Border.all(color: grey2!, width: 2 ),
                                      color: grey3,
                                       borderRadius: BorderRadius.circular(3),
                                     ),
                            child: Icon(Icons.person, size: 40,),
                          ),
                         const SizedBox(width: 15,),
                           Expanded(
                             child: GestureDetector(
                                  onTap: (){
                                    _showLoginBottomSheet(context);
                                  
                                  },
                                   child: Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(2),
                                  color: primaryColor,
                                     ),
                                  padding: const EdgeInsets.symmetric(vertical: 7),
                                  alignment: Alignment.center,
                                  child:  const Text('LOG IN/SIGN UP' ,style:  TextStyle(fontSize: 15, color: whiteColor, fontWeight: FontWeight.w500)),
                                                   ),
                                                 ),
                           ),
                        ],
                      ),
                      ),
                )
              ]
            )
          ]),
        ),
      ),
    );
  }

  void _showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context){
          return const BottomLoginSheet();
        });
  }
}