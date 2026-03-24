import 'package:flutter/material.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMILARES',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A1D),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1D1E33),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white, 
            fontSize: 20, 
            fontWeight: FontWeight.bold, 
            letterSpacing: 3
          ),
        ),
      ),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de las 14 imágenes solicitadas
    final List<String> imagenes = [
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Llavero1.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Llavero2.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Llavero3.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Llavero4.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Llavero5.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Llavero6.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Peluche2.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Peluche3.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Peluche4.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Peluche5.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Peluche8.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Peluche9.png',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Peluche6.jfif',
      'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Peluche7.jfif',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("FARMACIAS SIMILARES"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        // 2 Columnas configuradas aquí
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68, // Relación de aspecto para evitar desbordamiento
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: imagenes.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF252733),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen uniforme
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      imagenes[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Contenido de la tarjeta
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        index < 6 ? "Llavero Edición" : "Peluche Simi",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                      ),
                      const Text(
                        "Producto Oficial",
                        style: TextStyle(fontSize: 12, color: Color(0xFF00E5FF)),
                      ),
                      const SizedBox(height: 6),
                      // Fila de Estrellas
                      Row(
                        children: List.generate(5, (i) => const Icon(Icons.star, color: Colors.amber, size: 14)),
                      ),
                      const SizedBox(height: 8),
                      // Botón de carrito llamativo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("\$120.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          CircleAvatar(
                            backgroundColor: const Color(0xFF00E5FF),
                            radius: 16,
                            child: IconButton(
                              icon: const Icon(Icons.add_shopping_cart, size: 16, color: Colors.black),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}