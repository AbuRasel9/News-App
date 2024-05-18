import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/provider/api_call_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<ApiCallProvider>().setNewsChannelHeadLine();
  }

  //date formate
  final dateFormate = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        //appbar title
        title: Text(
          "News",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 24),
        ),

        //appbar category button
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "images/category_icon.png",
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: screenSize.height * .55,

              //consumer for get api call data
              child: Consumer<ApiCallProvider>(
                builder: (context, data, child) {
                  if (data.newChannelHeadline == null) {
                    return const SpinKitCircle(
                      color: Colors.blue,
                      size: 60,
                    );
                  }
                  //list view builder for show news headline
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.newChannelHeadline?.articles.length ?? 0,
                      itemBuilder: (context, index) {
                        final item = data.newChannelHeadline?.articles[index];

                        //convert datatime
                        DateTime dateTime =
                            DateTime.parse(item?.publishedAt.toString() ?? "");
                        return SizedBox(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              //image
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 10),
                                height: screenSize.height * 0.6,
                                // width: screenSize.width * .9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    width: screenSize.width * .9,
                                    fit: BoxFit.cover,
                                    imageUrl: item?.urlToImage ?? "",
                                    placeholder: (context, url) =>
                                        const SpinKitFadingCircle(
                                      color: Colors.amber,
                                      size: 50,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  // padding: ,
                                  alignment: Alignment.center,
                                  height: screenSize.height * .20,
                                  width: screenSize.width * 0.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //headline title
                                      Expanded(
                                        child: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          item?.title ?? '',
                                          style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Spacer(),
                                      //author and time
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data.newChannelHeadline!
                                                .articles[index].source.name
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            dateFormate.format(dateTime),
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
              ))
        ],
      ),
    );
  }
}
