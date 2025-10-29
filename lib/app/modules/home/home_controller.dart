import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observabel untuk data film
  final nowPlayingMovies = <dynamic>[].obs; // Nanti ganti <MovieModel>
  final upcomingMovies = <dynamic>[].obs;
  final carouselPosters = <String>[].obs;

  // Observabel untuk genre
  final genres = <String>['Action', 'Drama', 'Sci-Fi', 'Comedy', 'Horror'].obs;
  final selectedGenre = 'Action'.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovieData(); // Panggil API saat controller siap
  }

  void fetchMovieData() async {
    isLoading.value = true;

    // --- LOGIKA API TMDB NANTI DI SINI ---
    // nowPlayingMovies.value = await tmdbApi.getNowPlaying();
    // upcomingMovies.value = await tmdbApi.getUpcoming();
    // carouselPosters.value = nowPlayingMovies.map((m) => m.backdropPath).toList();

    // Simulasi data untuk UI
    await Future.delayed(const Duration(seconds: 1));
    carouselPosters.value = [
      'https://image.tmdb.org/t/p/w1280/8pjWz2lt2xRcLgKCFwL6E0aKsc.jpg', // Contoh: Dune 2
      'https://image.tmdb.org/t/p/w1280/qrGtVFBI1hoSJma8hdE3h4dy13s.jpg', // Contoh: Furiosa
      'https://image.tmdb.org/t/p/w1280/pRmF6VBsRnvWCb6tXWYnZa4JRock.jpg', // Contoh: Kingdom of the Planet of the Apes
    ];

    // Dummy data untuk poster list (gunakan URL poster yang valid dari TMDB)
    // Ganti ini dengan data asli nanti
    final dummyPoster =
        'https://image.tmdb.org/t/p/w500/vWzJDjLPoHQOikSSYHCfHRrINhm.jpg';
    nowPlayingMovies.value = List.filled(5, {'poster_path': dummyPoster});
    upcomingMovies.value = List.filled(5, {'poster_path': dummyPoster});

    isLoading.value = false;
  }

  void changeGenre(String genre) {
    selectedGenre.value = genre;
    // Nanti panggil ulang API dengan filter genre
  }
}
