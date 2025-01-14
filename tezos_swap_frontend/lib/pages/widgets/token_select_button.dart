import 'package:flutter/material.dart';
import 'package:tezos_swap_frontend/services/token_provider.dart';
import '../../theme/ThemeRaclette.dart';
import 'card_route.dart';
import 'select_token_card.dart';

// ignore: must_be_immutable
class TokenSelectButton extends StatefulWidget {
  TokenProvider provider;

  TokenSelectButton(this.provider, {Key? key}) : super(key: key);

  @override
  State<TokenSelectButton> createState() => _TokenSelectButtonState();
}

class _TokenSelectButtonState extends State<TokenSelectButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          var newToken = await Navigator.of(context)
              .push(CardDialogRoute(builder: (context) {
            return const SelectTokenCard();
          }));

          setState(() {
            widget.provider.token = newToken;
          });
        },
        style: ThemeRaclette.buttonStyle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (widget.provider.token != null)
                  ? Image.asset(
                      widget.provider.token!.icon,
                      width: 25,
                    )
                  : const SizedBox(),
              (widget.provider.token != null)
                  ? Text(
                      widget.provider.token!.symbol,
                      style: const TextStyle(color: ThemeRaclette.black),
                    )
                  : const Text(
                      "Select Token",
                      style: TextStyle(color: Colors.black),
                    ),
              const Icon(
                Icons.arrow_drop_down_outlined,
                color: ThemeRaclette.black,
              )
            ],
          ),
        ));
  }
}
