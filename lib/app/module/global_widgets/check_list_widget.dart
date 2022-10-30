part of global_widgets;

class CheckListWidget extends StatelessWidget {
  final String message;
  final Color? bgColor;
  final double customFontSize;
  final double width;
  final double height;
  final double imageScale;
  final bool isItHorizontal;
  final bool isWhiteFont;
  final bool isEmpty;
  final Widget child;
  final EdgeInsetsGeometry margin;
  CheckListWidget({
    this.message = 'this item',
    this.bgColor,
    this.width = double.infinity,
    this.customFontSize = -1,
    this.imageScale = 1,
    this.height = 300,
    this.isEmpty = false,
    this.isWhiteFont = false,
    this.isItHorizontal = false,
    this.margin = const EdgeInsets.all(0),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: isEmpty
          ? isItHorizontal
              ? Container(
                  margin: margin,
                  width: width,
                  height: height == 300 ? Get.height : height,
                  decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: new BorderRadius.all(Radius.circular(7.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Transform.scale(
                      //   alignment: Alignment.center,
                      //   scale: imageScale,
                      //   child: Lottie.asset(
                      //     'assets/lottie/empty_box.json',
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

                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "No have".tr +
                              " " +
                              message.tr +
                              ' ' +
                              "at the moment".tr,
                          textAlign: TextAlign.center,
                          textScaleFactor: 1,
                          style: Get.textTheme.bodyText1!.merge(TextStyle(
                            fontSize:
                                customFontSize == -1 ? 20 : customFontSize,
                            color: isWhiteFont
                                ? Colors.white
                                : Colors.grey.withOpacity(0.5),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  margin: margin,
                  width: width,
                  height: height == 300 ? Get.height : height,
                  decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: new BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                          height: Get.width * .25,
                          width: Get.width * .25,
                          semanticsLabel: 'cart',
                        ),
                      ),
                      SizedBox(height: Get.width * .15),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "No have".tr +
                              " " +
                              message.tr +
                              ' ' +
                              "at the moment".tr,
                          textAlign: TextAlign.center,
                          textScaleFactor: 1,
                          style: Get.textTheme.bodyText1!.merge(TextStyle(
                            fontSize:
                                customFontSize == -1 ? 20 : customFontSize,
                            color: isWhiteFont
                                ? Colors.white
                                : Colors.grey.withOpacity(0.5),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
          : child,
    );
  }
}
