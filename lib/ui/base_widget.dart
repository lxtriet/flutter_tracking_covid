import 'package:flutter/material.dart';
import 'package:flutter_tracking_covid/helper/sizing_info.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInfo sizingInfo) builder;

  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, boxConstraints){
      var sizingInFo = SizingInfo(
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxConstraints.maxWidth, boxConstraints.maxHeight)
      );

      return builder(context, sizingInFo);
    });

  }
}
