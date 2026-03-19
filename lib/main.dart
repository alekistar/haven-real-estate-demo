import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const HavenApp());
}

class HavenApp extends StatelessWidget {
  const HavenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haven',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: HavenPalette.slate),
        scaffoldBackgroundColor: HavenPalette.cream,
        useMaterial3: true,
      ),
      home: const HavenDemoRootScreen(),
    );
  }
}

class HavenPalette {
  static const Color cream = Color(0xFFF5F5DC);
  static const Color slate = Color(0xFF2F4F4F);
  static const Color gold = Color(0xFFD4AF37);
  static const Color white = Colors.white;
}

const String _heroTag = 'haven-villa-hero';
const String _villaImageUrl =
    'https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=1400&q=80';

class HavenHomeScreen extends StatelessWidget {
  const HavenHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HavenPalette.cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Haven',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: HavenPalette.slate,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Discover exceptional living spaces',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: HavenPalette.slate.withValues(alpha: 0.70),
                ),
              ),
              const SizedBox(height: 24),
              InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder<void>(
                      transitionDuration: const Duration(milliseconds: 550),
                      pageBuilder: (_, __, ___) => const HavenDiscoveryScreen(),
                    ),
                  );
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: HavenPalette.slate.withValues(alpha: 0.12),
                        blurRadius: 22,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 0.92,
                          child: Hero(
                            tag: _heroTag,
                            child: Image.network(
                              _villaImageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.16),
                                  Colors.black.withValues(alpha: 0.52),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 18,
                          right: 18,
                          bottom: 18,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$5,950,000',
                                      style: GoogleFonts.playfairDisplay(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Beverly Hills, California',
                                      style: GoogleFonts.inter(
                                        color: Colors.white
                                            .withValues(alpha: 0.90),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                  color: HavenPalette.gold,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: HavenPalette.slate,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HavenDiscoveryScreen extends StatelessWidget {
  const HavenDiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final topImageHeight = height * 0.60;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: topImageHeight,
                  width: width,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: _heroTag,
                        child: Image.network(
                          _villaImageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFEDEBD6),
                                    Color(0xFFF6F5EA),
                                    Color(0xFFEDEBD6),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.20),
                              Colors.black.withValues(alpha: 0.45),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.paddingOf(context).top + 18,
                        left: 20,
                        child: Material(
                          color: Colors.white.withValues(alpha: 0.20),
                          borderRadius: BorderRadius.circular(14),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: () => Navigator.of(context).pop(),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.paddingOf(context).top + 18,
                        left: 20,
                        right: 20,
                        child: const _FloatingSearchBar(),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 26,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Haven Signature Villa',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                letterSpacing: 1.4,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.88),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Curated Luxury Living',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 33,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: HavenPalette.white,
                  width: width,
                  padding: const EdgeInsets.fromLTRB(24, 26, 24, 130),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$5,950,000',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                          color: HavenPalette.slate,
                          height: 1.05,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '912 Palm Crest Drive, Beverly Hills, CA',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: HavenPalette.slate.withValues(alpha: 0.72),
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 28),
                      const _AmenityStrip(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _BottomActionBar(),
          ),
        ],
      ),
    );
  }
}

class _FloatingSearchBar extends StatelessWidget {
  const _FloatingSearchBar();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.33),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: Colors.white.withValues(alpha: 0.92),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Search estates, cities, architecture...',
                  style: GoogleFonts.inter(
                    color: Colors.white.withValues(alpha: 0.94),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              Icon(
                Icons.tune_rounded,
                color: HavenPalette.gold.withValues(alpha: 0.95),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AmenityStrip extends StatelessWidget {
  const _AmenityStrip();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _AmenityItem(icon: Icons.bed_outlined, label: '4 Beds'),
        _AmenityItem(icon: Icons.bathtub_outlined, label: '3 Baths'),
        _AmenityItem(icon: Icons.square_foot_outlined, label: '2,500 sqft'),
      ],
    );
  }
}

class _AmenityItem extends StatelessWidget {
  const _AmenityItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: HavenPalette.slate.withValues(alpha: 0.16)),
        color: HavenPalette.cream.withValues(alpha: 0.45),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 19,
            color: HavenPalette.slate.withValues(alpha: 0.86),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: HavenPalette.slate.withValues(alpha: 0.85),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  const _BottomActionBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.paddingOf(context).bottom + 14,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: SizedBox(
              height: 58,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: HavenPalette.slate,
                  foregroundColor: HavenPalette.cream,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  'Schedule Viewing',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 58,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: HavenPalette.gold.withValues(alpha: 0.85),
                  ),
                  backgroundColor: HavenPalette.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Icon(
                  Icons.favorite_border_rounded,
                  color: HavenPalette.gold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DemoEstate {
  const DemoEstate({
    required this.id,
    required this.name,
    required this.price,
    required this.address,
    required this.city,
    required this.imageUrl,
    required this.description,
    required this.beds,
    required this.baths,
    required this.sqft,
    required this.hasPool,
  });

  final String id;
  final String name;
  final int price;
  final String address;
  final String city;
  final String imageUrl;
  final String description;
  final int beds;
  final int baths;
  final int sqft;
  final bool hasPool;

  String get heroTag => 'estate-$id';
}

const List<DemoEstate> demoEstates = [
  DemoEstate(
    id: 'malibu-crown',
    name: 'Malibu Crown Villa',
    price: 8950000,
    address: '140 Ocean View Drive, Malibu, CA 90265',
    city: 'Malibu, California',
    imageUrl:
        'https://images.unsplash.com/photo-1613977257363-707ba9348227?auto=format&fit=crop&w=1400&q=80',
    description:
        'Stunning contemporary villa with panoramic ocean views, infinity pool, and curated luxury finishes.',
    beds: 4,
    baths: 3,
    sqft: 2500,
    hasPool: true,
  ),
  DemoEstate(
    id: 'beverly-terrace',
    name: 'Beverly Terrace House',
    price: 5950000,
    address: '912 Palm Crest Drive, Beverly Hills, CA',
    city: 'Beverly Hills, California',
    imageUrl:
        'https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=1400&q=80',
    description:
        'Sculpted architecture, warm textures, private courtyard, and seamless indoor-outdoor entertaining spaces.',
    beds: 4,
    baths: 3,
    sqft: 2500,
    hasPool: true,
  ),
  DemoEstate(
    id: 'bel-air-skyline',
    name: 'Bel-Air Skyline Estate',
    price: 12400000,
    address: '18 Skyline Crest, Bel-Air, Los Angeles, CA',
    city: 'Bel-Air, Los Angeles',
    imageUrl:
        'https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?auto=format&fit=crop&w=1400&q=80',
    description:
        'Walls of glass, city-light panoramas, spa suites, and a cinematic lounge for modern executive living.',
    beds: 5,
    baths: 5,
    sqft: 5200,
    hasPool: true,
  ),
  DemoEstate(
    id: 'miami-biscayne',
    name: 'Biscayne Waterfront Mansion',
    price: 7850000,
    address: '61 Baypoint Isle, Miami, FL 33137',
    city: 'Miami, Florida',
    imageUrl:
        'https://images.unsplash.com/photo-1616137466211-f939a420be84?auto=format&fit=crop&w=1400&q=80',
    description:
        'Private dock, ocean breeze terraces, and rich modern interiors composed for refined waterfront life.',
    beds: 5,
    baths: 4,
    sqft: 4300,
    hasPool: true,
  ),
  DemoEstate(
    id: 'austin-modern',
    name: 'Austin Hills Modern',
    price: 3290000,
    address: '427 Ridgepoint Lane, Austin, TX 78746',
    city: 'Austin, Texas',
    imageUrl:
        'https://images.unsplash.com/photo-1600047509807-ba8f99d2cdde?auto=format&fit=crop&w=1400&q=80',
    description:
        'Linear form, green courtyard views, artisan stone details, and elevated comfort in every room.',
    beds: 4,
    baths: 4,
    sqft: 3400,
    hasPool: true,
  ),
  DemoEstate(
    id: 'seattle-lakeside',
    name: 'Lakeside Glass House',
    price: 4990000,
    address: '80 Mercer Sound Road, Seattle, WA',
    city: 'Seattle, Washington',
    imageUrl:
        'https://images.unsplash.com/photo-1613553497126-a44624272024?auto=format&fit=crop&w=1400&q=80',
    description:
        'Calm lakeside architecture with Nordic restraint, premium craftsmanship, and natural morning light.',
    beds: 4,
    baths: 3,
    sqft: 3100,
    hasPool: false,
  ),
  DemoEstate(
    id: 'scottsdale-desert',
    name: 'Scottsdale Desert Pavilion',
    price: 6150000,
    address: '202 Cactus Bluff Trail, Scottsdale, AZ',
    city: 'Scottsdale, Arizona',
    imageUrl:
        'https://images.unsplash.com/photo-1600566752355-35792bedcfea?auto=format&fit=crop&w=1400&q=80',
    description:
        'Earth-toned materials, shaded outdoor lounge, and resort-like serenity under dramatic desert sunsets.',
    beds: 5,
    baths: 4,
    sqft: 4700,
    hasPool: true,
  ),
  DemoEstate(
    id: 'nyc-penthouse',
    name: 'Tribeca Sky Penthouse',
    price: 10950000,
    address: '12 Vestry Street PH, New York, NY',
    city: 'New York, New York',
    imageUrl:
        'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1400&q=80',
    description:
        'Double-height ceilings, skyline terrace views, and gallery-grade finishes in the heart of Tribeca.',
    beds: 4,
    baths: 4,
    sqft: 3900,
    hasPool: false,
  ),
  DemoEstate(
    id: 'san-diego-coast',
    name: 'La Jolla Coast Retreat',
    price: 6740000,
    address: '35 Seacliff Point, La Jolla, CA',
    city: 'La Jolla, California',
    imageUrl:
        'https://images.unsplash.com/photo-1605146768851-eda79da39897?auto=format&fit=crop&w=1400&q=80',
    description:
        'Contemporary coastal composition with chef kitchen, sunset decks, and tranquil ocean-facing bedrooms.',
    beds: 4,
    baths: 3,
    sqft: 3200,
    hasPool: true,
  ),
  DemoEstate(
    id: 'nashville-estate',
    name: 'Belle Meade Manor',
    price: 4580000,
    address: '77 Oakmont Court, Nashville, TN',
    city: 'Nashville, Tennessee',
    imageUrl:
        'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1400&q=80',
    description:
        'Grand contemporary estate with curated gathering spaces and a private garden lounge.',
    beds: 5,
    baths: 4,
    sqft: 4100,
    hasPool: true,
  ),
];

class HavenDemoRootScreen extends StatefulWidget {
  const HavenDemoRootScreen({super.key});

  @override
  State<HavenDemoRootScreen> createState() => _HavenDemoRootScreenState();
}

class _HavenDemoRootScreenState extends State<HavenDemoRootScreen> {
  int _tabIndex = 0;
  int _previousTabIndex = 0;
  String _query = '';
  final Set<String> _savedIds = <String>{};
  int? _minBeds;
  int? _maxPrice;
  bool _poolOnly = false;
  String? _cityFilter;

  List<DemoEstate> get _filtered {
    final text = _query.toLowerCase().trim();

    return demoEstates.where((e) {
      final matchesText = text.isEmpty ||
          e.name.toLowerCase().contains(text) ||
          e.city.toLowerCase().contains(text) ||
          e.address.toLowerCase().contains(text);
      final matchesBeds = _minBeds == null || e.beds >= _minBeds!;
      final matchesPrice = _maxPrice == null || e.price <= _maxPrice!;
      final matchesPool = !_poolOnly || e.hasPool;
      final matchesCity = _cityFilter == null || e.city == _cityFilter;

      return matchesText &&
          matchesBeds &&
          matchesPrice &&
          matchesPool &&
          matchesCity;
    }).toList();
  }

  List<DemoEstate> get _saved {
    return demoEstates.where((e) => _savedIds.contains(e.id)).toList();
  }

  void _toggleSaved(DemoEstate estate) {
    setState(() {
      if (_savedIds.contains(estate.id)) {
        _savedIds.remove(estate.id);
      } else {
        _savedIds.add(estate.id);
      }
    });
  }

  void _clearFilters() {
    setState(() {
      _minBeds = null;
      _maxPrice = null;
      _poolOnly = false;
      _cityFilter = null;
    });
  }

  Future<void> _openFiltersSheet() async {
    int? tempBeds = _minBeds;
    int? tempPrice = _maxPrice;
    bool tempPool = _poolOnly;

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: HavenPalette.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            Widget chip({
              required String label,
              required bool selected,
              required VoidCallback onTap,
            }) {
              return ChoiceChip(
                label: Text(label),
                selected: selected,
                onSelected: (_) => onTap(),
                selectedColor: HavenPalette.gold.withValues(alpha: 0.22),
                labelStyle: GoogleFonts.inter(
                  color: HavenPalette.slate,
                  fontWeight: FontWeight.w600,
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                18,
                20,
                MediaQuery.paddingOf(context).bottom + 18,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filters',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: HavenPalette.slate,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text('Minimum Beds', style: GoogleFonts.inter()),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      chip(
                        label: 'Any',
                        selected: tempBeds == null,
                        onTap: () => setSheetState(() => tempBeds = null),
                      ),
                      chip(
                        label: '3+',
                        selected: tempBeds == 3,
                        onTap: () => setSheetState(() => tempBeds = 3),
                      ),
                      chip(
                        label: '4+',
                        selected: tempBeds == 4,
                        onTap: () => setSheetState(() => tempBeds = 4),
                      ),
                      chip(
                        label: '5+',
                        selected: tempBeds == 5,
                        onTap: () => setSheetState(() => tempBeds = 5),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text('Max Price', style: GoogleFonts.inter()),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      chip(
                        label: 'Any',
                        selected: tempPrice == null,
                        onTap: () => setSheetState(() => tempPrice = null),
                      ),
                      chip(
                        label: '\$5M',
                        selected: tempPrice == 5000000,
                        onTap: () => setSheetState(() => tempPrice = 5000000),
                      ),
                      chip(
                        label: '\$8M',
                        selected: tempPrice == 8000000,
                        onTap: () => setSheetState(() => tempPrice = 8000000),
                      ),
                      chip(
                        label: '\$10M',
                        selected: tempPrice == 10000000,
                        onTap: () => setSheetState(() => tempPrice = 10000000),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile.adaptive(
                    value: tempPool,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Pool only',
                      style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                    ),
                    activeColor: HavenPalette.gold,
                    onChanged: (value) => setSheetState(() => tempPool = value),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _minBeds = null;
                              _maxPrice = null;
                              _poolOnly = false;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Reset'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _minBeds = tempBeds;
                              _maxPrice = tempPrice;
                              _poolOnly = tempPool;
                            });
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: HavenPalette.slate,
                            foregroundColor: HavenPalette.cream,
                          ),
                          child: const Text('Apply'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<String> get _activeFilters {
    final items = <String>[];
    if (_cityFilter != null) items.add(_cityFilter!);
    if (_minBeds != null) items.add('${_minBeds!}+ Beds');
    if (_maxPrice != null) items.add('Under ${_demoFormatPrice(_maxPrice!)}');
    if (_poolOnly) items.add('Pool');
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _DemoDiscoverTab(
        estates: _filtered,
        savedIds: _savedIds,
        onQueryChanged: (value) => setState(() => _query = value),
        onToggleSaved: _toggleSaved,
        onOpenFilters: _openFiltersSheet,
        activeFilters: _activeFilters,
        onClearFilters: _clearFilters,
      ),
      _DemoSavedTab(
        estates: _saved,
        onToggleSaved: _toggleSaved,
      ),
      _DemoMapTab(
        selectedCity: _cityFilter,
        onCitySelected: (city) {
          setState(() {
            _cityFilter = city;
            _previousTabIndex = _tabIndex;
            _tabIndex = 0;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Showing listings in $city'),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(milliseconds: 1200),
            ),
          );
        },
      ),
      const _DemoProfileTab(),
    ];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 420),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        layoutBuilder: (currentChild, previousChildren) {
          return Stack(
            alignment: Alignment.center,
            children: [
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          );
        },
        transitionBuilder: (child, animation) {
          final isForward = _tabIndex >= _previousTabIndex;
          final isIncoming = child.key == ValueKey<int>(_tabIndex);
          final beginX = isIncoming
              ? (isForward ? 0.10 : -0.10)
              : (isForward ? -0.10 : 0.10);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(beginX, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
              child: child,
            ),
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_tabIndex),
          child: pages[_tabIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        onDestinationSelected: (index) {
          if (index == _tabIndex) return;
          setState(() {
            _previousTabIndex = _tabIndex;
            _tabIndex = index;
          });
        },
        backgroundColor: HavenPalette.white,
        indicatorColor: HavenPalette.gold.withValues(alpha: 0.22),
        surfaceTintColor: Colors.transparent,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore_rounded),
            label: 'Discover',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border_rounded),
            selectedIcon: Icon(Icons.favorite_rounded),
            label: 'Saved',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map_rounded),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _DemoDiscoverTab extends StatelessWidget {
  const _DemoDiscoverTab({
    required this.estates,
    required this.savedIds,
    required this.onQueryChanged,
    required this.onToggleSaved,
    required this.onOpenFilters,
    required this.activeFilters,
    required this.onClearFilters,
  });

  final List<DemoEstate> estates;
  final Set<String> savedIds;
  final ValueChanged<String> onQueryChanged;
  final ValueChanged<DemoEstate> onToggleSaved;
  final VoidCallback onOpenFilters;
  final List<String> activeFilters;
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Haven',
                    style: GoogleFonts.playfairDisplay(
                      color: HavenPalette.gold,
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    onChanged: onQueryChanged,
                    decoration: InputDecoration(
                      hintText: 'Search locations, villas, amenities...',
                      prefixIcon: const Icon(Icons.search_rounded),
                      suffixIcon: IconButton(
                        onPressed: onOpenFilters,
                        icon: const Icon(
                          Icons.tune_rounded,
                          color: HavenPalette.gold,
                        ),
                      ),
                      filled: true,
                      fillColor: HavenPalette.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: HavenPalette.slate.withValues(alpha: 0.10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: HavenPalette.slate.withValues(alpha: 0.10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: HavenPalette.slate.withValues(alpha: 0.10),
                        ),
                      ),
                    ),
                  ),
                  if (activeFilters.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ...activeFilters.map(
                          (item) => Chip(
                            label: Text(item,
                                style: GoogleFonts.inter(fontSize: 12)),
                            side: BorderSide(
                              color: HavenPalette.slate.withValues(alpha: 0.16),
                            ),
                            backgroundColor: HavenPalette.white,
                          ),
                        ),
                        ActionChip(
                          label: const Text('Clear'),
                          onPressed: onClearFilters,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          sliver: estates.isEmpty
              ? const SliverToBoxAdapter(child: _DemoNoResults())
              : SliverList.builder(
                  itemCount: estates.length,
                  itemBuilder: (context, index) {
                    final estate = estates[index];
                    final isSaved = savedIds.contains(estate.id);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: _DemoEstateCard(
                        index: index,
                        estate: estate,
                        isSaved: isSaved,
                        onToggleSaved: () => onToggleSaved(estate),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _DemoEstateCard extends StatelessWidget {
  const _DemoEstateCard({
    required this.index,
    required this.estate,
    required this.isSaved,
    required this.onToggleSaved,
  });

  final int index;
  final DemoEstate estate;
  final bool isSaved;
  final VoidCallback onToggleSaved;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 55).clamp(0, 420)),
      curve: Curves.easeOutCubic,
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 28),
            child: child,
          ),
        );
      },
      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder<void>(
              transitionDuration: const Duration(milliseconds: 550),
              pageBuilder: (_, __, ___) => _DemoDetailsScreen(
                estate: estate,
                isSaved: isSaved,
                onToggleSaved: onToggleSaved,
              ),
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: HavenPalette.slate.withValues(alpha: 0.12),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 0.88,
                  child: Hero(
                    tag: estate.heroTag,
                    child: Image.network(
                      estate.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const _DemoImageSkeleton();
                      },
                    ),
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.12),
                          Colors.black.withValues(alpha: 0.56),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: _DemoSaveButton(
                    isSaved: isSaved,
                    onTap: onToggleSaved,
                  ),
                ),
                Positioned(
                  left: 18,
                  right: 18,
                  bottom: 18,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        estate.name,
                        style: GoogleFonts.playfairDisplay(
                          color: HavenPalette.white,
                          fontSize: 29,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _demoFormatPrice(estate.price),
                        style: GoogleFonts.playfairDisplay(
                          color: HavenPalette.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        estate.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          color: HavenPalette.white.withValues(alpha: 0.92),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DemoDetailsScreen extends StatelessWidget {
  const _DemoDetailsScreen({
    required this.estate,
    required this.isSaved,
    required this.onToggleSaved,
  });

  final DemoEstate estate;
  final bool isSaved;
  final VoidCallback onToggleSaved;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.60,
                  width: width,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: estate.heroTag,
                        child: Image.network(
                          estate.imageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const _DemoImageSkeleton();
                          },
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.20),
                              Colors.black.withValues(alpha: 0.45),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.paddingOf(context).top + 12,
                        left: 16,
                        child: _DemoGlassIcon(
                          icon: Icons.arrow_back_rounded,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.paddingOf(context).top + 12,
                        right: 16,
                        child: _DemoGlassIcon(
                          icon: isSaved
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          iconColor: isSaved ? HavenPalette.gold : Colors.white,
                          onTap: onToggleSaved,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.paddingOf(context).top + 72,
                        left: 20,
                        right: 20,
                        child: const _FloatingSearchBar(),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: HavenPalette.white,
                  width: width,
                  padding: const EdgeInsets.fromLTRB(24, 22, 24, 138),
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 520),
                    curve: Curves.easeOutCubic,
                    tween: Tween(begin: 0, end: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, (1 - value) * 20),
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 56,
                            height: 4,
                            decoration: BoxDecoration(
                              color: HavenPalette.slate.withValues(alpha: 0.16),
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _demoFormatPrice(estate.price),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 54,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            height: 0.95,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          estate.address,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: HavenPalette.slate.withValues(alpha: 0.88),
                          ),
                        ),
                        const SizedBox(height: 24),
                        _DemoAmenityStrip(estate: estate),
                        const SizedBox(height: 22),
                        Text(
                          estate.description,
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            height: 1.4,
                            color: HavenPalette.slate.withValues(alpha: 0.92),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _DemoBottomActionBar(
              isSaved: isSaved,
              onToggleSaved: onToggleSaved,
              onSchedule: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Viewing request sent for ${estate.name}.'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoAmenityStrip extends StatelessWidget {
  const _DemoAmenityStrip({required this.estate});

  final DemoEstate estate;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 24) / 4;

        return Wrap(
          spacing: 8,
          runSpacing: 10,
          children: [
            SizedBox(
              width: itemWidth,
              child: _DemoAmenityItem(
                icon: Icons.bed_outlined,
                label: '${estate.beds} Beds',
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: _DemoAmenityItem(
                icon: Icons.bathtub_outlined,
                label: '${estate.baths} Baths',
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: _DemoAmenityItem(
                icon: Icons.square_foot_outlined,
                label: '${_demoFormatInt(estate.sqft)} sqft',
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: _DemoAmenityItem(
                icon: Icons.pool_outlined,
                label: estate.hasPool ? 'Pool' : 'No Pool',
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DemoAmenityItem extends StatelessWidget {
  const _DemoAmenityItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 34, color: HavenPalette.slate.withValues(alpha: 0.9)),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: HavenPalette.slate.withValues(alpha: 0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _DemoBottomActionBar extends StatelessWidget {
  const _DemoBottomActionBar({
    required this.isSaved,
    required this.onToggleSaved,
    required this.onSchedule,
  });

  final bool isSaved;
  final VoidCallback onToggleSaved;
  final VoidCallback onSchedule;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 480),
      curve: Curves.easeOutCubic,
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 18),
            child: child,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: HavenPalette.white,
          border: Border(
            top: BorderSide(color: HavenPalette.slate.withValues(alpha: 0.10)),
          ),
        ),
        padding: EdgeInsets.fromLTRB(
          16,
          12,
          16,
          MediaQuery.paddingOf(context).bottom + 10,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: SizedBox(
                height: 58,
                child: ElevatedButton(
                  onPressed: onSchedule,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: HavenPalette.gold,
                    foregroundColor: HavenPalette.cream,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Schedule Viewing',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 58,
                child: OutlinedButton(
                  onPressed: onToggleSaved,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: HavenPalette.slate.withValues(alpha: 0.30),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutBack,
                      ),
                      child: child,
                    ),
                    child: Icon(
                      isSaved
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      key: ValueKey<bool>(isSaved),
                      color: HavenPalette.slate,
                      size: 29,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoGlassIcon extends StatelessWidget {
  const _DemoGlassIcon({
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.white,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          color: Colors.white.withValues(alpha: 0.20),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(icon, color: iconColor),
            ),
          ),
        ),
      ),
    );
  }
}

class _DemoSaveButton extends StatelessWidget {
  const _DemoSaveButton({required this.isSaved, required this.onTap});

  final bool isSaved;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Material(
          color: Colors.white.withValues(alpha: 0.20),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutBack,
                scale: isSaved ? 1.12 : 1,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: Icon(
                    isSaved
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    key: ValueKey<bool>(isSaved),
                    color: isSaved ? HavenPalette.gold : HavenPalette.white,
                    size: 21,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DemoImageSkeleton extends StatelessWidget {
  const _DemoImageSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEDEBD6),
            Color(0xFFF6F5EA),
            Color(0xFFEDEBD6),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}

class _DemoNoResults extends StatelessWidget {
  const _DemoNoResults();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HavenPalette.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: HavenPalette.slate.withValues(alpha: 0.12)),
      ),
      child: Column(
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 40,
            color: HavenPalette.slate.withValues(alpha: 0.65),
          ),
          const SizedBox(height: 10),
          Text(
            'No estates found',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: HavenPalette.slate,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Try searching by city, name, or address.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: HavenPalette.slate.withValues(alpha: 0.70),
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoSavedTab extends StatelessWidget {
  const _DemoSavedTab({
    required this.estates,
    required this.onToggleSaved,
  });

  final List<DemoEstate> estates;
  final ValueChanged<DemoEstate> onToggleSaved;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
            child: Text(
              'Saved Homes',
              style: GoogleFonts.playfairDisplay(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: HavenPalette.slate,
              ),
            ),
          ),
          Expanded(
            child: estates.isEmpty
                ? const Center(
                    child: _DemoEmptyState(
                      icon: Icons.favorite_border_rounded,
                      title: 'No saved homes yet',
                      message: 'Tap the heart icon on any listing to save it.',
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
                    itemBuilder: (context, index) {
                      final estate = estates[index];

                      return ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: HavenPalette.slate.withValues(alpha: 0.14),
                          ),
                        ),
                        tileColor: HavenPalette.white,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            estate.imageUrl,
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          estate.name,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          _demoFormatPrice(estate.price),
                          style: GoogleFonts.playfairDisplay(
                            color: HavenPalette.slate,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite_rounded),
                          color: HavenPalette.gold,
                          onPressed: () => onToggleSaved(estate),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemCount: estates.length,
                  ),
          ),
        ],
      ),
    );
  }
}

class _DemoMapTab extends StatelessWidget {
  const _DemoMapTab({
    required this.onCitySelected,
    required this.selectedCity,
  });

  final ValueChanged<String> onCitySelected;
  final String? selectedCity;

  @override
  Widget build(BuildContext context) {
    final cities = demoEstates.map((item) => item.city).toSet().toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore by City',
              style: GoogleFonts.playfairDisplay(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: HavenPalette.slate,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: cities.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final city = cities[index];
                  final count =
                      demoEstates.where((estate) => estate.city == city).length;

                  final selected = city == selectedCity;

                  return InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () => onCitySelected(city),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 260),
                      curve: Curves.easeOutCubic,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: selected
                            ? HavenPalette.gold.withValues(alpha: 0.12)
                            : HavenPalette.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: selected
                              ? HavenPalette.gold
                              : HavenPalette.slate.withValues(alpha: 0.14),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              color: HavenPalette.gold.withValues(alpha: 0.16),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.location_city_rounded,
                              color: HavenPalette.slate,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              city,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: HavenPalette.slate,
                              ),
                            ),
                          ),
                          Text(
                            '$count Listings',
                            style: GoogleFonts.inter(
                              color: HavenPalette.slate.withValues(alpha: 0.72),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: HavenPalette.slate,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoProfileTab extends StatelessWidget {
  const _DemoProfileTab();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: _DemoEmptyState(
          icon: Icons.workspace_premium_rounded,
          title: 'Premium Profile',
          message: 'Your concierge preferences and viewing calendar live here.',
        ),
      ),
    );
  }
}

class _DemoEmptyState extends StatelessWidget {
  const _DemoEmptyState({
    required this.icon,
    required this.title,
    required this.message,
  });

  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 56, color: HavenPalette.gold),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: HavenPalette.slate,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 15,
              color: HavenPalette.slate.withValues(alpha: 0.72),
            ),
          ),
        ],
      ),
    );
  }
}

String _demoFormatPrice(int value) {
  final text = value.toString();
  final formatted = text.replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => ',',
  );

  return '\$$formatted';
}

String _demoFormatInt(int value) {
  return value.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => ',',
      );
}
