import 'package:flutter/material.dart';
import 'package:plant_dashboard/app/data/constants.dart';
import 'package:plant_dashboard/app/modules/plant_list/provider/side_detail_preview_provider.dart';
import 'package:plant_dashboard/app/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class SideDetailPreview extends StatefulWidget {
  const SideDetailPreview({Key? key}) : super(key: key);

  @override
  State<SideDetailPreview> createState() => _SideDetailPreviewState();
}

class _SideDetailPreviewState extends State<SideDetailPreview> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<SideDetailPreviewProvider>(context, listen: false)
          .getItemsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final snapshot =
    //     Provider.of<SideDetailPreviewProvider>(context, listen: false);
    return Consumer<SideDetailPreviewProvider>(builder: (context, snapshot, _) {
      return Container(
        child: snapshot.getItemsList.isEmpty
            ? const Center(
                child: Text('Choose data for detail'),
              )
            : ListView.builder(
                itemCount: snapshot.getItemLenght() ?? 0,
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCard(
                          height: Constans.defaultHeight(context) * .2,
                          backgroundImageUrl: snapshot.getImage(i),
                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(15),
                          //   child: Image.network(),
                          // ),
                        ),
                        CustomCard(
                          height: 40,
                          child: Text(
                            snapshot.getId(i),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: Constans.defaultFontFamily),
                          ),
                        ),
                        CustomCard(
                          height: 40,
                          child: Text(
                            snapshot.getPlantName(i),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: Constans.defaultFontFamily),
                          ),
                        ),
                        CustomCard(
                          height: 40,
                          child: Text(
                            snapshot.getLatinName(i),
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                                fontFamily: Constans.defaultFontFamily),
                          ),
                        ),
                        CustomCard(
                          height: 40,
                          child: Text(
                            snapshot.getPlantType(i),
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: Constans.defaultFontFamily),
                          ),
                        ),
                        CustomCard(
                          height: double.maxFinite,
                          child: Text(
                            snapshot.getDescription(i),
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: Constans.defaultFontFamily),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      );
    });
  }
}
