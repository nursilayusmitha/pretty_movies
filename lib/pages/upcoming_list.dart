import 'package:flutter/material.dart';
import '../service/http_service.dart';
import '../models/movie.dart';
import 'movie_detail.dart'; // Import your MovieDetail screen here

class UpcomingList extends StatefulWidget {
  @override
  _UpcomingListState createState() => _UpcomingListState();
}

class _UpcomingListState extends State<UpcomingList> {
  late int moviesCount;
  late List<Movie> movies;
  late HttpService service;

  @override
  void initState() {
    super.initState();
    service = HttpService();
    initialize();
  }

  Future<void> initialize() async {
    movies = await service.getUpcomingMovies();
    setState(() {
      moviesCount = movies.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: movies.length,
        itemBuilder: (context, int position) {
          return GestureDetector(
            onTap: () {
              MaterialPageRoute route = MaterialPageRoute(
                builder: (_) => MovieDetail(movies[position]),
              );
              Navigator.push(context, route);
            },
            child: Card(
              color: Colors.purple[100], // Beige/Cream color
              elevation: 2.0,
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movies[position].posterPath}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movies[position].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Rating: ${movies[position].voteAverage.toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
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
