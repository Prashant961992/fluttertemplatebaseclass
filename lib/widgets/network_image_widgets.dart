import 'package:cached_network_image/cached_network_image.dart';
import '../index.dart';

class PPNetworkImage extends StatelessWidget {
  final String imageUrl;
  const PPNetworkImage({Key key,this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => CircularProgressIndicator(),
      // progressIndicatorBuilder: (context, url, downloadProgress) => 
      //           CircularProgressIndicator(value: downloadProgress.progress),
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }
}

class PPNetworkImageProvider extends StatelessWidget {
  final String imageUrl;
  const PPNetworkImageProvider({Key key,this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: CachedNetworkImageProvider(imageUrl),
    );
  }
}

// CachedNetworkImage(
//   imageUrl: "http://via.placeholder.com/200x150",
//   imageBuilder: (context, imageProvider) => Container(
//     decoration: BoxDecoration(
//       image: DecorationImage(
//           image: imageProvider,
//           fit: BoxFit.cover,
//           colorFilter:
//               ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
//     ),
//   ),
//   placeholder: (context, url) => CircularProgressIndicator(),
//   errorWidget: (context, url, error) => Icon(Icons.error),
// ),