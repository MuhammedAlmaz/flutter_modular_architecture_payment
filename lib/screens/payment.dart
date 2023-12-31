import 'package:flutter/material.dart';
import 'package:payment/bloc/add_payment.dart';
import 'package:payment/models/add_payment.dart';
import 'package:shell/components/button.dart';
import 'package:shell/components/container.dart';
import 'package:shell/components/input.dart';

class PaymentsScreen extends StatelessWidget {
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();

  PaymentsScreen({Key? key}) : super(key: key);

  void _onAddClick() {
    addPaymentBloc.call(
      callObject: AddPaymentBM(
        price: int.tryParse(price.value.text) ?? 0,
        description: description.value.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      title: "Payment Team Project",
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Price"),
            AppInput(controller: price),
            Text("Description"),
            AppInput(controller: description),
            Container(
              alignment: Alignment.center,
              child: AppButton(onPressed: _onAddClick, title: "Add Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
