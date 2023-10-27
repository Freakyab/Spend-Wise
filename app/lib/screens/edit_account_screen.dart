import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:spendwise/provider/transaction_provider.dart';
import 'package:spendwise/provider/user_provider.dart';
import 'package:spendwise/screens/add_account_screen.dart';
import 'package:spendwise/screens/view_all_transaction_screen.dart';
import 'package:spendwise/widgits/account_card.dart';

class EditAccounts extends ConsumerWidget {
  const EditAccounts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(userProvider).accounts;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Account',
          ),
        ),
        body: ListView.builder(
          itemCount: accounts.length,
          itemBuilder: (BuildContext context, int index) {
            final account = accounts[index];
            return Padding(
                padding: const EdgeInsets.all(8),
                child: AccountCard(
                  account: account,
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddAccountScreen(
                        account: account,
                      );
                    }));
                  },
                ));
          },
        ));
  }
}
