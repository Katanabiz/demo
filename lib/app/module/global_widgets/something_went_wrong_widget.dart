part of global_widgets;

class SomethingWentWrongWidget extends StatelessWidget {
  const SomethingWentWrongWidget({this.message = ''});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87.withOpacity(0.02),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.all(15),
            child: Icon(
              LineIcons.exclamationTriangle,
              color: Colors.black,
              size: 35,
            ),
          ),
          Spacer(),
          CustomButtonWidget(
            isItScaleTap: true,
            isThereRadius: false,
            height: 30,
            width: Get.width * .3,
            backgroundColor: BackgroundColor.alertRed,
            onTap: () {
              UiMS.showDataDialog(
                  crossAxisWidgetsAlignment: CrossAxisAlignment.center,
                  widgetList: [
                    SizedBox(height: 10),
                    Text(
                      'Error Details',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Container(height: 1, color: Get.theme.primaryColor),
                    SizedBox(height: 10),
                    Text(message),
                  ],
                  mainAxisButtonsAlignment: MainAxisAlignment.spaceBetween,
                  buttonList: [
                    CustomButtonWidget(
                        isItScaleTap: true,
                        isThereRadius: false,
                        width: Get.width * .33,
                        backgroundColor: BackgroundColor.primaryColor,
                        onTap: () {
                          Get.back();
                        },
                        title: 'Report'.tr),
                    CustomButtonWidget(
                        isItScaleTap: true,
                        isThereRadius: false,
                        width: Get.width * .33,
                        backgroundColor: BackgroundColor.gray,
                        onTap: () {
                          Get.back();
                        },
                        title: 'Back'.tr),
                  ]);
            },
            title: 'Error Details'.tr,
          ),
          SizedBox(height: 45),
        ],
      ),
    );
  }
}
