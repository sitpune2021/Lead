import 'package:bizbooster/screens/Lead_Details_onboarding/model/restaurant_onboarding_model';
import 'package:bizbooster/services/auth_services.dart';
import 'package:bizbooster/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProductVideoWidget extends StatefulWidget {
  final String id;
  const ProductVideoWidget({super.key, required this.id});

  @override
  _ProductVideoWidgetState createState() => _ProductVideoWidgetState();
}

class _ProductVideoWidgetState extends State<ProductVideoWidget> {
  late Future<List<ServiceLeadProduct>> _serviceLeadProductsFuture;

  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  // @override
  // void initState() {
  //   super.initState();
  //   _serviceLeadProductsFuture = AuthService()
  //       .fetchServiceLeadProduct(widget.id); // Initialize data fetch

  //   _controller = VideoPlayerController.network(
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //   );

  //   // Initialize the controller and store the Future for checking completion.
  //   _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
  //     setState(() {}); // Update the UI when the video is initialized
  //   });
  // }

  @override
  void initState() {
    super.initState();

    // Fetch the list of ServiceLeadProducts
    _serviceLeadProductsFuture =
        AuthService().fetchServiceLeadProduct(widget.id);

    // Initialize the video player with the video URL from the first product in the list
    _serviceLeadProductsFuture.then((products) {
      if (products.isNotEmpty &&
          products[0].videofilepath != null &&
          products[0].videofilename != null) {
        String videoUrl =
            "$leaddetailproductdetalis${products[0].videofilename}";
        // 'http://43.205.22.150:5000/serviceleadproduct/1731305587472_man.mp4';

        print("videoUrl$videoUrl");

        // Initialize VideoPlayerController with the URL from the API
        _controller = VideoPlayerController.network(videoUrl);

        // Store the Future for initializing the video player
        _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
          setState(() {}); // Update the UI after initialization
        });
      }
    }).catchError((error) {
      print("Failed to fetch product data: $error");
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(
          left: 8.0, right: 8.0, bottom: 8), // Adds outer margin to the Card
      elevation: 2, // Controls the shadow depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Matches image corner radius
      ),
      child: Container(
        // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Product Video",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            // If the video is initialized, display it.
                            return AspectRatio(
                              aspectRatio: _controller!.value.aspectRatio,
                              child: VideoPlayer(_controller!),
                            );
                          } else if (snapshot.hasError) {
                            // If there's an error, display an error message.
                            return const Center(
                              child: Text(
                                'Error loading video',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          } else {
                            // If the video is still loading, show a progress indicator.
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return IconButton(
                          iconSize: 50,
                          icon: Icon(
                            _controller!.value.isPlaying
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _controller!.value.isPlaying
                                  ? _controller!.pause()
                                  : _controller!.play();
                            });
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
