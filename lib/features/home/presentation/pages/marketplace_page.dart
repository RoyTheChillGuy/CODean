import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/product.dart';
import '../widgets/product_card.dart';

class MarketplacePage extends StatefulWidget {
  final String? initialCategory;

  const MarketplacePage({super.key, this.initialCategory});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  late String _selectedCategory;
  final List<String> _categories = [
    'Semua',
    'Buku',
    'Elektronik',
    'Fashion',
    'Kendaraan',
    'Gaming',
    'Sewa Barang',
    'New',
    'Second',
    'Disewakan',
    'Lainnya',
  ];

  final List<Product> _allProducts = [
    Product(
      id: '1',
      title: 'MacBook Air M1 2020',
      price: '8.500.000',
      description: 'MacBook Air M1 kondisi 95%, baterai cycle 120, fullset box + charger. Cocok untuk mahasiswa IT, desain, dan multitasking ringan.',
      imageUrl: 'https://images.unsplash.com/photo-1517336710214-46b0ed8b4741?q=80&w=600&auto=format&fit=crop',
      category: 'Elektronik',
      condition: 'Bekas - Seperti Baru',
      location: '0.3 km',
      views: '234',
      messages: '45',
      seller: Seller(
        name: 'Andi Pratama',
        avatarUrl: 'https://ui-avatars.com/api/?name=Andi+Pratama&background=7E57C2&color=fff',
        major: 'Teknik Informatika',
        rating: '4.8',
        isVerified: true,
      ),
    ),
    Product(
      id: 'ip1',
      title: 'MacBook Air M2 13"',
      price: '14.500.000',
      description: 'MacBook Air M2 Silver 8/256GB. Mulus 99% garansi aktif.',
      imageUrl: 'https://images.unsplash.com/photo-1611186871348-b1ec696e52c9?q=80&w=600&auto=format&fit=crop',
      category: 'Elektronik',
      condition: 'Bekas - Seperti Baru',
      location: '0.8 km',
      views: '1.5k',
      messages: '32',
      seller: Seller(name: 'Roy', avatarUrl: 'https://ui-avatars.com/api/?name=Roy&background=7E57C2&color=fff', major: 'Teknik Komputer', rating: '5.0', isVerified: true),
    ),
    Product(
      id: '2',
      title: 'iPad Pro 11" 2022',
      price: '9.200.000',
      description: 'iPad Pro M2 11 inch, 128GB WiFi. Kondisi mulus 99% seperti baru.',
      imageUrl: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?q=80&w=600&auto=format&fit=crop',
      category: 'Elektronik',
      condition: 'Bekas - Seperti Baru',
      location: '0.5 km',
      views: '128',
      messages: '12',
      seller: Seller(
        name: 'Sarah Wijaya',
        avatarUrl: 'https://ui-avatars.com/api/?name=Sarah+Wijaya&background=7E57C2&color=fff',
        major: 'Desain Komunikasi Visual',
        rating: '4.9',
        isVerified: true,
      ),
    ),
    Product(
      id: '3',
      title: 'Buku Algoritma Pemrograman',
      price: '75.000',
      description: 'Buku Algoritma dan Pemrograman edisi terbaru.',
      imageUrl: 'https://images.unsplash.com/photo-1532012197267-da84d127e765?q=80&w=600&auto=format&fit=crop',
      category: 'Buku',
      condition: 'Bekas - Baik',
      location: '0.2 km',
      views: '56',
      messages: '8',
      seller: Seller(
        name: 'Budi Setiawan',
        avatarUrl: 'https://ui-avatars.com/api/?name=Budi+Setiawan&background=7E57C2&color=fff',
        major: 'Sistem Informasi',
        rating: '4.7',
        isVerified: false,
      ),
    ),
    Product(
      id: 'b2',
      title: 'Novel "Laut Bercerita"',
      price: '55.000',
      description: 'Novel best seller Leila Chudori. Kondisi terawat.',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=600&auto=format&fit=crop',
      category: 'Buku',
      condition: 'Bekas - Seperti Baru',
      location: '0.2 km',
      views: '120',
      messages: '3',
      seller: Seller(name: 'Sarah Wijaya', avatarUrl: 'https://ui-avatars.com/api/?name=Sarah+Wijaya&background=7E57C2&color=fff', major: 'DKV', rating: '4.9', isVerified: true),
    ),
    Product(
      id: 'b3',
      title: 'Buku "Clean Code"',
      price: '95.000',
      description: 'Buku legendaris Robert C. Martin.',
      imageUrl: 'https://images.unsplash.com/photo-1589998059171-988d887df646?q=80&w=600&auto=format&fit=crop',
      category: 'Buku',
      condition: 'Bekas - Baik',
      location: '0.4 km',
      views: '80',
      messages: '2',
      seller: Seller(name: 'Andi Pratama', avatarUrl: 'https://ui-avatars.com/api/?name=Andi+Pratama&background=7E57C2&color=fff', major: 'TI', rating: '4.8', isVerified: true),
    ),
    Product(
      id: 'f1',
      title: 'Nike Air Force 1 White',
      price: '450.000',
      description: 'Sepatu Nike original, size 42. Kondisi kotor pemakaian.',
      imageUrl: 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?q=80&w=600&auto=format&fit=crop',
      category: 'Fashion',
      condition: 'Bekas - Layak Pakai',
      location: '0.8 km',
      views: '450',
      messages: '18',
      seller: Seller(name: 'Budi Setiawan', avatarUrl: 'https://ui-avatars.com/api/?name=Budi+Setiawan&background=7E57C2&color=fff', major: 'SI', rating: '4.7', isVerified: false),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory ?? 'Semua';
  }

  List<Product> get _filteredProducts {
    if (_selectedCategory == 'Semua') return _allProducts;
    return _allProducts.where((p) {
      final matchesCategory = p.category == _selectedCategory;
      final matchesCondition = p.condition.toLowerCase().contains(_selectedCategory.toLowerCase());
      return matchesCategory || matchesCondition;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Marketplace',
          style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textPrimary),
            onPressed: () => context.push('/search'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: _categories.map((cat) {
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(cat),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = cat;
                      });
                    },
                    selectedColor: AppColors.primary,
                    checkmarkColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textSecondary,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    backgroundColor: Colors.grey.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: isSelected ? AppColors.primary : Colors.grey.shade100),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              '${_filteredProducts.length} produk',
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: _filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
