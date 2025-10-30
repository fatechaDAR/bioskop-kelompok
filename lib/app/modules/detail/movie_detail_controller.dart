import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  // Observabel untuk menampung data film
  // final movie = Rx<MovieModel?>(null); // Nanti ganti dengan model asli
  final isLoading = false.obs;

  // Variabel untuk menampung ID film yang dikirim
  dynamic movieId;

  // Data dummy untuk UI
  final dummyMovie = {
    'id': 1,
    'title': 'Dune: Part Two',
    'backdrop_path':
        'https://image.tmdb.org/t/p/w1280/8pjWz2lt2xRcLgKCFwL6E0aKsc.jpg',
    'poster_path':
        'https://image.tmdb.org/t/p/w500/vWzJDjLPoHQOikSSYHCfHRrINhm.jpg',
    'overview':
        'Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a warpath of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.',
    'release_date': '2024-02-27',
    'vote_average': 8.3,
    'runtime': 166, // dalam menit
    'genres': ['Sci-Fi', 'Adventure', 'Action'],
  }.obs;

  @override
  void onInit() {
    super.onInit();
    // Ambil movie ID dari argumen yang dikirim
    movieId = Get.arguments;
    fetchMovieDetail();
  }

  void fetchMovieDetail() async {
    isLoading.value = true;

    // --- LOGIKA API TMDB NANTI DI SINI ---
    // try {
    //   final result = await tmdbApi.getMovieDetail(movieId);
    //   movie.value = result;
    // } catch (e) {
    //   Get.snackbar("Error", "Gagal mengambil detail film.");
    // } finally {
    //   isLoading.value = false;
    // }

    // Simulasi loading
    await Future.delayed(const Duration(milliseconds: 500));
    // Kita gunakan data dummy untuk sekarang
    // movie.value = MovieModel.fromJson(dummyMovie); // Jika sudah ada model

    isLoading.value = false;
  }
}
