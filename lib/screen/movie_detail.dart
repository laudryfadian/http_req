import 'package:flutter/material.dart';
import 'package:http_req/models/movies.dart';

class MovieDetails extends StatelessWidget {
  final Results detail;
  const MovieDetails({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://image.tmdb.org/t/p/w500";

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Movie Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrl + detail.posterPath))),
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              const SizedBox(height: 10),
              Text(
                detail.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rilis",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    detail.releaseDate,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popularity",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    detail.popularity.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(detail.overview)
            ],
          ),
        ),
      ),
    );
  }
}
