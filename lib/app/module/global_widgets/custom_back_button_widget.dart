part of global_widgets;

class CustomBackButtonWidget extends StatelessWidget {
  CustomBackButtonWidget({this.isItGrey = true});
  final bool isItGrey;
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      scaleMinValue: 2,
      onPressed: () {},
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            Get.back();
          },
          icon: Transform.translate(
            offset: Offset(0, 0),
            child: Icon(
              HelperMS.isAr() ? LineIcons.angleRight : LineIcons.angleLeft,
              color: Get.isDarkMode
                  ? Colors.white
                  : isItGrey
                      ? Colors.grey
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
