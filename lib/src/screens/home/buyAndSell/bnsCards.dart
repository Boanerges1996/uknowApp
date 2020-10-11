import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skulman/src/provider/bns.dart';
import 'package:skulman/src/provider/selectedBnc.dart';
import 'package:skulman/src/screens/home/buyAndSell/searchMenu.dart';

class BNSCard extends StatefulWidget {
  @override
  _BNSCardState createState() => _BNSCardState();
}

class _BNSCardState extends State<BNSCard> {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf;
    BNSProvider bnsprovider = Provider.of<BNSProvider>(context);
    SelectedBNS selbns = Provider.of<SelectedBNS>(context, listen: false);
    return Column(
      children: [
        SearchBNS(),
        Expanded(
          child: ListView.builder(
            itemCount: bnsprovider.getBns().length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selbns.setBns(bnsprovider.getBns()[index]);
                  Navigator.of(context).pushNamed("/selected/bns");
                },
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              FontAwesomeIcons.heart,
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CachedNetworkImage(
                        imageUrl: bnsprovider.getBns()[index].img,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "₹ " + bnsprovider.getBns()[index].price,
                              style: GoogleFonts.alata(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              bnsprovider.getBns()[index].description,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "today",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
