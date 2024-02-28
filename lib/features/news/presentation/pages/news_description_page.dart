import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/features/news/domain/entities/news_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDescriptionPage extends StatefulWidget {
  const NewsDescriptionPage({super.key});

  static const String newsDescriptionPage = 'newsDescriptionPage';

  @override
  State<NewsDescriptionPage> createState() => _NewsDescriptionPageState();
}

class _NewsDescriptionPageState extends State<NewsDescriptionPage> {
  late ArticlesEntity articlesEntity;

  @override
  void didChangeDependencies() {
    articlesEntity =
        ModalRoute.of(context)!.settings.arguments as ArticlesEntity;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: articlesEntity.urlToImage,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.asset(
                      'images/placeholder.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                articlesEntity.description,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
