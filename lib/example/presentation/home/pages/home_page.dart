import 'package:base_app/base/pages/base_scaffold_page.dart';
import 'package:base_app/example/presentation/camera/pages/camera_page.dart';
import 'package:base_app/example/presentation/pokemonlist/bloc/pokemon_list_bloc.dart';
import 'package:base_app/example/presentation/pokemonlist/pages/pokemon_list_page.dart';
import 'package:base_app/example/presentation/translated/translated_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends BaseScaffoldPage<HomePageEvent, HomeState> {
  
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<StatefulWidget> createState() => _HomeStatePage();
}


class _HomeStatePage extends BaseScaffoldPageState<HomePageEvent, HomeState, HomeBloc>{

  _HomeStatePage() : super(HomeBloc());
  PokemonListBloc pokemonBloc = PokemonListBloc();

  static const Map<String, Icon> bottomItems = {
      "Home": Icon(Icons.home),
      "Camera": Icon(Icons.camera),
      "Pokemon": Icon(Icons.abc),
      "Settings": Icon(Icons.settings)
  };

  @override
  void initState() {
    super.initState();
    bloc.add(Initialize((widget as HomePage).username));
  }

  @override
  void dispose() {
    super.dispose();
    pokemonBloc.close();
  }

  @override
   Widget buildBottomModal(BuildContext context, HomeState state){
      return Container(
        height: 200,
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Modal BottomSheet'),
              ElevatedButton(
                child: const Text('Close BottomSheet'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
   }

   @override
   Widget buildDialog(BuildContext context, HomeState state){
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('This is a dialog.'),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
   }


  @override
  PreferredSizeWidget? buildTopBar(BuildContext context, HomeState state) {
    if(state.currentTabIndex == 2){
      return null;
    }
    return AppBar(
      centerTitle: true,
      title: Text(bottomItems.keys.elementAt(state.currentTabIndex))
    );
  }

  @override
  Widget buildBottomBar(BuildContext context, HomeState state) {
    return BottomNavigationBar(
      items: bottomItems.entries.map((item) => BottomNavigationBarItem(icon: item.value,label: item.key)).toList(),
      currentIndex: state.currentTabIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        bloc.add(OnChangeTab(index));
      },
    );
  }

  @override
  Widget buildContent(BuildContext context, HomeState state) {
     return Center(
        child: Builder(builder: (context) {
            if(state.currentTabIndex == 0){
              return const TranslatedPage();
            }

            if(state.currentTabIndex == 1){
              return const CameraPage();
            }

            if(state.currentTabIndex == 2){
              return  BlocProvider( 
                create: (_) => pokemonBloc,
                child: PokemonListPage(pokemonBloc)
              );
            }

            if(state.currentTabIndex == 3){
              return const Text(
                'Index 3: Settings',
              );
            }

            return const SizedBox();
        }
      )
    );
  }

  
}