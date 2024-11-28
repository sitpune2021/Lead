import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String image;
  final String? imageurl;
  final double? height;
  const BannerWidget({
    Key? key,
    required this.image,
    this.imageurl,
    this.height, // Mark it as required in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      child: ClipRect(
        /** Banner Widget **/
        child: Container(
          // color: Colors.white,
          // decoration: BoxDecoration(
          //   // border: Border.all(color: Colors.purple),
          //   borderRadius: BorderRadius.circular(12),
          //   color: Colors.white,
          // ),

          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Curved corners
                  child: SizedBox(
                      height: height ?? 220, // Set the desired height here
                      width: double.infinity, // Make it responsive
                      child: imageurl == null
                          ? Image.asset(
                              image,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              imageurl!,
                              fit: BoxFit.cover,
                            )),
                )

                // Image.network(
                //     'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg'), //Image.network
                // const SizedBox(height: 10),
                // const Text(
                //   'GeeksforGeeks',
                //   style: TextStyle(
                //       color: Colors.green,
                //       fontSize: 40,
                //       fontWeight: FontWeight.bold), //TextStyle
                // ),
                // const SizedBox(
                //   height: 5,
                // ), //SizedBox
                // const Text(
                //   'Fork Python Course',
                //   style: TextStyle(
                //       color: Colors.green,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold), //TextStyle
                // ), //Text
                // const SizedBox(height: 20),

                // RaiseButton is deprecated and should not be used. Use ElevatedButton instead.

                // RaisedButton(
                // color: Colors.greenAccent[400],
                // onPressed: () {},
                // child: const Text('Register'),
                // ) //RaisedButton
              ], //<Widget>[]
            ), //Column
          ), //Padding
        ), //Banner
      ), //ClipRect
    );
  }
}
