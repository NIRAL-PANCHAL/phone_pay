import 'package:flutter/material.dart';
import 'package:phone_pay/Screens/full_screen_video.dart';

class AllMovies {
  String? MovieName;
  String? MovieUrl;
  String? MovieThumbnail;

  AllMovies({this.MovieName, this.MovieThumbnail, this.MovieUrl});
}

List<AllMovies> allmoviesList = [
  AllMovies(
      MovieName: "K.G.F-Chapter-1",
      MovieThumbnail:
          "https://resizing.flixster.com/2HQ-93kgaknH58Rw0iR3vA-p-dM=/fit-in/1152x864/v2/https://flxt.tmsimg.com/assets/p16345736_v_v9_ad.jpg",
      MovieUrl:
          "https://rr3---sn-4wg7ln7k.googlevideo.com/videoplayback?expire=1696868241&ei=MdMjZbm0HPegmLAP09aJ8A8&ip=102.140.192.178&id=o-AM51XGHopUoKY55wh5M-2W96PpRlLYBQrxpqcdj3T19W&itag=248&source=youtube&requiressl=yes&spc=UWF9f9M-rjlStdwyqDgba1XpmQjZ58k&vprv=1&svpuc=1&mime=video%2Fwebm&gir=yes&clen=1414768347&dur=8472.640&lmt=1650717078921135&keepalive=yes&fexp=24007246,24350018&beids=24350018&c=ANDROID&txp=4535434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AGM4YrMwRgIhAOg8fJqjQo-OKYUL8gDIfmmo-gTN2SToeLVqQSx-1UIBAiEArvGejy1Fdm0G7wEz2ChLyfFozsYCjqxlwcuK1RxZvUI%3D&redirect_counter=1&rm=sn-f5o5ojip-ocvz7d&req_id=eec4ec897f0ba3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=Yb&mm=29&mn=sn-4wg7ln7k&ms=rdu&mt=1696850721&mv=m&mvi=3&pl=24&lsparams=ipbypass,mh,mm,mn,ms,mv,mvi,pl&lsig=AK1ks_kwRQIhAI6vK4ytwCh156t0bw-y73jGugdZcRYA_iiTYDGECxB_AiBaubgnLMjauVwNMAtXgc2VqeoO6eJGfzbmYiK7yw7QdQ%3D%3D"),
  AllMovies(
      MovieName: "Krack- Ravi Teja",
      MovieThumbnail:
          "https://www.filmiforest.com/img/poster_image/krack_1066842979.jpg",
      MovieUrl:
          "https://rr1---sn-gwpa-5hqe7.googlevideo.com/videoplayback?expire=1696441589&ei=lVAdZdXYCdmo_9EPjLKu4A8&ip=161.0.28.115&id=o-AJlv9cDe8giT0vqutRc_400Kw2W5G8VjF_7PSXp_SbGW&itag=137&source=youtube&requiressl=yes&spc=UWF9f1oNeQ_WnerKcihLDQSKjGRLMOQ&vprv=1&svpuc=1&mime=video%2Fmp4&gir=yes&clen=1454167972&dur=7644.960&lmt=1665508197127436&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=5532434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgW4D3gG1O9IXAZrwMwPn6wvd94zBpOeaXTLifHd4tps0CIH-kegqpo83eNd8d_oLuq6Usca4wALN3kXZzMow4EPDl&redirect_counter=1&rm=sn-ab5eer7s&req_id=77c662bb82a0a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=cO&mip=2405:201:2023:bcab:f933:cdda:5f84:e169&mm=31&mn=sn-gwpa-5hqe7&ms=au&mt=1696422600&mv=m&mvi=1&pl=46&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIgWMT0FjHcZCM3-PTGORoFkvMf95OVfkjCGH9cuamRhNQCIQCOdYY1siptOyrSYebUztsWPrRo6aXxb5RgJ_XVNEsumQ%3D%3D"),
  AllMovies(
      MovieName: "Shehazada-Kartik Blaster",
      MovieThumbnail:
          "https://cdn.bollywoodmdb.com/fit-in/movies/largethumb/2022/shehzada/shehzada-poster-2.jpg",
      MovieUrl:
          "https://rr1---sn-gwpa-5hqe7.googlevideo.com/videoplayback?expire=1696521951&ei=f4oeZeDoGsC_sfIP6MGVoAE&ip=184.170.252.213&id=o-AFdeeUvKNgcIK9ANl51amfihr8dMdMtBqBicfmLD-avm&itag=137&source=youtube&requiressl=yes&spc=UWF9f44XaRLXkqyYI4offIfwKfu_y9I&vprv=1&svpuc=1&mime=video%2Fmp4&gir=yes&clen=1454167972&dur=7644.960&lmt=1665508197127436&keepalive=yes&fexp=24007246,24350018&beids=24350018&c=ANDROID&txp=5532434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgPNFNNPAJojDXKskyQWUPN5f_XpVF0TvgFc7ScCGJw6YCIBQe2Kz9L3V7A_ZNuldap-eEWs6G_lh0Pu1rCvMdvQTM&redirect_counter=1&rm=sn-a5mee67e&req_id=9f38c2450f27a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=cO&mip=2405:201:2023:bcab:b505:85b3:bbcd:e2b9&mm=31&mn=sn-gwpa-5hqe7&ms=au&mt=1696500075&mv=m&mvi=1&pl=46&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRgIhAKF4W9gTLUXfuhH7jon23cBVwBY0IAbsBSBtdyUf3_qiAiEApx9ypASSylbBxBNNA_tEKK5fqeoN3BqyAZ-BH4B6lfI%3D"),
  AllMovies(
      MovieName: "Bhool Bhulaiyaa (2007)",
      MovieThumbnail:
          "https://m.media-amazon.com/images/M/MV5BNmViNWRkMjEtMTVlOC00NDQ5LWE1MTYtYzVlOTVmZTYxMTViXkEyXkFqcGdeQXVyODk2ODI3MTU@._V1_.jpg",
      MovieUrl:
          "https://rr6---sn-gwpa-5hqel.googlevideo.com/videoplayback?expire=1696440101&ei=xUodZb7lFrKh_9EPm9ecEA&ip=191.96.150.59&id=o-ADK0RoVcnG0pjktM7jfrHO1SvHXVCEUP--7DZBkmF0qm&itag=271&source=youtube&requiressl=yes&spc=UWF9f_FQGaDKWu7lrU9LElIXzv99XB4&vprv=1&svpuc=1&mime=video%2Fwebm&gir=yes&clen=4261659983&dur=8707.720&lmt=1668249067358727&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=431A224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgVUYBt7AqaPeIsBOOPLAry6y27LFaDE5IPNb0w9kNcUQCIGNJZWtis6nj5rDQ_WiW993mSZFyGdEWaCj87xDKyTqh&redirect_counter=1&rm=sn-p5qeel7s&req_id=6d2e1fb34248a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=_y&mip=2405:201:2023:bcab:f933:cdda:5f84:e169&mm=31&mn=sn-gwpa-5hqel&ms=au&mt=1696421688&mv=u&mvi=6&pl=46&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIhAOr2MnwjosDe3GTDd9n08Q27RdIDt4WxVbKMbghiOMvOAiA1_kHU26ON9xG5Pj-LRVGLKlCyBRXH2p9SLrqAuPhINA%3D%3D"),
  AllMovies(
      MovieName: "Jesal Toral Jadeja",
      MovieThumbnail:
          "https://resizing.flixster.com/2HQ-93kgaknH58Rw0iR3vA-p-dM=/fit-in/1152x864/v2/https://flxt.tmsimg.com/assets/p16345736_v_v9_ad.jpg",
      MovieUrl:
          "https://rr5---sn-5hne6nsd.googlevideo.com/videoplayback?expire=1696533799&ei=x7geZcCzIYPLir4PpaKg6AI&ip=181.214.166.62&id=o-ANmBlCOpHFPXhPoWkEdYFIJpV4EIP3Rv7qXsDIZiXKKF&itag=247&source=youtube&requiressl=yes&spc=UWF9f9xwPLubWE1T3l1EOJL7SUMVYJ0&vprv=1&svpuc=1&mime=video%2Fwebm&gir=yes&clen=1227584707&dur=7443.480&lmt=1540598718986633&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=5533432&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRgIhAIcrNuB3Uu0Q3vwQCcE39ZgE1bKlqYe9A-iTADuIT8KlAiEA7xvDsuGJ1KnyjCmyi6Md-vPR4Q8GXNUSQOBadxXgG2I%3D&redirect_counter=1&rm=sn-vgqelr7z&req_id=6822505bf4eda3ee&cms_redirect=yes&ipbypass=yes&mh=yw&mip=2001:bc8:5080:8013::1&mm=31&mn=sn-5hne6nsd&ms=au&mt=1696511855&mv=m&mvi=5&pl=38&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIgc-V7G5z1nA9e-mFpBrvWlfxpFtnOnSDHfdUaqZ9sPOoCIQCsulDaf5pvFlQdYZ9RBep93eODuPiaBfJ7jDwLeRS0dg%3D%3D"),
  AllMovies(
      MovieName: "K.G.F-Chapter-1",
      MovieThumbnail:
          "https://resizing.flixster.com/2HQ-93kgaknH58Rw0iR3vA-p-dM=/fit-in/1152x864/v2/https://flxt.tmsimg.com/assets/p16345736_v_v9_ad.jpg",
      MovieUrl:
          "https://rr6---sn-gwpa-5hqel.googlevideo.com/videoplayback?expire=1696440101&ei=xUodZb7lFrKh_9EPm9ecEA&ip=191.96.150.59&id=o-ADK0RoVcnG0pjktM7jfrHO1SvHXVCEUP--7DZBkmF0qm&itag=271&source=youtube&requiressl=yes&spc=UWF9f_FQGaDKWu7lrU9LElIXzv99XB4&vprv=1&svpuc=1&mime=video%2Fwebm&gir=yes&clen=4261659983&dur=8707.720&lmt=1668249067358727&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=431A224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgVUYBt7AqaPeIsBOOPLAry6y27LFaDE5IPNb0w9kNcUQCIGNJZWtis6nj5rDQ_WiW993mSZFyGdEWaCj87xDKyTqh&redirect_counter=1&rm=sn-p5qeel7s&req_id=6d2e1fb34248a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=_y&mip=2405:201:2023:bcab:f933:cdda:5f84:e169&mm=31&mn=sn-gwpa-5hqel&ms=au&mt=1696421688&mv=u&mvi=6&pl=46&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIhAOr2MnwjosDe3GTDd9n08Q27RdIDt4WxVbKMbghiOMvOAiA1_kHU26ON9xG5Pj-LRVGLKlCyBRXH2p9SLrqAuPhINA%3D%3D"),
  AllMovies(
      MovieName: "K.G.F-Chapter-1",
      MovieThumbnail:
          "https://resizing.flixster.com/2HQ-93kgaknH58Rw0iR3vA-p-dM=/fit-in/1152x864/v2/https://flxt.tmsimg.com/assets/p16345736_v_v9_ad.jpg",
      MovieUrl:
          "https://rr6---sn-gwpa-5hqel.googlevideo.com/videoplayback?expire=1696440101&ei=xUodZb7lFrKh_9EPm9ecEA&ip=191.96.150.59&id=o-ADK0RoVcnG0pjktM7jfrHO1SvHXVCEUP--7DZBkmF0qm&itag=271&source=youtube&requiressl=yes&spc=UWF9f_FQGaDKWu7lrU9LElIXzv99XB4&vprv=1&svpuc=1&mime=video%2Fwebm&gir=yes&clen=4261659983&dur=8707.720&lmt=1668249067358727&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=431A224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgVUYBt7AqaPeIsBOOPLAry6y27LFaDE5IPNb0w9kNcUQCIGNJZWtis6nj5rDQ_WiW993mSZFyGdEWaCj87xDKyTqh&redirect_counter=1&rm=sn-p5qeel7s&req_id=6d2e1fb34248a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=_y&mip=2405:201:2023:bcab:f933:cdda:5f84:e169&mm=31&mn=sn-gwpa-5hqel&ms=au&mt=1696421688&mv=u&mvi=6&pl=46&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIhAOr2MnwjosDe3GTDd9n08Q27RdIDt4WxVbKMbghiOMvOAiA1_kHU26ON9xG5Pj-LRVGLKlCyBRXH2p9SLrqAuPhINA%3D%3D"),
  AllMovies(
      MovieName: "K.G.F-Chapter-1",
      MovieThumbnail:
          "https://resizing.flixster.com/2HQ-93kgaknH58Rw0iR3vA-p-dM=/fit-in/1152x864/v2/https://flxt.tmsimg.com/assets/p16345736_v_v9_ad.jpg",
      MovieUrl:
          "https://rr6---sn-gwpa-5hqel.googlevideo.com/videoplayback?expire=1696440101&ei=xUodZb7lFrKh_9EPm9ecEA&ip=191.96.150.59&id=o-ADK0RoVcnG0pjktM7jfrHO1SvHXVCEUP--7DZBkmF0qm&itag=271&source=youtube&requiressl=yes&spc=UWF9f_FQGaDKWu7lrU9LElIXzv99XB4&vprv=1&svpuc=1&mime=video%2Fwebm&gir=yes&clen=4261659983&dur=8707.720&lmt=1668249067358727&keepalive=yes&fexp=24007246,24350017&beids=24350017&c=ANDROID&txp=431A224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgVUYBt7AqaPeIsBOOPLAry6y27LFaDE5IPNb0w9kNcUQCIGNJZWtis6nj5rDQ_WiW993mSZFyGdEWaCj87xDKyTqh&redirect_counter=1&rm=sn-p5qeel7s&req_id=6d2e1fb34248a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=_y&mip=2405:201:2023:bcab:f933:cdda:5f84:e169&mm=31&mn=sn-gwpa-5hqel&ms=au&mt=1696421688&mv=u&mvi=6&pl=46&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIhAOr2MnwjosDe3GTDd9n08Q27RdIDt4WxVbKMbghiOMvOAiA1_kHU26ON9xG5Pj-LRVGLKlCyBRXH2p9SLrqAuPhINA%3D%3D"),
];

class AllMovieScreen extends StatefulWidget {
  const AllMovieScreen({Key? key}) : super(key: key);

  @override
  State<AllMovieScreen> createState() => _AllMovieScreenState();
}

class _AllMovieScreenState extends State<AllMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Search",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.search,
                color: Colors.red,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: allmoviesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>VideoScreen(
                          videoUrl: allmoviesList[index].MovieUrl.toString(),
                        )));
                      },
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: Image.network(
                            allmoviesList[index].MovieThumbnail.toString(),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          width: 110,
                          child: Text(
                            allmoviesList[index].MovieName.toString(),
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
