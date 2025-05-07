import 'package:flutter/material.dart';

Widget custom_img(String? imageFile) {
  return Center(
    child: imageFile == null || imageFile.isEmpty
        ? Image.asset(
            "assets/images/empty.jpg",
            height: 80,
            fit: BoxFit.fill,
          )
        : Image.network(
            imageFile,
            height: 80,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(child: Icon(Icons.error));
            },
          ),
  );
}
