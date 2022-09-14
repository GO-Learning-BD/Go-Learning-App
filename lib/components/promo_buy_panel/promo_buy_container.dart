import "package:app/app_config/resources.dart";
import "package:app/components/app_button.dart";
import "package:app/utils/typedefs.dart" show OnTapListener;
import "package:flutter/widgets.dart";

class PromoBuyContainer extends StatefulWidget {
  final double initialPrice;
  final double? finalPrice;
  final OnTapListener onApplyPromoTap;
  final OnTapListener onBuyCourseTap;
  final double? spaceBetweenItems;

  const PromoBuyContainer({
    Key? key,
    required this.initialPrice,
    required this.onApplyPromoTap,
    required this.onBuyCourseTap,
    this.finalPrice,
    this.spaceBetweenItems,
  }) : super(key: key);

  @override
  State<PromoBuyContainer> createState() => _PromoBuyContainerState();
}

class _PromoBuyContainerState extends State<PromoBuyContainer> {
  late bool discounted;

  @override
  void initState() {
    discounted = widget.finalPrice != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: AppButton(
            text: Text(Res.str.applyPromo),
            onTap: widget.onApplyPromoTap,
            backgroundColor: Res.color.buttonHollowBg,
            contentColor: Res.color.buttonHollowContent2,
            tintIconWithContentColor: false,
            padding: EdgeInsets.zero,
            borderRadius: Res.dimen.fullRoundedBorderRadiusValue,
          ),
        ),
        SizedBox(
          width: widget.spaceBetweenItems,
        ),
        Expanded(
          flex: 3,
          child: AppButton(
            text: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(Res.str.buyCourseAt),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${widget.initialPrice.toStringAsFixed(0)} ${Res.str.tkDot}",
                      style: TextStyle(
                        fontSize: discounted ? null : Res.dimen.fontSizeXl,
                        fontWeight: discounted ? null : FontWeight.w700,
                        color: discounted
                            ? Res.color.strikethroughPriceColor
                            : null,
                        decoration:
                            discounted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    if (discounted) ...<Widget>[
                      SizedBox(
                        width: Res.dimen.smallSpacingValue,
                      ),
                      Text(
                        "${widget.finalPrice!.toStringAsFixed(0)} ${Res.str.tkDot}",
                        style: TextStyle(
                          fontSize: Res.dimen.fontSizeXl,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            onTap: widget.onBuyCourseTap,
            padding: EdgeInsets.zero,
            borderRadius: Res.dimen.fullRoundedBorderRadiusValue,
          ),
        ),
      ],
    );
  }
}