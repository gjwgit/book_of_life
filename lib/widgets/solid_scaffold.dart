import 'package:flutter/material.dart';

class NavigationItem {
  final IconData icon;
  final String label;
  final Widget widget;
  final VoidCallback? onTap;

  const NavigationItem({
    required this.icon,
    required this.label,
    required this.widget,
    this.onTap,
  });
}

class SolidScaffold extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final List<NavigationItem>? navigationItems;

  const SolidScaffold({super.key, this.appBar, this.navigationItems});

  @override
  State<SolidScaffold> createState() => _SolidScaffoldState();
}

class _SolidScaffoldState extends State<SolidScaffold> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        );
      case 1:
        return const Center(
          child: Text('Settings Page', style: TextStyle(fontSize: 24)),
        );
      case 2:
        return const Center(
          child: Text('Profile Page', style: TextStyle(fontSize: 24)),
        );
      default:
        return const Center(child: Text('Unknown Page'));
    }
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Counter'),
            selected: _selectedIndex == 0,
            onTap: () {
              _onDestinationSelected(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            selected: _selectedIndex == 1,
            onTap: () {
              _onDestinationSelected(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            selected: _selectedIndex == 2,
            onTap: () {
              _onDestinationSelected(2);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    final pageNames = ['Counter', 'Settings', 'Profile'];
    final currentPage = pageNames[_selectedIndex];

    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              size: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Text(
              'Page: $currentPage',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 16),
            if (_selectedIndex == 0) ...[
              Icon(
                Icons.numbers,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Text(
                'Count: $_counter',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const Spacer(),
            Text(
              'Status: Ready',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final useDrawer =
        screenWidth < 600; // Use drawer for screens smaller than 600px

    return Scaffold(
      appBar: widget.appBar,
      drawer: useDrawer ? _buildDrawer() : null,
      body: Column(
        children: [
          Expanded(
            child: useDrawer
                ? _buildBody()
                : Row(
                    children: [
                      NavigationRail(
                        selectedIndex: _selectedIndex,
                        onDestinationSelected: _onDestinationSelected,
                        labelType: NavigationRailLabelType.all,
                        destinations: const [
                          NavigationRailDestination(
                            icon: Icon(Icons.home),
                            label: Text('Counter'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.settings),
                            label: Text('Settings'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.person),
                            label: Text('Profile'),
                          ),
                        ],
                      ),
                      const VerticalDivider(thickness: 1, width: 1),
                      Expanded(child: _buildBody()),
                    ],
                  ),
          ),
          _buildStatusBar(),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
