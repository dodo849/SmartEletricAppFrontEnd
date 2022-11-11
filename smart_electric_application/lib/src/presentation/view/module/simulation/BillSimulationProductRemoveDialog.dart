import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_electric_application/src/presentation/view/atoms/CustomDialog.dart';
import 'package:smart_electric_application/src/presentation/viewmodel/BillSimulationViewModel.dart';

class BillSimulationProductRemoveDialog extends StatelessWidget {
  const BillSimulationProductRemoveDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: "삭제하시겠습니까?",
        content: "선택된 가전이 삭제됩니다",
        actionButtons: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: context.theme.colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "취소하기",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.onBackground),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await BillSimulationViewModel.to.removeBillSimulationProducts();
                    Navigator.of(context).pop();
                    await BillSimulationViewModel.to.getBillSimulationProducts();
                  },    
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.red[700]!.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "삭제하기",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ]);
  }
}
