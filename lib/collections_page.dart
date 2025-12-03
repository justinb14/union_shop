import 'package:flutter/material.dart';
import 'main.dart';
import 'footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Collections',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 24,
                mainAxisSpacing: 32,
                childAspectRatio: 2.2,
                children: [
                  // Essential Collection
                  Card(
                    child: ListTile(
                      leading: Image.asset('assets/images/tee.png', width: 60, height: 60, fit: BoxFit.contain),
                      title: const Text('Essential Collection', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: const Text('Our best value essentials.'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/essential_tshirt');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                        child: const Text('View'),
                      ),
                    ),
                  ),
                  // Signature Collection
                  Card(
                    child: ListTile(
                      leading: Image.asset('assets/images/hoodie_green.png', width: 60, height: 60, fit: BoxFit.contain),
                      title: const Text('Signature Collection', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: const Text('Premium university branded products.'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signature_hoodie');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                        child: const Text('View'),
                      ),
                    ),
                  ),
                  // Portsmouth City Collection
                  Card(
                    child: ListTile(
                      leading: Image.asset('assets/images/p_postcard.png', width: 60, height: 60, fit: BoxFit.contain),
                      title: const Text('Portsmouth City Collection', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: const Text('Inspired by Portsmouth City.'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/portsmouth');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                        child: const Text('View'),
                      ),
                    ),
                  ),
                  // Sale Collection
                  Card(
                    child: ListTile(
                      leading: Image.asset('assets/images/sweatshirt.png', width: 60, height: 60, fit: BoxFit.contain),
                      title: const Text('Sale Collection', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: const Text('Discounted products and offers.'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sale');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                        child: const Text('View'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}
