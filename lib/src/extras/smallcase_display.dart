import '../brightness_toggle.dart';
import 'package:wealthaccrue/apis/smallcase_gateway.dart';
import 'package:flutter/material.dart';
import '/models/smallcase_model.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import '/src/extensions.dart';
import 'package:adaptive_components/adaptive_components.dart';

class SmallcaseScreen extends StatefulWidget {
  SmallcaseScreen({Key? key}) : super(key: key);

  @override
  State<SmallcaseScreen> createState() => _SmallcaseScreenState();
}

class _SmallcaseScreenState extends State<SmallcaseScreen> {
  final smallcaseApi = SmallCaseApi();
  late Future<dynamic> model;

  @override
  void initState() {
    super.initState();
    model = smallcaseApi.getAllSmallcases();
  }

  @override
  Widget build(BuildContext context) {
    // print(model);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [BrightnessToggle()],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: model,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: modelFromJson(snapshot.data)
                                .data!
                                .smallcases!
                                .length,
                            itemBuilder: (context, index) {
                              SmallcaseModel model =
                                  modelFromJson(snapshot.data);
                              return Column(
                                children: [
                                  AdaptiveContainer(
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          leading: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            child: FadeInImage(
                                              image: const AssetImage(
                                                'images/smallcase-logo.png',
                                              ),
                                              placeholder: const AssetImage(
                                                'images/smallcase-logo.png',
                                              ),
                                              imageErrorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                    'images/smallcase-logo.png',
                                                    fit: BoxFit.fitWidth);
                                              },
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          title: Text(
                                            model.data!.smallcases![index]
                                                .info!.name
                                                .toString(),
                                            style: context.titleLarge,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            });
                      } else {
                        return const CircularProgressIndicator.adaptive();
                      }
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
