import 'package:flutter/material.dart';

class BookDetailPage extends StatefulWidget {
  final String title;
  final String author;
  final String image;
  final String rating;

  const BookDetailPage({
    super.key,
    required this.title,
    required this.author,
    required this.image,
    required this.rating,
  });

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  bool _isRatingOpen = false;
  int _userRating = 0;
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.title, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Book Info
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(109, 204, 203, 0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 140,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(widget.author),
                            Row(
                              children: [
                                ...List.generate(
                                    4, (_) => const Icon(Icons.star, size: 16)),
                                const Icon(Icons.star_border, size: 16),
                                const SizedBox(width: 6),
                                Text(widget.rating),
                              ],
                            ),
                            const Text("Publish in 1830"),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isRatingOpen = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal[300],
                                shape: const StadiumBorder(),
                              ),
                              child: const Text("Mark as Read"),
                            ),
                            const SizedBox(height: 6),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal[200],
                                shape: const StadiumBorder(),
                              ),
                              child: const Text("Add to Wishlist"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Reviews
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Review",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView(
                    children: [
                      reviewItem(
                          "Lucas Bennett",
                          "A slow burn, but Julien’s ambition and inner struggle make it worth the journey.",
                          "lib/assets/avatars/avatar_4.png"),
                      reviewItem(
                          "Emma Johnson",
                          "Brilliantly layered. Politics, love, and pride woven into a compelling character study.",
                          "lib/assets/avatars/avatar_2.png"),
                      reviewItem(
                          "James Carter",
                          "Cynical and sharp. A fascinating look at hypocrisy and class in 19th-century France.",
                          "lib/assets/avatars/avatar_3.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Rating Bar
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            bottom: _isRatingOpen ? 0 : -400, // Panel yukarı kayacak
            left: 0,
            right: 0,
            child: Container(
              height: 370,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(149, 213, 210, 1.0),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                      onPressed: () {
                        setState(() => _isRatingOpen = false);
                      },
                    ),
                  ),
                  const Text("Rate this Book", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            _userRating = index + 1;
                          });
                        },
                        icon: Icon(
                          index < _userRating ? Icons.star : Icons.star_border,
                          color: Colors.black,
                        ),
                      );
                    }),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Write a comment (optional):", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: _commentController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write here...",
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      print("Rating: $_userRating");
                      print("Comment: ${_commentController.text}");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Mark as Read"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget reviewItem(String name, String review, String avatar) {
    int likes = 0;
    int dislikes = 0;

    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          elevation: 1,
          color: Colors.teal[50],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(avatar),
            ),
            title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                        (index) => const Icon(Icons.star, size: 12, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 5),
                Text("\"$review\""),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up, size: 18),
                      onPressed: () {
                        setState(() {
                          likes++;
                        });
                      },
                    ),
                    Text('$likes'),
                    const SizedBox(width: 12),
                    IconButton(
                      icon: Icon(Icons.thumb_down, size: 18),
                      onPressed: () {
                        setState(() {
                          dislikes++;
                        });
                      },
                    ),
                    Text('$dislikes'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
