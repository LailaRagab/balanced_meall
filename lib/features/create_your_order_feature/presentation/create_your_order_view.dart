import 'package:balanced_meal/core/utils/assets/colors/app_colors.dart';
import 'package:balanced_meal/features/create_your_order_feature/presentation/widgets/vegetables_column.dart';
import 'package:balanced_meal/features/enter_your_details_feature/presentation/widgets/view_model/calculate_maxi_cals.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:balanced_meal/core/widgets/custom_app_bar_shared.dart';
import 'package:balanced_meal/features/create_your_order_feature/presentation/widgets/meats_column.dart';
import 'package:balanced_meal/features/create_your_order_feature/presentation/widgets/carbs_column.dart';
import 'package:balanced_meal/features/create_your_order_feature/presentation/widgets/place_order_container.dart';
import '../view_model/firestore_services/model.dart';

class CreateYourOrderView extends StatefulWidget {
  const CreateYourOrderView({super.key});

  @override
  State<CreateYourOrderView> createState() => _CreateYourOrderViewState();
}

class _CreateYourOrderViewState extends State<CreateYourOrderView> {
  int vegQty = 0;
  int meatQty = 0;
  int carbQty = 0;

  void _updateVeg(int q) => setState(() => vegQty = q);
  void _updateMeat(int q) => setState(() => meatQty = q);
  void _updateCarb(int q) => setState(() => carbQty = q);

  int vegCals = 0, meatCals = 0, carbCals = 0;
  double vegPrice = 0, meatPrice = 0, carbPrice = 0;

  int get totalCals => vegCals + meatCals + carbCals;
  int get totalQty => vegQty + meatQty + carbQty;
  double get totalPrice => vegPrice + meatPrice + carbPrice;

  List<OrderItem> _buildVegItemList() => [];
  List<OrderItem> _buildMeatItemList() => [];
  List<OrderItem> _buildCarbItemList() => [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBgScreens,
        appBar: AppBarShared(
          onPressed: () => GoRouter.of(context).pop(),
          title: "Create your order",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              VegetablesColumn(
                onTotalChanged: _updateVeg,
                onCalsChanged: (c) => setState(() => vegCals = c),
                // onPriceChanged: (p) => setState(() => vegPrice = p),
              ),
              const SizedBox(height: 24),
              MeatsColumn(
                onTotalChanged: _updateMeat,
                onCalsChanged: (c) => setState(() => meatCals = c),
                // onPriceChanged: (p) => setState(() => meatPrice = p),
              ),
              const SizedBox(height: 24),
              CarbsColumn(
                onTotalChanged: _updateCarb,
                onCalsChanged: (c) => setState(() => carbCals = c),
                // onPriceChanged: (p) => setState(() => carbPrice = p),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: PlaceOrderContainer(
            enabled: totalQty > 0,
            currentCals: totalCals,
            maxCals: CalculateMaxiCals().calculateUserCals(),
            totalPrice: totalPrice,
            vegList: _buildVegItemList(),
            meatList: _buildMeatItemList(),
            carbList: _buildCarbItemList(),
            buttonText: 'Place Order',
          ),
        ),
      ),
    );
  }
}
