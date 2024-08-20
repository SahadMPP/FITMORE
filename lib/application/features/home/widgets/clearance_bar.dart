import 'package:flutter/material.dart';

class ClearanceBanner extends StatelessWidget {
  final String image;
  const ClearanceBanner({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image:  DecorationImage(image: AssetImage(image,),fit: BoxFit.fill),
        color: Colors.green[500],
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Row(
        children: [


          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Clearance Sales',
                //   style: GoogleFonts.aBeeZee(
                //     fontSize: 26,
                //     color: Colors.white,
                //   ),
                // ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      '% Up to 50%',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}