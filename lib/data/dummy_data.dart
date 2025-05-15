import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner3, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner5, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner6, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner8, targetScreen: TRoutes.order, active: false),
  ];

  /// -- User:
  static final UserModel user = UserModel(
      firstName: 'Coding',
      lastName: 'with T',
      email: 'support@codingwitht.com',
      phoneNumber: '01234567890',
      profilePicture: TImages.user,
      addresses: [
        AddressModel(
          id: '1',
          name: 'Coding with T',
          phoneNumber: '01234567890',
          street: 'timmy coves',
          city: 'South liana',
          state: 'Maine',
          postalCode: '87665',
          country: 'USA',
        ),
        AddressModel(
          id: '6',
          name: 'Coding with T',
          phoneNumber: '01234567890',
          street: 'timmy coves',
          city: 'South liana',
          state: 'Maine',
          postalCode: '87665',
          country: 'USA',
        ),
      ]);

  /// -- cart
  static final cartModel cart = CartModel(
    cartId: '001',
    items: [
      cartItemsModel(
        productId: '001',
        variationId: '1',
        quantity: 2,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
      cartItemsModel(
        productId: '001',
        variationId: '2',
        quantity: 2,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
    ],
  );

  /// -- order:
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      items: cart.items,
      totalAmount: 265,
      orderDate: DateTime(2025, 5, 15),
      delivaryDate: DateTime(2025, 5, 20),
    ),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      items: cart.items,
      totalAmount: 265,
      orderDate: DateTime(2025, 5, 15),
      delivaryDate: DateTime(2025, 5, 20),
    ),
  ];

  /// -- list of all categories:
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'Sports',
      image: TImages.sportIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Furniture',
      image: TImages.furnitureIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Electronics',
      image: TImages.electronicsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'Clothes',
      image: TImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Animals',
      image: TImages.animalIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Shoes',
      image: TImages.shoeIcon,
      isFeatured: true,
    ),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewelery',
        image: TImages.jeweleryIcon,
        isFeatured: true),

    /// subcategories:
    CategoryModel(
      id: '8',
      name: 'Sports Shoes',
      image: TImages.sportIcon,
      parentId: '1',
      isFeatured: true,
    ),
    CategoryModel(
      id: '9',
      name: 'Track suits',
      image: TImages.sportIcon,
      parentId: '1',
      isFeatured: true,
    ),
    CategoryModel(
      id: '10',
      name: 'Sports Equipment',
      image: TImages.sportIcon,
      parentId: '1',
      isFeatured: true,
    ),

    /// Furniture:
    CategoryModel(
      id: '11',
      name: 'Bedroom Furniture',
      image: TImages.furnitureIcon,
      parentId: '5',
      isFeatured: true,
    ),
    CategoryModel(
      id: '12',
      name: 'Kitchen Furniture',
      image: TImages.furnitureIcon,
      parentId: '5',
      isFeatured: true,
    ),
    CategoryModel(
      id: '13',
      name: 'Office Furniture',
      image: TImages.furnitureIcon,
      parentId: '5',
      isFeatured: true,
    ),

    /// electronics
    CategoryModel(
      id: '14',
      name: 'Laptop',
      image: TImages.electronicsIcon,
      parentId: '2',
      isFeatured: true,
    ),
    CategoryModel(
      id: '15',
      name: 'Mobile',
      image: TImages.electronicsIcon,
      parentId: '2',
      isFeatured: true,
    ),
    CategoryModel(
      id: '16',
      name: 'Shirts',
      image: TImages.clothIcon,
      parentId: '3',
      isFeatured: true,
    ),
  ];
}
