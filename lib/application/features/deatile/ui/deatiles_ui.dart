import 'package:flutter/material.dart';

class DeatilesUi extends StatelessWidget {
  const DeatilesUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                'https://example.com/xbox_series_x.jpg', // Replace with your image URL
                height: 200,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Xbox Series X',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_half, color: Colors.yellow),
                SizedBox(width: 8.0),
                Text(
                  '4.8',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(width: 8.0),
                Text(
                  '(117 reviews)',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'The Microsoft Xbox Series X gaming console is capable of impressing with minimal boot times and mesmerizing visual effects when playing games at up to 120 frames per second.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Chip(label: Text('1 TB')),
                SizedBox(width: 8.0),
                Chip(label: Text('825 GB')),
                SizedBox(width: 8.0),
                Chip(label: Text('512 GB')),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '\$850.00',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      '\$570.00',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}