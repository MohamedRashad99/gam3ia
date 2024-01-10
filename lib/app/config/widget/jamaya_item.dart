import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamaya/app/models/jamaya.dart';
import 'package:jamaya/generated/assets.dart';
import 'package:intl/intl.dart';

import '../theme.dart';

class JamayaItem extends StatelessWidget {
  final JamayaModel item;
  final ValueChanged<JamayaModel> onTap;

  const JamayaItem({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(item);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          padding: EdgeInsetsDirectional.only(
            bottom: context.height * 0.022,
          ),
          // height: context.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(26)),
            color: AppColors.whiteColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0X40000000),
                offset: Offset(0, 1),
                blurRadius: 6,
              ),
            ],
          ),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Column(
                children: [
                  Container(
                    height: context.height * 0.154,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(26),
                        topEnd: Radius.circular(26),
                      ),
                      color: const Color(0XFFBABABA),
                      image: DecorationImage(
                        image: AssetImage(
                          Asset.images.png.money,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.0088,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: (context.height * 0.11) + 34,
                      end: 19,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            height: 1,
                            // color: AppColors.whiteColor,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 20,
                          decoration: BoxDecoration(
                            color: AppColors.goldColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Center(
                            child: Text(
                              item.receiveMoneyDates.length.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: (context.height * 0.05),
                      start: 19,
                      end: 19,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'من : ${DateFormat('yy/MM/dd').format(
                            item.dates.first.startDate,
                          )}',
                          style: context.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            // color: const Color(0xFF848181),
                            height: .7,
                          ),
                        ),
                        Text(
                          '\$ ${item.price}',
                          style: context.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColors.goldColor,
                            height: .7,
                          ),
                        ),
                        Text(
                          'الي : ${DateFormat('yy/MM/dd').format(
                            item.dates.last.startDate,
                          )}',
                          style: context.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            // color: const Color(0xFF848181),
                            height: .7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              PositionedDirectional(
                top: (context.height * 0.0993),
                start: 19,
                child: Container(
                  height: context.height * 0.11,
                  width: context.height * 0.11,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0XFFD9D9D9),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0X40000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: AppColors.whiteColor,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: context.height * 0.057,
                      width: context.height * 0.057,
                      child: Image.asset(
                        Asset.images.png.icon,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
