import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/app_routes.dart';
import 'movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Kita tidak pakai AppBar, tapi pakai CustomScrollView
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: AppTheme.primaryGold),
          );
        }

        // Ambil data (dummy) dari controller
        final movie = controller.dummyMovie;

        return Stack(
          children: [
            // Konten utama yang bisa di-scroll
            CustomScrollView(
              slivers: [
                // 1. App Bar yang berisi gambar backdrop
                _buildSliverAppBar(movie),

                // 2. Konten di bawah gambar
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Judul Film
                          Text(
                            movie['title'].toString(),
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.lightText,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Info Rating, Durasi, Rilis
                          _buildMovieInfo(movie),

                          const SizedBox(height: 24),

                          // Genre Tags
                          _buildGenreTags(movie['genres'] as List<dynamic>),

                          const SizedBox(height: 24),

                          // Sinopsis
                          Text(
                            "Synopsis",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryGold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            movie['overview'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: AppTheme.lightText.withOpacity(0.8),
                              height: 1.6,
                            ),
                          ),

                          // Beri jarak agar tidak tertutup tombol
                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),

            // Tombol "Get Tickets" yang menempel di bawah
            _buildStickyButton(),

            // Tombol Back kustom
            _buildBackButton(),
          ],
        );
      }),
    );
  }

  // Widget untuk Sliver App Bar (Gambar Backdrop)
  Widget _buildSliverAppBar(RxMap<String, Object> movie) {
    return SliverAppBar(
      expandedHeight: 300.0, // Tinggi gambar saat full
      pinned: true, // App bar tetap terlihat saat scroll
      backgroundColor: AppTheme.darkBackground,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppTheme.primaryGold),
      automaticallyImplyLeading: false, // Kita pakai tombol back kustom
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Gambar Backdrop
            Image.network(movie['backdrop_path'].toString(), fit: BoxFit.cover),
            // Gradient hitam di bawah gambar
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppTheme.darkBackground.withOpacity(0.7),
                    AppTheme.darkBackground,
                  ],
                  stops: const [0.5, 0.9, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Info (Rating, Durasi, Tanggal)
  Widget _buildMovieInfo(RxMap<String, Object> movie) {
    return Row(
      children: [
        // Rating
        const Icon(Icons.star, color: AppTheme.primaryGold, size: 20),
        const SizedBox(width: 4),
        Text(
          movie['vote_average'].toString(),
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 16),

        // Durasi
        const Icon(Icons.timer_outlined, color: AppTheme.primaryGold, size: 20),
        const SizedBox(width: 4),
        Text(
          "${movie['runtime']} minutes",
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 16),

        // Tanggal Rilis
        const Icon(
          Icons.calendar_today_outlined,
          color: AppTheme.primaryGold,
          size: 18,
        ),
        const SizedBox(width: 4),
        Text(
          (movie['release_date'] as String).split('-')[0], // Ambil tahun saja
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // Widget untuk Genre
  Widget _buildGenreTags(List<dynamic> genres) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: genres.map((genre) {
        return Chip(
          label: Text(
            genre.toString(),
            style: GoogleFonts.poppins(
              color: AppTheme.darkText,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: AppTheme.primaryGold.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        );
      }).toList(),
    );
  }

  // Widget untuk Tombol "Get Tickets"
  Widget _buildStickyButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.darkBackground.withOpacity(0.0),
              AppTheme.darkBackground.withOpacity(0.9),
              AppTheme.darkBackground,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Get.toNamed(AppRoutes.booking, arguments: controller.movieId);
              Get.snackbar("Info", "Akan pindah ke halaman pemilihan kursi");
            },
            child: const Text("Get Tickets"),
          ),
        ),
      ),
    );
  }

  // Widget untuk tombol Back
  Widget _buildBackButton() {
    return Positioned(
      top: 40, // Sesuaikan dengan status bar
      left: 12,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.darkBackground.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppTheme.primaryGold),
            onPressed: () => Get.back(),
          ),
        ),
      ),
    );
  }
}
