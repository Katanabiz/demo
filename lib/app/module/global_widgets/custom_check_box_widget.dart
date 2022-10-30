part of global_widgets;

class CustomCheckBoxWidget extends StatelessWidget {
  const CustomCheckBoxWidget(
      {required this.onTap, required this.checkBoxState});
  final Function onTap;
  final bool checkBoxState;
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      scaleMinValue: 1.25,
      onPressed: () {},
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            onTap();
          },
          child: Container(
            margin: EdgeInsets.all(10),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              border: Border.all(width: 2.5, color: UiMS.parseColor('#CBCBCB')),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Center(
              child: Container(
                width: 10,
                height: 10,
                color: checkBoxState
                    ? Get.theme.primaryColor
                    : UiMS.parseColor('#CBCBCB'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
