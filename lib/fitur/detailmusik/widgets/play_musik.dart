import 'package:flutter/material.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/fitur/models/musik_model2.dart';
import 'package:musickuy_app/fitur/detailmusik/controller/play_controller.dart';

class PlayCard extends StatelessWidget {
  const PlayCard({
    Key? key,
    required this.musikModel,
    required this.playController,
  }) : super(key: key);

  final MusikModel2 musikModel;
  final PlayController playController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        children: [
          // Back Button
           const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: whiteColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),

          const SizedBox(height: 50),

          // Gambar Musik
          Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(musikModel.musikImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          const SizedBox(height: 35),

          // Judul Musik
          Text(
            musikModel.judul,
            style: ConstantTextStyle.stylePoppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: whiteColor,
            ),
          ),

          const SizedBox(height: 8),

          // Penyanyi
          Text(
            musikModel.penyanyi,
            style: ConstantTextStyle.stylePoppins(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 12),

          // Line Durasi
          // Line Durasi
// Line Durasi
Container(
  height: 3,
  color: tealColor,
  margin: EdgeInsets.symmetric(horizontal: 35),
  child: Stack(
    children: [
      Positioned(
        left: 0,
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: whiteColor,
          ),
        ),
      ),
    ],
  ),
),

const SizedBox(height: 12),

Container(
  margin: EdgeInsets.symmetric(horizontal: 35),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '0:00', // Detik awal
        style: ConstantTextStyle.stylePoppins(
          fontSize: 12,
          color: whiteColor,
        ),
      ),
      Text(
        musikModel.durasi.toString(), // Detik akhir
        style: ConstantTextStyle.stylePoppins(
          fontSize: 12,
          color: whiteColor,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 12),

// Kontrol Musik (Play, Forward, Backward, Shuffle, Repeat)
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    IconButton(
      icon: Icon(
        Icons.shuffle,
        size: 35,
        color: Colors.white, // Warna ikon diatur menjadi putih
      ),
      onPressed: () {
        // Aksi saat tombol di tekan
      },
    ),
    IconButton(
      icon: Icon(
        Icons.skip_previous,
        size: 35,
        color: Colors.white,
      ),
      onPressed: () {
        // Aksi saat tombol di tekan
      },
    ),
    IconButton(
      icon: Icon(
        Icons.play_circle_filled,
        size: 75,
        color: Colors.white,
      ),
      onPressed: () {
        // Aksi saat tombol di tekan
      },
    ),
    IconButton(
      icon: Icon(
        Icons.skip_next,
        size: 35,
        color: Colors.white,
      ),
      onPressed: () {
        // Aksi saat tombol di tekan
      },
    ),
    IconButton(
      icon: Icon(
        Icons.repeat,
        size: 35,
        color: Colors.white,
      ),
      onPressed: () {
        // Aksi saat tombol di tekan
      },
    ),
  ],
)





        ],
      ),
    );
  }
}
