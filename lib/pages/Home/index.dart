// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpos/components/app_bar.dart';
import 'package:tecpos/components/app_drawer.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final List<MenuItem>? subItems;
  final Function(BuildContext) onTap;

  MenuItem({
    required this.title,
    required this.icon,
    this.subItems,
    required this.onTap,
  });
}

final List<MenuItem> menuItems = [
  MenuItem(
    title: 'Vendas',
    icon: Icons.shopping_bag_outlined,
    onTap: (BuildContext context) {},
    subItems: [
      MenuItem(
        title: 'Vendas',
        icon: Icons.shopping_bag_outlined,
        onTap: (BuildContext context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/login');
          });
        },
      ),
      MenuItem(
        title: 'Pesquisar Vendas',
        icon: Icons.search_outlined,
        onTap: (BuildContext context) {},
      ),
      MenuItem(
        title: 'Fechar Caixa',
        icon: Icons.logout_outlined,
        onTap: (BuildContext context) {},
      ),
      MenuItem(
        title: 'Caixa Fechada',
        icon: Icons.block_outlined,
        onTap: (BuildContext context) {},
      ),
      MenuItem(
        title: 'Venda de Produtos',
        icon: Icons.auto_graph_outlined,
        onTap: (BuildContext context) {},
      ),
      MenuItem(
        title: 'SaftPT',
        icon: Icons.attach_money_outlined,
        onTap: (BuildContext context) {},
      ),
    ],
  ),
  MenuItem(
    title: 'Clientes',
    icon: Icons.group_outlined,
    onTap: (BuildContext context) {},
    subItems: [
      MenuItem(
        title: 'Clientes',
        icon: Icons.group_outlined,
        onTap: (BuildContext context) {},
      ),
    ],
  ),
  MenuItem(
    title: 'Produtos',
    icon: Icons.inventory_2_outlined,
    onTap: (BuildContext context) {},
    subItems: [
      MenuItem(
        title: 'Produtos',
        icon: Icons.inventory_2_outlined,
        onTap: (BuildContext context) {},
      ),
    ],
  ),
];

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);

  late ValueNotifier<List<int>> expandedPanels;

  @override
  Widget build(BuildContext context) {
    final expandedPanels = useState<List<int>>([]);

    const double maxWidth = 400;

    return Scaffold(
      appBar: const PosAppBar(
        rootTitle: 'Home',
      ),
      drawer: const PosDrawer(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: maxWidth,
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ExpansionPanelList(
                      expandedHeaderPadding: EdgeInsets.zero,
                      elevation: 1,
                      expansionCallback: (int panelIndex, bool isExpanded) {
                        List<int> expanded = [...expandedPanels.value];
                        if (isExpanded) {
                          expanded.add(panelIndex);
                        } else {
                          expanded = expanded
                              .where((element) => element != panelIndex)
                              .toList();
                        }
                        expandedPanels.value = expanded;
                      },
                      children: menuItems.map((menuItem) {
                        int index = menuItems.indexOf(menuItem);
                        return ExpansionPanel(
                          canTapOnHeader: true,
                          isExpanded: expandedPanels.value.contains(index),
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              leading: Icon(menuItem.icon),
                              title: Text(menuItem.title),
                            );
                          },
                          body: Column(
                            children: menuItem.subItems?.map((subItem) {
                                  return ListTile(
                                    leading: Icon(subItem.icon),
                                    title: Text(subItem.title),
                                    onTap: () => subItem.onTap(context),
                                  );
                                }).toList() ??
                                [],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
