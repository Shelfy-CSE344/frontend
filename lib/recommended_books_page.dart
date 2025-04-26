import 'package:flutter/material.dart';
import 'book_detail_page.dart';

class RecommendedPage extends StatefulWidget {
  @override
  State<RecommendedPage> createState() => _RecommendedPageState();
}

class _RecommendedPageState extends State<RecommendedPage> {
  final List<Map<String, String>> books = [
    {
      'title': 'The Red and the Black',
      'author': 'Stendhal',
      'rating': '4.6/5.0',
      'image': 'lib/assets/the_red_and_the_black.png',
    },
    {
      'title': 'Romeo and Juliet',
      'author': 'William Shakespeare',
      'rating': '4.8/5.0',
      'image': 'lib/assets/romeo_and_juliet.png',
    },
    {
      'title': 'Notes From Underground',
      'author': 'Fyodor Dostoevsky',
      'rating': '4.7/5.0',
      'image': 'lib/assets/notes_from_underground.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7F4),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookDetailPage(
                    title: book['title']!,
                    author: book['author']!,
                    image: book['image']!,
                    rating: book['rating']!,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(109, 204, 203, 0.25),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    book['image']!,
                    height: 120,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(book['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(book['author']!),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            ...List.generate(5, (i) {
                              double rating = double.parse(book['rating']!.split('/').first);
                              return Icon(
                                i < rating.floor() ? Icons.star : Icons.star_border,
                                size: 16,
                                color: Colors.amber,
                              );
                            }),
                            const SizedBox(width: 5),
                          ],
                        ),
                        Text(book['rating']!, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[300],
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          child: const Text("Mark as Read", style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[200],
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          child: const Text("Add to Wishlist", style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
