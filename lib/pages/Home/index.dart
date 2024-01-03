import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tecpos/components/app_bar.dart';
import 'package:tecpos/components/app_drawer.dart';

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);

  late ValueNotifier<List<int>> expandedPanels;

  @override
  Widget build(BuildContext context) {
    final expandedPanels = useState<List<int>>([]);

    return Scaffold(
      appBar: const PosAppBar(
        rootTitle: 'Home',
      ),
      drawer: const PosDrawer(),
      body: SingleChildScrollView(
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
                    debugPrint("Start: $panelIndex, $isExpanded");

                    List<int> expanded = [...expandedPanels.value];
                    if (isExpanded) {
                      expanded.add(panelIndex);
                    } else {
                      expanded = expanded
                          .where((element) => element != panelIndex)
                          .toList();
                    }
                    expandedPanels.value = expanded;

                    debugPrint("Final: ${expandedPanels.value}");
                  },
                  children: [
                    ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: expandedPanels.value.contains(0),
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Vendas',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Vendas',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              leading: const Icon(
                                Icons.shopping_bag_outlined,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              title: Text('Pesquisar Vendas',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              leading: const Icon(
                                Icons.search_outlined,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              title: Text('Fechar Caixa',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              leading: const Icon(
                                Icons.logout_outlined,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              title: Text('Caixa Fechada',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              leading: const Icon(
                                Icons.block_outlined,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              title: Text('Venda de Produtos',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              leading: const Icon(
                                Icons.auto_graph_outlined,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              title: Text('SaftPT',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              leading: const Icon(
                                Icons.attach_money_outlined,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: expandedPanels.value.contains(1),
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Icon(
                                    Icons.group_outlined,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Clientes',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Clientes',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              leading: const Icon(
                                Icons.group_outlined,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: expandedPanels.value.contains(2),
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Icon(
                                    Icons.inventory_2_outlined,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Produtos',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Produtos',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              leading: const Icon(
                                Icons.inventory_2_outlined,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
