import 'package:flutter/material.dart';
import 'package:payment/models/add_payment.dart';
import 'package:shell/constants/http_client_request_types.dart';
import 'package:shell/helpers/app.dart';
import 'package:shell/helpers/http_client.dart';
import 'package:shell/helpers/event_bus/main.dart';
import 'package:shell/repositories/bloc.dart';

class AddPaymentBloc extends AppBlocRepository<AddPaymentBM, Null> {
  @override
  Future process(String lastRequestUniqueId) async {
    await AppHttpClient().call(
      type: AppHttpClientRequestType.post,
      url: "/transfer",
      data: requestObject!.toJson(),
    );
    EventBus().send("payment.add", requestObject!.toJson());
    showDialog(
      context: Application().context,
      builder: (_) => AlertDialog(
        content: Text("Payment Added Successfully"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(Application().context).pop(),
            child: Text("OK"),
          )
        ],
      ).build(Application().context),
    );
  }
}

final AddPaymentBloc addPaymentBloc = AddPaymentBloc();
