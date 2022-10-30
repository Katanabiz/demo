part of global_widgets;

class CustomButtonWidget extends StatefulWidget {
  final Function onTap;
  final bool loading;
  final bool isThereRadius;
  final bool isItScaleTap;
  final bool isThereBoarder;
  final String title;
  final double width;
  final double height;
  final bool isFontSizeSmall;
  final BackgroundColor backgroundColor;
  final EdgeInsets margin;
  const CustomButtonWidget({
    required this.onTap,
    required this.title,
    this.height = 50,
    this.loading = false,
    this.isThereRadius = false,
    this.isItScaleTap = true,
    this.isThereBoarder = false,
    this.isFontSizeSmall = false,
    this.backgroundColor = BackgroundColor.primaryColor,
    this.margin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.width = double.infinity,
  });

  @override
  _CustomButtonWidgetWidgetState createState() =>
      _CustomButtonWidgetWidgetState();
}

class _CustomButtonWidgetWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return !widget.loading
        ? ScaleTap(
            scaleMinValue: widget.isItScaleTap ? 0.97 : 1,
            onPressed: () {},
            child: Container(
              height: widget.height,
              padding: EdgeInsets.zero,
              margin: widget.margin,
              width: widget.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: getBackgroundColor(widget.backgroundColor),
                  elevation: 1.5,
                  animationDuration: Duration(milliseconds: 0),
                  shape: widget.isThereBoarder
                      ? getBoarder(widget.backgroundColor)
                      : RoundedRectangleBorder(
                          side: BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(
                              widget.isThereRadius ? 5 : 0),
                        ),
                  padding: EdgeInsets.zero,
                ),
                child: widget.backgroundColor == BackgroundColor.alertRed
                    ? getDottedButtonType()
                    : getButtonContent(),
                onPressed: () {
                  widget.onTap();
                },
              ),
            ),
          )
        : Container(
            margin: widget.margin,
            width: widget.width,
            height: widget.height,
            decoration:
                BoxDecoration(color: Get.theme.primaryColor, boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 0.5),
                blurRadius: 0.5,
                spreadRadius: 0.5,
                color: Colors.black26,
              ),
            ]),
            child: Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ),
            ),
          );
  }

  dynamic getBoarder(BackgroundColor x) {
    switch (x) {
      case BackgroundColor.primaryColor:
      case BackgroundColor.alertRed:
        return RoundedRectangleBorder(
          side: BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(widget.isThereRadius ? 5 : 0),
        );

      case BackgroundColor.white:
        return RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Get.theme.primaryColor),
          borderRadius: BorderRadius.circular(widget.isThereRadius ? 5 : 0),
        );
      case BackgroundColor.black:
        return RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(widget.isThereRadius ? 5 : 0),
        );
      default:
        return RoundedRectangleBorder(
          side: BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(widget.isThereRadius ? 5 : 0),
        );
    }
  }

  Color? getBackgroundColor(BackgroundColor v) {
    switch (v) {
      case BackgroundColor.primaryColor:
        return Get.theme.primaryColor;

      case BackgroundColor.white:
      case BackgroundColor.black:
        return Colors.white;

      case BackgroundColor.alertRed:
        return Colors.white;
      case BackgroundColor.gray:
        return Colors.grey[300];

      default:
        return Get.theme.primaryColor;
    }
  }

  Color getFontColor(BackgroundColor v) {
    switch (v) {
      case BackgroundColor.primaryColor:
        return Colors.white;

      case BackgroundColor.white:
        return Get.theme.primaryColor;
      case BackgroundColor.black:
        return Colors.black;

      case BackgroundColor.alertRed:
        return Colors.red;

      default:
        return Colors.white;
    }
  }

  Widget getButtonContent() {
    return Container(
      width: widget.isFontSizeSmall ? widget.width - 60 : null,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Center(
        child: FittedBox(
          child: Text(widget.title + ' ',
              overflow: TextOverflow.visible,
              textScaleFactor: 1,
              maxLines: 1,
              softWrap: true,
              style: Get.textTheme.headline6!.merge(
                TextStyle(
                  color: getFontColor(widget.backgroundColor),
                ),
              )),
        ),
      ),
    );
  }

  Widget getDottedButtonType() {
    return DottedBorder(
      strokeCap: StrokeCap.butt,
      borderType: BorderType.RRect,
      radius: Radius.circular(0),
      padding: EdgeInsets.only(left: 10, right: 10, top: 1.5),
      color: widget.backgroundColor == BackgroundColor.alertRed
          ? Colors.red
          : Colors.black,
      strokeWidth: 1.1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: FittedBox(
            child: Text(widget.title + ' ',
                overflow: TextOverflow.visible,
                maxLines: 1,
                textScaleFactor: 1,
                softWrap: true,
                style: Get.textTheme.headline6!.merge(
                  TextStyle(
                    color: getFontColor(widget.backgroundColor),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

enum BackgroundColor {
  primaryColor,
  white,
  gray,
  black,
  alertRed,
}

enum ButtonType {
  iconLeft,
  iconRight,
  iconOnly,
  normal,
}
