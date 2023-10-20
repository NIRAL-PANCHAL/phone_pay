import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phone_pay/Screens/full_screen_video.dart';
import 'package:phone_pay/Screens/vnjdvdjn.dart';
import 'package:video_player/video_player.dart';

class VideoPlay {
  String? imagesurls;
  String? Videourls;

  VideoPlay({this.Videourls, this.imagesurls});
}

List<VideoPlay> videoList = [
  VideoPlay(
      imagesurls: "assets/images1.png",
      Videourls:
          "https://rr1---sn-gwpa-nu8e.googlevideo.com/videoplayback?expire=1696855990&ei=VqMjZaHkDNvdlu8PmNWA2Ac&ip=191.96.67.173&id=o-AG-HzziwO6yrSMJMuwSl6M7jReucIF0swar-3BaiZtmB&itag=247&source=youtube&requiressl=yes&pcm2=no&spc=UWF9fx0AmAwOizJNHJViHRme3LQM9kw&vprv=1&svpuc=1&mime=video%2Fwebm&gir=yes&clen=27143768&dur=330.541&lmt=1695955868754671&keepalive=yes&fexp=24007246,24350018&beids=24350018&c=ANDROID&txp=453C434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cpcm2%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AGM4YrMwRAIgZjcLlVlqOP4BxyI0Skl7UZiM_mB6eUifBJeo5VFoe5oCIFq2O6CW2Tf1w8igcJzBeeRjnv9sP5ZbuPSukSXpjZDx&redirect_counter=1&rm=sn-q4felk76&req_id=8a173a39343ca3ee&cms_redirect=yes&ipbypass=yes&mh=CL&mip=2405:201:2023:bcab:6c56:93a6:de8c:128c&mm=31&mn=sn-gwpa-nu8e&ms=au&mt=1696835106&mv=m&mvi=1&pl=44&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AK1ks_kwRgIhAL7PIg_vyvWiIOJvYdbFE3jjqS1OgYMBJc5I2GacxymKAiEAtax_ISfn4BZy07Xh6GgD7i-D9eT6cMfAe_KEQmoPgnI%3D"),
  VideoPlay(
      imagesurls: "assets/images_2.jpg",
      Videourls:
          "https://rr7---sn-gwpa-5hqs.googlevideo.com/videoplayback?expire=1696521615&ei=L4keZcmjFuiSsfIP3-aUyAo&ip=184.170.242.18&id=o-AIdVkeiVQDOgQ5Jh-PYuBimCrOUusc9QV-5NP_txjGSk&itag=137&source=youtube&requiressl=yes&spc=UWF9f2vQSnnO5kccU4CqV1SORRraq_Y&vprv=1&svpuc=1&mime=video%2Fmp4&gir=yes&clen=9443269&dur=41.416&lmt=1692164437115344&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=553C434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgbxcBcG3-nV2-bZtDgeYItg6awYmNKqQ1BTQr0d01c84CIApvN54wc2ymIhS_Pah8AA5ox4dM99IHyD8hHSzNBz4n&redirect_counter=1&rm=sn-o09s77l&req_id=6e664c1948a1a3ee&cms_redirect=yes&ipbypass=yes&mh=M5&mip=2405:201:2023:bcab:b505:85b3:bbcd:e2b9&mm=31&mn=sn-gwpa-5hqs&ms=au&mt=1696499601&mv=m&mvi=7&pcm2cms=yes&pl=46&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AG3C_xAwRgIhANDNFSjtgEuHthyRsnArmQtt1cwy5BjOpWx2QyLt608aAiEAoEtV-AXNu_ye7r8nvY6lAnBa8T_lv20yJ6avYzCR9N0%3D"),
  VideoPlay(
      imagesurls: "assets/images3.png",
      Videourls:
          "https://rr1---sn-npoe7nds.googlevideo.com/videoplayback?expire=1696521672&ei=aIkeZYfvIvWUsfIPx9GgyAs&ip=191.96.37.118&id=o-AOkZE6QI_N16HEx_vpl58HaHhDMHdAuxmspYIebLWtIa&itag=137&source=youtube&requiressl=yes&spc=UWF9f0Go3rgtnFfcCr5l2gJmCl_XAAI&vprv=1&svpuc=1&mime=video%2Fmp4&gir=yes&clen=20095013&dur=141.140&lmt=1687826388581488&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=5535434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRQIgYc30sWXBaRX3hT8Ka3YvN6BX-ph9hzu7x-cXGroGcwoCIQCwCQXYyat4FF-13zX71UOb-u_F8zF5pMzsotdXyhkbig%3D%3D&redirect_counter=1&cm2rm=sn-n4vlk7s&req_id=c9c6af97bc6ca3ee&cms_redirect=yes&mh=Lk&mip=2405:201:2023:bcab:b505:85b3:bbcd:e2b9&mm=34&mn=sn-npoe7nds&ms=ltu&mt=1696499572&mv=m&mvi=1&pl=46&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgLmTjQskCo52X768YHjCi5dMwIMdY1HZlIk_pyoAS5gMCICscGDoI95nkdA8eAEdwEvYUhTJXIRUCTnxM6BxBRSxK"),
  VideoPlay(
      imagesurls: "assets/images_4.jpg",
      Videourls:
          "https://rr1---sn-npoe7nds.googlevideo.com/videoplayback?expire=1696521672&ei=aIkeZYfvIvWUsfIPx9GgyAs&ip=191.96.37.118&id=o-AOkZE6QI_N16HEx_vpl58HaHhDMHdAuxmspYIebLWtIa&itag=137&source=youtube&requiressl=yes&spc=UWF9f0Go3rgtnFfcCr5l2gJmCl_XAAI&vprv=1&svpuc=1&mime=video%2Fmp4&gir=yes&clen=20095013&dur=141.140&lmt=1687826388581488&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=5535434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRQIgYc30sWXBaRX3hT8Ka3YvN6BX-ph9hzu7x-cXGroGcwoCIQCwCQXYyat4FF-13zX71UOb-u_F8zF5pMzsotdXyhkbig%3D%3D&redirect_counter=1&cm2rm=sn-n4vlk7s&req_id=c9c6af97bc6ca3ee&cms_redirect=yes&mh=Lk&mip=2405:201:2023:bcab:b505:85b3:bbcd:e2b9&mm=34&mn=sn-npoe7nds&ms=ltu&mt=1696499572&mv=m&mvi=1&pl=46&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgLmTjQskCo52X768YHjCi5dMwIMdY1HZlIk_pyoAS5gMCICscGDoI95nkdA8eAEdwEvYUhTJXIRUCTnxM6BxBRSxK"),
  VideoPlay(
      imagesurls: "assets/images_5.jpg",
      Videourls:
          "https://rr1---sn-npoe7nds.googlevideo.com/videoplayback?expire=1696521672&ei=aIkeZYfvIvWUsfIPx9GgyAs&ip=191.96.37.118&id=o-AOkZE6QI_N16HEx_vpl58HaHhDMHdAuxmspYIebLWtIa&itag=137&source=youtube&requiressl=yes&spc=UWF9f0Go3rgtnFfcCr5l2gJmCl_XAAI&vprv=1&svpuc=1&mime=video%2Fmp4&gir=yes&clen=20095013&dur=141.140&lmt=1687826388581488&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=5535434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRQIgYc30sWXBaRX3hT8Ka3YvN6BX-ph9hzu7x-cXGroGcwoCIQCwCQXYyat4FF-13zX71UOb-u_F8zF5pMzsotdXyhkbig%3D%3D&redirect_counter=1&cm2rm=sn-n4vlk7s&req_id=c9c6af97bc6ca3ee&cms_redirect=yes&mh=Lk&mip=2405:201:2023:bcab:b505:85b3:bbcd:e2b9&mm=34&mn=sn-npoe7nds&ms=ltu&mt=1696499572&mv=m&mvi=1&pl=46&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgLmTjQskCo52X768YHjCi5dMwIMdY1HZlIk_pyoAS5gMCICscGDoI95nkdA8eAEdwEvYUhTJXIRUCTnxM6BxBRSxK"),
  VideoPlay(
      imagesurls: "assets/images_6.jpg",
      Videourls:
          "https://rr1---sn-npoe7nds.googlevideo.com/videoplayback?expire=1696521672&ei=aIkeZYfvIvWUsfIPx9GgyAs&ip=191.96.37.118&id=o-AOkZE6QI_N16HEx_vpl58HaHhDMHdAuxmspYIebLWtIa&itag=137&source=youtube&requiressl=yes&spc=UWF9f0Go3rgtnFfcCr5l2gJmCl_XAAI&vprv=1&svpuc=1&mime=video%2Fmp4&gir=yes&clen=20095013&dur=141.140&lmt=1687826388581488&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=5535434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRQIgYc30sWXBaRX3hT8Ka3YvN6BX-ph9hzu7x-cXGroGcwoCIQCwCQXYyat4FF-13zX71UOb-u_F8zF5pMzsotdXyhkbig%3D%3D&redirect_counter=1&cm2rm=sn-n4vlk7s&req_id=c9c6af97bc6ca3ee&cms_redirect=yes&mh=Lk&mip=2405:201:2023:bcab:b505:85b3:bbcd:e2b9&mm=34&mn=sn-npoe7nds&ms=ltu&mt=1696499572&mv=m&mvi=1&pl=46&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgLmTjQskCo52X768YHjCi5dMwIMdY1HZlIk_pyoAS5gMCICscGDoI95nkdA8eAEdwEvYUhTJXIRUCTnxM6BxBRSxK"),
];

class NetFlixscreen extends StatefulWidget {
  const NetFlixscreen({Key? key}) : super(key: key);

  @override
  State<NetFlixscreen> createState() => _NetFlixscreenState();
}

class _NetFlixscreenState extends State<NetFlixscreen> {
  int _currentIndex = 0;
  late AnimationController _controller;

  int _currentIndex_ = 0;
  PageController _pageController = PageController();
  late VideoPlayerController _videoController;
  bool isVideoPlaying = false;

  void _toggleVideoPlayback(int index) {
    setState(() {
      if (isVideoPlaying) {
        _videoController.pause();
        Image.asset(
          videoList[index].imagesurls.toString(),
          fit: BoxFit.cover,
        );
      } else {
        _videoController.play();
        _initializeVideoController(index);
      }
      isVideoPlaying = !isVideoPlaying;
    });
  }

  List _iomages = [
    "assets/images1.png",
    "assets/images_2.jpg",
    "assets/images3.png",
    "assets/images_4.jpg",
    "assets/images_5.jpg",
    "assets/images_6.jpg",
  ];
  List _imageUrls = [
    'assets/Group 2.png',
    'assets/Group 2.png',
    'assets/Group 2.png',
    'assets/Group 2.png',
  ];

  void _initializeVideoController(int index) {
    _videoController =
        VideoPlayerController.network(videoList[index].Videourls!)
          ..initialize().then((_) {
            setState(() {
              _videoController.play();
            });
          });
  }

  void initState() {
    super.initState();

    _initializeVideoController(_currentIndex);
    // Initialize the video controller
  }

  @override
  void dispose() {
    // Ensure you dispose of the video controller to free up resources
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xff1A1A1A),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePagesss()));
          },
          child: Container(
              margin: const EdgeInsets.all(18),
              child: Image.asset("assets/menu_list [#1527].png", height: 10)),
        ),
        centerTitle: true,
        title: Image.asset("assets/580b57fcd9996e24bc43c529.png",
            width: 100, height: 40, fit: BoxFit.cover),
        actions: [
          Container(
              margin: const EdgeInsets.all(9),
              child: Image.asset("assets/Ellipse 6.png"))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: _imageUrls.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex_ = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoScreen(
                      videoUrl:
                      'https://rr3---sn-un57snee.googlevideo.com/videoplayback?expire=1696427536&ei=sBkdZfH4H4Wy7OsPtOin2Ac&ip=122.146.193.82&id=o-ALN55SX1raO2U5m-788xY3wV3-il0mXn_0rXssO491AA&itag=247&source=youtube&requiressl=yes&spc=UWF9f5pTzLRkaD-pZOArOx6zcrmh_Gc&vprv=1&svpuc=1&mime=video%2Fwebm&gir=yes&clen=394916651&dur=8572.099&lmt=1694233972371670&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=5535434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRQIgIRLHRO4a6JGGb_rr4lAS4iXvXz__0mHKvJaFELmxcsACIQCxM4UvNRMJnD8C4X5Nzr49R-ePNQWAnuB0fOQbfVIvwA%3D%3D&redirect_counter=1&rm=sn-45gx5nuvox-u2xe67l&req_id=78d2c0db4d6fa3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=fa&mm=29&mn=sn-un57snee&ms=rdu&mt=1696414423&mv=m&mvi=3&pl=22&lsparams=ipbypass,mh,mm,mn,ms,mv,mvi,pl&lsig=AK1ks_kwQwIfcOxMWFZQapF606ulOxc9mLtAKMUvJlQ74hE6blfqrgIgQ7Pq3tVyEr3grV7deCOs9W-b4QiG9hyDqBIFPHkep4I%3D',
                    ),));
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Image.asset(_imageUrls[index])),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      "CONTINUE",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "  WATCHING",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: ListView.builder(
                    itemCount: videoList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _toggleVideoPlayback(index);
                          });
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: const EdgeInsets.only(right: 10),
                              width: MediaQuery.of(context).size.width * 0.33,
                              height: MediaQuery.of(context).size.height * 0.20,
                              child: (_currentIndex != index ||
                                      isVideoPlaying == false)
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      width: MediaQuery.of(context).size.width *
                                          0.33,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              videoList[index]
                                                  .imagesurls
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(20),
                                      ))
                                  : !_videoController.value.isInitialized
                                      ? Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.33,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.20,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.33,
                                                  child: Image.asset(
                                                    videoList[index]
                                                        .imagesurls
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 4.0, sigmaY: 4.0),
                                                  child: Container(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                                const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.red,
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          clipBehavior: Clip.none,
                                          child: VideoPlayer(_videoController)),
                            ),
                            Positioned(
                              bottom: 15,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 4.0, sigmaY: 4.0),
                                  child: Container(
                                    width: 130,
                                    height: 40,
                                    color: Colors.black.withOpacity(0.3),
                                    child: Row(
                                      children: const [
                                        Text(
                                          "S1:E1",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.play_circle_outline,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Play",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
