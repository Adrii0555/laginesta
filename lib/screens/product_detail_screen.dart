import 'package:flutter/material.dart';
import '../models/product.dart';
import '../estilos/estilos_app.dart'; // Importamos la hoja de estilos

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // Aquí guardamos lo que el usuario va seleccionando
  ProductOption? selectedSize;
  ProductOption? selectedBread;
  ProductOption? selectedIngredient;
  List<ProductOption> selectedExtras = [];

  @override
  void initState() {
    super.initState();
    // Pre-seleccionamos la primera opción por defecto si existen
    if (widget.product.sizes != null && widget.product.sizes!.isNotEmpty) {
      selectedSize = widget.product.sizes!.first;
    }
    if (widget.product.breadTypes != null && widget.product.breadTypes!.isNotEmpty) {
      selectedBread = widget.product.breadTypes!.first;
    }
    if (widget.product.ingredient != null && widget.product.ingredient!.isNotEmpty) {
      selectedIngredient = widget.product.ingredient!.first;
    }
  }

  // Calculamos el precio total dinámicamente
  double get totalPrice {
    double total = widget.product.basePrice;
    if (selectedSize != null) total += selectedSize!.extraPrice;
    if (selectedBread != null) total += selectedBread!.extraPrice;
    if (selectedIngredient != null) total += selectedIngredient!.extraPrice;
    for (var extra in selectedExtras) {
      total += extra.extraPrice;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EstilosApp.colorFondo, // Usamos el fondo de los estilos
      appBar: AppBar(
        title: Text(widget.product.name, style: EstilosApp.tituloAppBar), // Estilo del AppBar
        backgroundColor: EstilosApp.colorPrincipal, // Color corporativo
        iconTheme: const IconThemeData(color: EstilosApp.colorTextoClaro), 
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(widget.product.description, style: EstilosApp.subtitulo), // Estilo de subtítulo
          const SizedBox(height: 20),
          
          // --- SECCIÓN TAMAÑOS ---
          if (widget.product.sizes != null && widget.product.sizes!.isNotEmpty) ...[
            const Text('Tamaño', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.product.sizes!.map((size) {
              return RadioListTile<ProductOption>(
                title: Text('${size.name} (+${size.extraPrice.toStringAsFixed(2)} €)'),
                value: size,
                groupValue: selectedSize,
                activeColor: EstilosApp.colorPrincipal, // Color corporativo
                onChanged: (value) {
                  setState(() { selectedSize = value; });
                },
              );
            }),
            const Divider(),
          ],

          // --- SECCIÓN TIPO DE PAN ---
          if (widget.product.breadTypes != null && widget.product.breadTypes!.isNotEmpty) ...[
            const Text('Tipo de Pan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.product.breadTypes!.map((bread) {
              return RadioListTile<ProductOption>(
                title: Text('${bread.name} (+${bread.extraPrice.toStringAsFixed(2)} €)'),
                value: bread,
                groupValue: selectedBread,
                activeColor: EstilosApp.colorPrincipal, // Color corporativo
                onChanged: (value) {
                  setState(() { selectedBread = value; });
                },
              );
            }),
            const Divider(),
          ],

          // --- SECCIÓN INGREDIENTE DEL BOCATA ---
          if (widget.product.ingredient != null && widget.product.ingredient!.isNotEmpty) ...[
            const Text('Ingrediente principal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.product.ingredient!.map((ingredient) {
              return RadioListTile<ProductOption>(
                title: Text('${ingredient.name} (+${ingredient.extraPrice.toStringAsFixed(2)} €)'),
                value: ingredient,
                groupValue: selectedIngredient,
                activeColor: EstilosApp.colorPrincipal, // Color corporativo
                onChanged: (value) {
                  setState(() { selectedIngredient = value; });
                },
              );
            }),
            const Divider(),
          ],

          // --- SECCIÓN EXTRAS (Múltiple selección) ---
          if (widget.product.extraIngredients != null && widget.product.extraIngredients!.isNotEmpty) ...[
            const Text('Extras y modificaciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.product.extraIngredients!.map((extra) {
              return CheckboxListTile(
                title: Text('${extra.name} (+${extra.extraPrice.toStringAsFixed(2)} €)'),
                value: selectedExtras.contains(extra),
                activeColor: EstilosApp.colorPrincipal, // Color corporativo
                onChanged: (bool? checked) {
                  setState(() {
                    if (checked == true) {
                      selectedExtras.add(extra);
                    } else {
                      selectedExtras.remove(extra);
                    }
                  });
                },
              );
            }),
          ],
        ],
      ),
      
      // --- BARRA INFERIOR CON EL PRECIO Y BOTÓN ---
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: EstilosApp.colorPrincipal, // Color corporativo
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              // Aquí irá la lógica de añadir al carrito
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Añadido por ${totalPrice.toStringAsFixed(2)} €')),
              );
              Navigator.pop(context); // Vuelve a la carta
            },
            child: Text(
              'Añadir al pedido - ${totalPrice.toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 18, color: EstilosApp.colorTextoClaro, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}