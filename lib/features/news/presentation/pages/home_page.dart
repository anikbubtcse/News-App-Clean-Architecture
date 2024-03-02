import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app_clean_architecture/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app_clean_architecture/features/news/presentation/pages/news_description_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String myHomePage = 'myHomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> buttonName = [
    "All News",
    "Breaking News",
    "Popular News",
    "Sports News"
  ];

  int currentIndex = 0;

  @override
  void initState() {
    context.read<NewsBloc>().add(AllNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purpleAccent.shade400,
          title: Text(
            "News 24 Online",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
          )),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 55,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: buttonName.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index != currentIndex
                                  ? Colors.grey.shade400
                                  : Colors.purpleAccent.shade400,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            setState(() {
                              currentIndex = index;
                            });
                            if (index == 0) {
                              context.read<NewsBloc>().add(AllNewsEvent());
                            }

                            if (index == 1) {
                              context.read<NewsBloc>().add(BreakingNewsEvent());
                            }

                            if (index == 2) {
                              context.read<NewsBloc>().add(PopularNewsEvent());
                            }

                            if (index == 3) {
                              context.read<NewsBloc>().add(SportsNewsEvent());
                            }
                          },
                          child: Text(
                            buttonName[index],
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<NewsBloc, NewsState>(listener: (context, state) {
              if (state is NewsLoading) {
                context.loaderOverlay.show();
              }

              if (state is NewsLoaded) {
                context.loaderOverlay.hide();
              }
            }, builder: (context, state) {
              if (state is NewsLoading) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade400,
                          child: Row(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: double.infinity,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      height: 30,
                                      width: double.infinity,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              if (state is NewsLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.newsEntity.articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                NewsDescriptionPage.newsDescriptionPage,
                                arguments: state.newsEntity.articles[index]);
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: state
                                      .newsEntity.articles[index].urlToImage,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'images/placeholder.png',
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.newsEntity.articles[index].title,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      "Author: ${state.newsEntity.articles[index].author}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              if (state is NewsError) {
                return Center(
                    child: Text(
                  state.message,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ));
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
