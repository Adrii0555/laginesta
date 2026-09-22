// lib/models/product.dart

// 1. Creamos un molde para las opciones extra (tamaño, pan, ingredientes)
class ProductOption {
  final String name;
  final double extraPrice;

  ProductOption({
    required this.name,
    this.extraPrice = 0.0, // Si no le pasamos precio, por defecto es 0.0
  });
}

// 2. Ampliamos nuestro molde del producto principal
class Product {
  final String id;
  final String name;
  final String description;
  final double basePrice;
  
  // Añadimos listas opcionales para las variaciones
  final List<ProductOption>? sizes;
  final List<ProductOption>? breadTypes;
  final List<ProductOption>? ingredient;
  final List<ProductOption>? extraIngredients;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    this.sizes,
    this.breadTypes,
    this.ingredient,
    this.extraIngredients,
  });
}

// 3. Así se vería nuestra base de datos simulada ahora:
List<Product> mockProducts = [
  Product(
    id: '1',
    name: 'Bocadillo',
    description: 'Con tomate restregado y aceite de oliva',
    basePrice: 4.50,
    sizes: [
      ProductOption(name: 'Normal'),
      ProductOption(name: 'Grande', extraPrice: 1.50),
    ],
    ingredient: [
      ProductOption(name: 'Jamón serrano'),
      ProductOption(name: 'Fuet'),
      ProductOption(name: 'Pavo'),
      ProductOption(name: 'Jamón Ibérico', extraPrice: 1.00),
    ],
    breadTypes: [
      ProductOption(name: 'Barra normal'),
      ProductOption(name: 'Chapata', extraPrice: 0.50),
      ProductOption(name: 'Sin gluten', extraPrice: 1.00),
    ],
    extraIngredients: [
      ProductOption(name: 'Extra de queso', extraPrice: 0.80),
      ProductOption(name: 'Sin tomate'), // Precio extra 0.0 implícito
    ],
  ),
  Product(
    id: '2',
    name: 'Café con leche',
    description: 'Café 100% arábica',
    basePrice: 1.50,
    // Un café no necesita tipos de pan, así que no le pasamos esas listas
    sizes: [
      ProductOption(name: 'Taza normal'),
      ProductOption(name: 'Taza grande', extraPrice: 0.30),
    ],
  ),
];