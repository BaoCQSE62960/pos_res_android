import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/order.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: dividerColor),
        BoxShadow(
            color: Colors.white, blurRadius: 3.0, offset: Offset(4.0, 2.0)),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextFormField(
          onChanged: (value) {
            orderBloc.add(
              LoadData(checkid: orderBloc.state.checkId, searchQuery: value),
            );
          },
          decoration: InputDecoration(
              hintText: 'order.search'.tr(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[100]!),
                  borderRadius: BorderRadius.circular(20.0)),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(Icons.search)),
        ),
      ),
    );
  }
}
