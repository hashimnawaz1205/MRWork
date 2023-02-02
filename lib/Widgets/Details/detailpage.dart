import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrworker/AppState/database.dart';
import 'package:mrworker/AppState/models/searchModel.dart';
import 'package:mrworker/AppState/providers/search_provider.dart';
import 'package:mrworker/Widgets/Details/DetailPage2.dart';
import 'package:mrworker/Widgets/LoadingWidgets/verticalListLoading.dart';
import 'package:provider/provider.dart';

class detailpage extends StatefulWidget {
  final String curl;
  const detailpage({Key? key, required this.curl}) : super(key: key);
  @override
  _detailpageState createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  @override
  void initState() {
    var db = context.read<DataBase>();
    final String city;
    city = db.initial_city.toString();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchProvider>(context, listen: false)
          .getSearch(city, widget.curl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEBECED),
        foregroundColor: Colors.black,
        title: (widget.curl != '')
            ? Text(widget.curl.toString())
            : const Text('Top Workers'),
        centerTitle: true,
      ),
      body: Consumer<SearchProvider>(
        builder: ((context, value, child) {
          return value.isLoading
              ? VerticalListLoading()
              : ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.searchModel.length,
                  itemBuilder: (BuildContext context, index) {
                    return SearchCard(map: value.searchModel[index]);
                  });
        }),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key, required this.map}) : super(key: key);
  final map;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailPage2(map: map);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(map.image.toString()),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          map.name.toString(),
                          style: GoogleFonts.ubuntu(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        map.city.toString(),
                        style: GoogleFonts.ubuntu(
                            fontSize: 12.0, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Text(
                              map.area.toString(),
                              maxLines: 1,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 12.0, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  map.speciality.toString(),
                  style: GoogleFonts.ubuntu(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
