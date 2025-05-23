import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/payment_method_model.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: TImages.paypal, name: 'Paypal');
    super.onInit();
  }

  // selectPaymentMethod:
  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(
                  title: 'Select Payment Method', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwSections),
              TPaymentTile(
                paymentMethod:
                    PaymentMethodModel(image: TImages.paypal, name: 'Paypal'),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: TImages.googlePay, name: 'GooglePay'),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: TImages.applePay, name: 'ApplePay'),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                paymentMethod:
                    PaymentMethodModel(image: TImages.visa, name: 'Visa'),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: TImages.masterCard, name: 'Master Card'),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                paymentMethod:
                    PaymentMethodModel(image: TImages.paytm, name: 'Paytm'),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: TImages.paystack, name: 'Paystack'),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: TImages.creditCard, name: 'Credit Card'),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
