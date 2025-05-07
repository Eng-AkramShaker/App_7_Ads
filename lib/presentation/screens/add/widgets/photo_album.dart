import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class Photo_Album_Screen extends StatefulWidget {
  final List<AssetEntity> photos;
  final int maxImages;

  const Photo_Album_Screen({required this.photos, required this.maxImages});

  @override
  _Photo_Album_ScreenState createState() => _Photo_Album_ScreenState();
}

class _Photo_Album_ScreenState extends State<Photo_Album_Screen> {
  List<AssetEntity> _selectedImages = [];

  void _toggleSelection(AssetEntity photo) {
    setState(() {
      if (_selectedImages.contains(photo)) {
        _selectedImages.remove(photo);
      } else if (_selectedImages.length < widget.maxImages) {
        _selectedImages.add(photo);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر الصور (${_selectedImages.length}/${widget.maxImages})'),
        actions: [
          if (_selectedImages.isNotEmpty)
            TextButton(
              onPressed: _selectedImages.length <= widget.maxImages
                  ? () {
                      Navigator.pop(context, _selectedImages);
                    }
                  : null,
              child: Card(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'حفظ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: widget.photos.length,
        itemBuilder: (context, index) {
          final photo = widget.photos[index];
          final isSelected = _selectedImages.contains(photo);

          return FutureBuilder(
            future: photo.thumbnailDataWithSize(
              ThumbnailSize(200, 200),
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                return GestureDetector(
                  onTap: () => _toggleSelection(photo),
                  child: Stack(
                    children: [
                      Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      if (isSelected)
                        Positioned(
                          top: 5,
                          right: 5,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}
