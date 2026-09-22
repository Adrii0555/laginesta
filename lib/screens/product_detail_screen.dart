import 'package:flutter/material.dart';
import '../models/product.dart';

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
  }

  // Calculamos el precio total dinámicamente
  double get totalPrice {
    double total = widget.product.basePrice;
    if (selectedSize != null) total += selectedSize!.extraPrice;
    if (selectedBread != null) total += selectedBread!.extraPrice;
    for (var extra in selectedExtras) {
      total += extra.extraPrice;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange[800],
        iconTheme: const IconThemeData(color: Colors.white), // Color de la flecha de volver
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(widget.product.description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 20),
          
          // --- SECCIÓN TAMAÑOS ---
          if (widget.product.sizes != null && widget.product.sizes!.isNotEmpty) ...[
            const Text('Tamaño', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.product.sizes!.map((size) {
              return RadioListTile<ProductOption>(
                title: Text('${size.name} (+${size.extraPrice.toStringAsFixed(2)} €)'),
                value: size,
                groupValue: selectedSize,
                activeColor: Colors.orange[800],
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
                activeColor: Colors.orange[800],
                onChanged: (value) {
                  setState(() { selectedBread = value; });
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
                activeColor: Colors.orange[800],
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
              backgroundColor: Colors.orange[800],
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
              style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}