import 'package:flutter/material.dart';

import 'book_detail_page.dart';

class FriendProfilePage extends StatelessWidget {
  final String name;
  final String avatar;
  final String quote;
  final String readingGoal;
  final List<Map<String, dynamic>> reviews;
  final List<Map<String, dynamic>> bookshelf;
  final List<Map<String, dynamic>> wishlist;

  FriendProfilePage({
    Key? key,
    required this.name,
    required this.avatar,
    required this.quote,
    required this.readingGoal,
    required this.reviews,
    required this.bookshelf,
    required this.wishlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7F4),
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "$name's Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔍 Search bar & settings
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // 👤 Profile info + button
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF6DCCCB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.pink[100],
                      backgroundImage: AssetImage(avatar),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("@ChapterChaser",
                              style: TextStyle(fontSize: 13)),
                          Text(quote, style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Add friend",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 🎯 Reading goal
              Row(
                children: [
                  Text("READING GOAL: $readingGoal/50 Books",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),

              // 📚 My Bookshelf
              sectionTitle("$name's Bookshelf"),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFD0F2F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: bookshelf.isEmpty
                    ? Center(
                        child: Text("No books in bookshelf.",
                            style: TextStyle(fontSize: 20)))
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: bookshelf.map((book) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: bookItem(context, book['image']!, book['author']!,
                                  book['title']!),
                            );
                          }).toList(),
                        ),
                      ),
              ),
              SizedBox(height: 20),

              // 📖 Wishlist
              sectionTitle("$name's Wishlist"),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFD0F2F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: wishlist.isEmpty
                    ? Center(
                        child: Text("No books in wishlist.",
                            style: TextStyle(fontSize: 20)))
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: wishlist.map((book) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: bookItem(context, book['image']!, book['author']!,
                                  book['title']!),
                            );
                          }).toList(),
                        ),
                      ),
              ),
              SizedBox(height: 20),

              // ✍️ My Review
              sectionTitle("$name's Reviews"),
              reviews.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFD0F2F0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text("No reviews available.",
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: reviews
                          .map((review) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: reviewItem(review['title'],
                                    review['text'], review['rating']),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget bookItem(BuildContext context,String imagePath, String author, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookDetailPage(
              image: imagePath,
              author: author,
              title: title,
              rating: "4.5",
            ),
          ),
        );
      },
      child: SizedBox(
        width: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 28,
              alignment: Alignment.center,
              child: Text(
                author,
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 32,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                5,
                    (index) => Icon(Icons.star, size: 10, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget reviewItem(String title, String reviewText, int rating) {

    int likes = 0;
    int dislikes = 0;

    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          elevation: 1,
          color: Colors.teal[50],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      size: 16,
                      color: index < rating ? Colors.amber : Colors.grey[400],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  reviewText,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up, size: 18),
                      onPressed: () {
                        setState(() => likes++);
                      },
                    ),
                    Text('$likes'),
                    const SizedBox(width: 12),
                    IconButton(
                      icon: const Icon(Icons.thumb_down, size: 18),
                      onPressed: () {
                        setState(() => dislikes++);
                      },
                    ),
                    Text('$dislikes'),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
