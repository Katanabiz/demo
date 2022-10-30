part of global_widgets;

class EmptyListWidget extends StatelessWidget {
  final String message;
  final double height;
  final double width;
  final double customFontSize;
  final double imageScale;

  EmptyListWidget({
    this.message = 'this item',
    this.imageScale = 1,
    this.height = -1,
    this.width = -1,
    this.customFontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        child: SizedBox(
      width: width != -1 ? width : Get.width,
      height: this.height != -1 ? this.height : Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   height: 150,
          //   child: Transform.scale(
          //     alignment: Alignment.topCenter,
          //     scale: imageScale,
          //     child: Lottie.asset(
          //       'assets/lottie/empty_box.json',
          //     ),
          //   ),
          // ),
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
            width: width != -1 ? width : Get.width,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Center(
              child: Text(
                "No have".tr + " " + message.tr + ' ' + "at the moment".tr,
                textAlign: TextAlign.center,
                textScaleFactor: 1,
                style: Get.textTheme.bodyText1!.merge(TextStyle(
                  fontSize: customFontSize,
                  color: Colors.grey.withOpacity(0.5),
                )),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
