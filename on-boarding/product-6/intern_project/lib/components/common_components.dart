
import 'package:flutter/material.dart';
import 'package:intern_project/constants.dart';

class UserProfile extends StatelessWidget {
  final String day;
  final String userName;
  const UserProfile({super.key, required this.day, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstants.greyColor,
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.shadowColor,
                  )
                ]),
            // child: ClipRRect(
            //   child: Image.network(
            //     "",
            //     fit: BoxFit.fill,
            //   ),
            // ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style: TextStyle(
                      color: AppConstants.darkGreyColor,
                      fontSize: 12,
                    ),
                  ),
                  RichText(
                    text:  TextSpan(
                        text: "Hellow, ",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: userName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppConstants.greyColor,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(16)
            ),
            child: Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
