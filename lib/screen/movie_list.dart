import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_req/helpers/http.dart';
import 'package:http_req/models/movies.dart';
import 'package:http_req/screen/movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Results> movieList = [];
  late HttpService service;
  String imageUrl = "https://image.tmdb.org/t/p/w500";

  Future initialize() async {
    movieList = await service.getPopularMovies();
    setState(() {
      movieList = movieList;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Movies List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          var data = movieList[index];
          return InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.network(imageUrl + data.posterPath),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          data.title,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          softWrap: false,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data.overview,
                          maxLines: 4,
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            ),
                            const SizedBox(width: 5),
                            Text(data.voteAverage.toString())
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => MovieDetails(detail: data))));
            },
          );
        },
      ),
    );
  }
}
