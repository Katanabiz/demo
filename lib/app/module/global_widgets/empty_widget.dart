part of global_widgets;

class EmptyWidget extends StatelessWidget {
  final String message;
  final double height;
  final double iconSize;
  final double imageScale;
  final double fontSize;
  final bool isHorizontal;
  EmptyWidget({
    this.message = 'this item',
    this.height = -1,
    this.iconSize = -1,
    this.imageScale = 1,
    this.fontSize = -1,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        child: Container(
      width: Get.width,
      height: height == -1 ? (Get.height * .805) : height,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.5,
            ),
          ],
          border: Border.all(
              color: Get.theme.colorScheme.secondary.withOpacity(0.0),
              width: 1),
          borderRadius: new BorderRadius.all(const Radius.circular(0.0))),
      margin: EdgeInsets.only(left: 15, right: 15),
      child: isHorizontal
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  alignment: Alignment.center,
                  scale: imageScale,
                  child: SvgPicture.asset(
                    'assets/svg/cart.svg',
                    cacheColorFilter: true,
                    color: Get.theme.primaryColor,
                    height: Get.width * .2,
                    width: Get.width * .2,
                    semanticsLabel: 'cart',
                  ),
                ),
                SizedBox(width: Get.width * .05),
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 15,
                  ),
                  child: Text(
                    "No have".tr + "\n" + message.tr + " " + "at the moment".tr,
                    textAlign: TextAlign.center,
                    textScaleFactor: ScreenMS.textScaleFactor(),
                    style: Get.textTheme.bodyText1!.merge(TextStyle(
                      fontSize: fontSize == -1 ? 20 : fontSize,
                      color: Colors.grey.withOpacity(0.5),
                    )),
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  alignment: Alignment.center,
                  scale: imageScale,
                  child: SvgPicture.asset(
                    'assets/svg/cart.svg',
                    cacheColorFilter: true,
                    color: Get.theme.primaryColor,
                    height: Get.width * .2,
                    width: Get.width * .2,
                    semanticsLabel: 'cart',
                  ),
                ),
                SizedBox(height: Get.width * .15),
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 15,
                  ),
                  child: Text(
                    "No have".tr + " " + message.tr + " " + "at the moment".tr,
                    textAlign: TextAlign.center,
                    textScaleFactor: ScreenMS.textScaleFactor(),
                    style: Get.textTheme.bodyText1!.merge(TextStyle(
                      fontSize: fontSize == -1 ? 20 : fontSize,
                      color: Colors.grey.withOpacity(0.5),
                    )),
                  ),
                ),
              ],
            ),
    ));
  }
}
