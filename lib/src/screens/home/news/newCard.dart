import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skulman/src/provider/newsProvider.dart';
import 'package:skulman/src/provider/selectedNews.dart';

class NewsCards extends StatefulWidget {
  @override
  _NewsCardsState createState() => _NewsCardsState();
}

class _NewsCardsState extends State<NewsCards> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NewsProvider newsProv = Provider.of<NewsProvider>(context);
    SelectedNewsProvider selectedNews =
        Provider.of<SelectedNewsProvider>(context);
    return ListView.builder(
      itemExtent: 120,
      itemCount: newsProv.getNews().length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectedNews.setSelectedNews(newsProv.getNews()[index]);
            Navigator.of(context).pushNamed("/selected/news");
          },
          child: Card(
              margin: EdgeInsets.all(10),
              elevation: 4,
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                trailing: Icon(FontAwesomeIcons.arrowRight),
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 120,
                    minHeight: 120,
                    maxWidth: 120,
                    maxHeight: 120,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: newsProv.getNews()[index].img,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.red,
                            BlendMode.colorBurn,
                          ),
                        ),
                      ),
                    ),
                    fit: BoxFit.fill,
                    placeholder: (context, url) => CircularProgressIndicator(),
                  ),
                ),
                title: Text(
                  newsProv.getNews()[index].title,
                  style: GoogleFonts.alice(fontSize: 15),
                ),
              )
              // Row(
              //   children: [
              //     ConstrainedBox(
              //       constraints: BoxConstraints(
              //         minWidth: 120,
              //         minHeight: 120,
              //         maxWidth: 120,
              //         maxHeight: 120,
              //       ),
              //       child: CachedNetworkImage(
              //         imageUrl: newsProv.getNews()[index].img,
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.all(10),
              //       child: Column(
              //         children: [
              //           Text(
              //             newsProv.getNews()[index].title,
              //             style: GoogleFonts.alice(fontSize: 15),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Icon(FontAwesomeIcons.forward)
              //   ],
              // ),
              ),
        );
        // return ListTile(

        //   title: Text("No"),
        //   leading: ConstrainedBox(
        //     constraints: BoxConstraints(
        //       minWidth: 90,
        //       minHeight: 90,
        //       maxWidth: 90,
        //       maxHeight: 90,
        //     ),
        //     child: CachedNetworkImage(
        //       imageUrl:
        //           "https://images-eu.ssl-images-amazon.com/images/G/02/gc/designs/livepreview/amzn_logo_squid_noto_printfold_v2016_uk-main._CB463270660_.png",
        //     ),
        //   ),
        //   trailing: Icon(Icons.forward),
        // );
      },
    );
  }
}
