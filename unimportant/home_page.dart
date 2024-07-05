import 'package:flutter/material.dart';

const List<Widget> options = <Widget>[
  Text('Listado de pedidos'),
  Text('POS'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Calendar { day, week, month, year }

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabControllerToSubMenu;
  late List<bool> _isSelected;
  Calendar calendarView = Calendar.week;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabControllerToSubMenu = TabController(length: 3, vsync: this);
    _isSelected = List.generate(3, (_) => false);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabControllerToSubMenu.dispose();
    super.dispose();
  }

  void _updateSelection(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < _isSelected.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          _isSelected[buttonIndex] = true;
        } else {
          _isSelected[buttonIndex] = false;
        }
      }
    });
  }

  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      side: BorderSide(color: Colors.black87, width: 2.0),
    ),
    //backgroundColor: Colors.transparent,
    foregroundColor: Color(0xFF000000),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _tabController.animateTo(0);
                  },
                  child: Text('Listado de pedidos'),
                  style: elevatedButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    _tabController.animateTo(1);
                  },
                  child: Text('POS'),
                  style: elevatedButtonStyle,
                ),
              ],
            ),
          ),
        ),
        body: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: Container(
              color: Color(0xFFD9D9D9), // Fondo de color D9D9D9
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Vista para 'Listado de pedidos'
                  Center(
                    child: Column(
                      children: [
                        Container(
                          child: subopt(),
                          margin: EdgeInsets.all(15),
                        ),
                        _textFieldSearch(),
                        //pedidosList()
                      ],
                    ),
                  ),
                  // Vista para 'POS'
                  const Center(
                    child: Column(
                      children: [
                        Text('Contenido de POS'),
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }

  Widget _textFieldSearch() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          
            hintText: 'Buscar',
            suffixIcon: const Icon(Icons.search, color: Color(0xFF000000)),
            hintStyle: const TextStyle(fontSize: 15, color: Color(0xFF000000)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Color(0xFF000000), width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Color(0xFF000000), width: 2)),
            contentPadding: const EdgeInsets.all(10)),
      ),
    );
  }

  Widget subopt() {
    return SegmentedButton<Calendar>(
      style: SegmentedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        foregroundColor: Color(0xFF000000),
        selectedForegroundColor: Colors.white,
        selectedBackgroundColor: Color(0xFFFF562F),
      ),

      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: SizedBox(
          width: 53, // Ancho fijo deseado
          child: Center(child: Text('Local')
          ),
        ),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.week,
          label: SizedBox(
            width: 53, // Ancho fijo deseado
            child: Center(child: Text('llevar')),
          ),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.month,
          label: SizedBox(
            width: 53, // Ancho fijo deseado
            child: Center(child: Text('Delivery')),
          ),
        ),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          calendarView = newSelection.first;
        });
      },
    );
  }

  Widget pedidosList() {
    return Column(
      children: [
        _textFieldSearch(),
        Expanded(
          child: Container(
            child: Text('Aquí empezaremos de cero'),
          ),
        ),
      ],
    );
  }

}
