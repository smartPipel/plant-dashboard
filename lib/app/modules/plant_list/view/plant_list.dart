// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:plant_dashboard/app/data/constants.dart';
import 'package:plant_dashboard/app/data/models/side_detail_preview_item.dart';
import 'package:plant_dashboard/app/modules/plant_list/components/side_detail_preview.dart';
import 'package:plant_dashboard/app/modules/plant_list/provider/plant_list_provider.dart';
import 'package:plant_dashboard/app/modules/plant_list/provider/side_detail_preview_provider.dart';
import 'package:provider/provider.dart';

class PlantListPage extends StatefulWidget {
  const PlantListPage({Key? key}) : super(key: key);

  @override
  _PlantListPageState createState() => _PlantListPageState();
}

class _PlantListPageState extends State<PlantListPage> {
  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: true);

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<PlantListProvider>(context, listen: false).getPlantData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Consumer<PlantListProvider>(
              builder: (context, snapshot, _) {
                if (snapshot.plantData != null)
                  return snapshot.isLoading() == true
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount: snapshot.getDataLength() ?? 0,
                          itemBuilder: (_, i) {
                            // context.watch<PlantListProvider>();
                            return Builder(builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  final _item =
                                      Provider.of<SideDetailPreviewProvider>(
                                          context,
                                          listen: false);

                                  if (_item.items.isNotEmpty) {
                                    _item.removePreviewItems();
                                  } else if (_item.items.isEmpty) {
                                    _item.addPreviewItems(
                                      snapshot.getId(i),
                                      snapshot.getPlantName(i),
                                      snapshot.getDescription(i),
                                      '${Constans.baseUrl}/' +
                                          snapshot.getImage(i),
                                      snapshot.getLatinName(i),
                                      snapshot.getPlantType(i),
                                    );
                                    print(_item.items.length);
                                  }
                                  _item.addPreviewItems(
                                    snapshot.getId(i),
                                    snapshot.getPlantName(i),
                                    snapshot.getDescription(i),
                                    '${Constans.baseUrl}/' +
                                        snapshot.getImage(i),
                                    snapshot.getLatinName(i),
                                    snapshot.getPlantType(i),
                                  );
                                },
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  '${Constans.baseUrl}/' +
                                                      snapshot.getImage(i),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.getPlantName(i),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0),
                                                  child: Text(
                                                    snapshot.getDescription(i),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        );
                else
                  return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
        const Expanded(flex: 1, child: SideDetailPreview())
      ],
    );
  }
}
