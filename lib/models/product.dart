class Product {
  final String id;
  final String name;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
}

// Estos son nuestros datos de prueba (Mock Data)
List<Product> mockProducts = [
  Product(
    id: '1',
    name: 'Bocadillo de Jamón',
    description: 'Con tomate restregado y aceite de oliva',
    price: 4.50,
  ),
  Product(
    id: '2',
    name: 'Bravas "La Ginesta"',
    description: 'Ración de patatas con nuestra salsa secreta',
    price: 5.00,
  ),
  Product(
    id: '3',
    name: 'Café con leche',
    description: 'Café 100% arábica',
    price: 1.50,
  ),
  Product(
    id: '4',
    name: 'Bocadillo de Tortilla',
    description: 'Tortilla francesa recién hecha',
    price: 4.00,
  ),
  Product(
    id: '5',
    name: 'Webos de Valen',
    description: 'Mis webos',
    price: 10.00
  )
];