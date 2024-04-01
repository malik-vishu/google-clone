import 'package:flutter/material.dart';
import 'package:google_clone/api/service.dart';
import 'package:google_clone/theme/color.dart';
import 'package:google_clone/widgets/result_bottom.dart';
import 'package:google_clone/widgets/result_head.dart';
import 'package:google_clone/widgets/result_tabs.dart';
import 'package:google_clone/widgets/results_widget.dart';
import 'package:google_clone/widgets/shimmer_widget.dart';

class ResultScreen extends StatefulWidget {
  final String start;
  final String query;
  final String api;
  const ResultScreen(
      {super.key, required this.start, required this.query, required this.api});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Title(
      color: primaryColor,
      //Title on tab will change accordingly
      title: widget.query,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResultHead(),
            const ResultTabs(),
            Divider(
              thickness: 0.3,
              height: 0,
              color: Colors.grey.shade400,
            ),
            FutureBuilder<Map<String, dynamic>>(
                future: ApiService().fetchData(
                    context: context,
                    KEY: widget.api,
                    queryTerm: widget.query,
                    start: widget.start),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // showing the time it took to fetch results
                          Container(
                            padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150, top: 12),
                            child: Text(
                              "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF70757a),
                              ),
                            ),
                          ),
                          //Result Screen List
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?['items'].length,
                            itemBuilder: (context, index) {

                              //Each result tile 
                              return ResultsWidget(
                                linkToGo: snapshot.data?['items'][index]
                                    ['link'],
                                text: snapshot.data?['items'][index]['title'],
                                showlink: snapshot.data?['items'][index]
                                    ['formattedUrl'],
                                description: snapshot.data?['items'][index]
                                    ['snippet'],
                              );
                            },
                          ),

                          //Footer
                          const ResultBottom()
                        ]);
                  } else {
                    //When loading it will show shimmer
                    return const ShimmerWidget();
                  }
                }),
          ],
        )),
      ),
    );
  }
}
