import 'dart:async';

import 'package:crypto1/models/Cryptocurrency.dart';
import 'package:crypto1/providers/market_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get Consumer => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Crypto Today",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            Expanded(
              child: Consumer<MarketProvider>(
                  builder: (context, MarketProvider, child) {
                if (MarketProvider.isloading == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (MarketProvider.market.length > 0) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: MarketProvider.market.length,
                      itemBuilder: (context, index) {
                        CryptoCurrency currentCrypto =
                            MarketProvider.markets[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(currentCrypto.image!),
                          ),
                          title: Text(currentCrypto.name!),
                          subtitle: Text(currentCrypto.symbol!.toUpperCase()),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "R " +
                                    currentCrypto.currentPrice!
                                        .toStringAsFixed(4),
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  double priceChange =
                                      currentCrypto.priceChange24!;
                                  double priceChangePercentage =
                                      currentCrypto.priceChangePercentage24!;

                                  if (priceChange < 0) {
                                    return Text(
                                        "${priceChangePercentage.toStringAsFixed(2)}%(${priceChange.toStringAsFixed(4)})",
                                        style:
                                            const TextStyle(color: Colors.red));
                                  } else {
                                    return Text(
                                        "+${priceChangePercentage.toStringAsFixed(2)}%(+${priceChange.toStringAsFixed(4)})",
                                        style: const TextStyle(
                                            color: Colors.green));
                                  }
                                },
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Text("Data Not Found");
                  }
                }
              }),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
