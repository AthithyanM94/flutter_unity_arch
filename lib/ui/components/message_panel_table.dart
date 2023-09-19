import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lume_ox_app/data/model/workflow_info.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Item {
  Item({
    required this.data1,
    required this.data2,
    required this.data3,
    required this.data4,
  });

  String data1;
  String data2;
  String data3;
  String data4;
}

class MessageTablePanel extends StatefulWidget {
  const MessageTablePanel(
      {Key? key, required this.valueProp, required this.sendCallToUnity})
      : super(key: key);
  final ValueProp valueProp;
  final Function sendCallToUnity;

  @override
  State<MessageTablePanel> createState() => _MessageTablePanelState();
}

class _MessageTablePanelState extends State<MessageTablePanel> {
  late double _currentSliderValue;
  List<Item> _items = [];

  @override
  void initState() {
    _currentSliderValue = 20;
    setState(() {
      _items = _generateItems();
    });
    super.initState();
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print("Dispose called on message table panel");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Material(
        type: MaterialType.transparency,
        child: Stack(children: <Widget>[
          Container(
              height: heightOfScreen * 0.27,
              margin: EdgeInsets.only(
                  bottom: context.resources.dimension.bigMargin),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white54,
                        offset: Offset(
                            0, context.resources.dimension.edgeDefaultMargin),
                        blurRadius:
                            context.resources.dimension.edgeDefaultMargin),
                  ]),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Table(
                    border: TableBorder.symmetric(
                      inside: BorderSide(
                          color: Colors.blue,
                          width:
                              context.resources.dimension.tableSeparatorSize),
                      outside: BorderSide(
                          color: Colors.blue,
                          width:
                              context.resources.dimension.tableSeparatorSize),
                    ),
                    defaultVerticalAlignment:
                        TableCellVerticalAlignment.baseline,
                    defaultColumnWidth: IntrinsicColumnWidth(),
                    columnWidths: <int, TableColumnWidth>{
                      0: FixedColumnWidth(widthOfScreen * 0.15),
                      1: FixedColumnWidth(widthOfScreen * 0.15),
                      2: FixedColumnWidth(widthOfScreen * 0.15),
                      3: FixedColumnWidth(widthOfScreen * 0.15),
                    },
                    // textDirection: TextDirection.rtl,
                    textBaseline: TextBaseline.alphabetic,
                    // Pass this argument when using [TableCellVerticalAlignment.fill]
                    children:
                        _items.map((item) => _buildTableRow(item)).toList(),
                  ))),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              iconSize: 20,
              icon: const Icon(
                Icons.close,
              ),
              onPressed: () {
                widget.sendCallToUnity();
              },
            ),
          ),
          Container(
            height: 30,
          )
        ]));
  }

  List<Item> _generateItems() {
    return List.generate(2, (int index) {
      if (index == 0) {
        return Item(
          data1: "Old Brand",
          data2: 'Our Brand',
          data3: "Value",
          data4: 'Gain',
        );
      }
      return Item(
          data1: widget.valueProp.currentBrand!,
          data2: widget.valueProp.proposedBrand!,
          data3: widget.valueProp.values!,
          data4: widget.valueProp!.gains!);
    });
  }

  TableRow _buildTableRow(Item item) {
    var heightOfRow = item.data4.length == 4 ?
    MediaQuery.of(context).size.height * 0.06 :
    MediaQuery.of(context).size.height * 0.12;
    TextStyle styleForRow = item.data4.length == 4
        ? context.resources.style.subHeadingTextStyle
        : context.resources.style.messagePanelButtonSupportTextStyle;
    return TableRow(
        key: ValueKey(item.data1),
        decoration: BoxDecoration(
          color: context.resources.color.colorAppbarTitle,
        ),
        children: [
          TableCell(

              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                alignment: Alignment.center,
                height:heightOfRow,
                padding: EdgeInsets.all(
                    context.resources.dimension.edgeDefaultMargin),
                child: Text(item.data1.toString(),
                    textAlign: TextAlign.center, style: styleForRow),
              )),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              alignment: Alignment.center,
              height: heightOfRow,
              padding:
                  EdgeInsets.all(context.resources.dimension.edgeDefaultMargin),
              child: Text(item.data2,
                  textAlign: TextAlign.center, style: styleForRow),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              alignment: Alignment.center,
              height: heightOfRow,
              padding: const EdgeInsets.all(5),
              child: Text(item.data3.toString(),
                  textAlign: TextAlign.center, style: styleForRow),
            ),
          ),
          TableCell(
            child: Container(
              alignment: Alignment.center,
              height: heightOfRow,
              padding: const EdgeInsets.all(5),
              child: Text(
                textAlign: TextAlign.center,
                item.data4,
                style: styleForRow,
              ),
            ),
          ),
        ]);
  }
}
