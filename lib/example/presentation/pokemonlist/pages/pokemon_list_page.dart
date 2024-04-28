import 'package:base_architecture/presentation/bloc/page_status.dart';
import 'package:base_architecture/presentation/pages/base_scaffold_page.dart';
import 'package:base_app/example/domain/model/pokemon_model.dart';
import 'package:base_app/example/presentation/pokemonlist/bloc/pokemon_list_bloc.dart';
import 'package:base_app/example/presentation/pokemonlist/bloc/pokemon_list_event.dart';
import 'package:base_app/example/presentation/pokemonlist/bloc/pokemon_list_state.dart';
import 'package:base_app/example/presentation/pokemonlist/model/pokemon_list_ui_model.dart';
import 'package:base_app/example/presentation/pokemonlist/widgets/pokemon_card_widget.dart';
import 'package:flutter/material.dart';

class PokemonListPage extends BaseScaffoldPage<PokemonListPageEvent, PokemonListState>{
  
  final PokemonListBloc bloc;

  const PokemonListPage(this.bloc,{super.key});

  @override
  State<StatefulWidget> createState() => _PokemonListStatePage();

}


class _PokemonListStatePage extends BaseScaffoldPageState<PokemonListPageEvent, PokemonListState, PokemonListBloc> {
 
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  
  _PokemonListStatePage() : super(PokemonListBloc());
   
   @override
   bool get closeBlocOnDispose => false;

  @override
  void initState() {
    super.initState();
    bloc = (widget as PokemonListPage).bloc;
    bloc.add(const OnInitialize(numInitPokemon: 100));
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
    _searchFocusNode.dispose();
  }

  @override
  bool blocListenWhen(PokemonListState previous, PokemonListState current) {
    if(!previous.uiModel.isSearching && current.uiModel.isSearching){
      _searchFocusNode.requestFocus();
    }
    return true;
  }

  @override
  PreferredSizeWidget? buildTopBar(BuildContext context, PokemonListState state) {
    return AppBar(
      centerTitle: true,
      leading: !state.uiModel.isSearching 
        ? IconButton(icon: const Icon(Icons.search),onPressed: () => bloc.add(const OnSearchPressed()))
        : null,
      actions: [
        if(state.uiModel.isSearching)...[
          IconButton(icon: const Icon(Icons.close),onPressed: () => bloc.add(const OnStopSearchPressed()))
        ]
      ],
      title: state.uiModel.isSearching ? _buildSearchBar() : const Text("Pokedex"),
    );
  }

  @override
  Widget buildContent(BuildContext context, PokemonListState state) {
    switch(state.pageStatus){
      case LoadingStatus(): return _buildLoading();
      case ErrorStatus(error: var error): return _buildError(error);
      case SuccessState(): return _buildPage(state.uiModel);
      case IdleStatus():
      default: return const SizedBox();
    }
  }


  Widget _buildLoading(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  
  Widget _buildError(Exception error) {
     return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(":'(",style: TextStyle(fontSize: 32),),
          Text(error.toString())
        ],
      ),
    );
  }

  Widget _buildPage(PokemonListUIModel uiModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _buildPokemonList(uiModel.pokemonList),
    );
  }


  Widget _buildPokemonList(List<Pokemon> pokemonList) {
    return Expanded(
        child: ListView.builder(
        shrinkWrap: true,
        itemCount: pokemonList.length,
        itemBuilder: (context, index) => PokemonCardWidget(pokemon:pokemonList[index]),
      ),
    );
  }
  
  Widget _buildSearchBar() {
    return Padding(padding: const EdgeInsets.all(8),
    child: TextField(
      focusNode: _searchFocusNode,
      decoration: const InputDecoration(
          fillColor: Colors.grey,
          border: InputBorder.none,
          hintText: 'Search your pokemon...',
        ),
      controller: _searchTextController,
      onChanged: (value) => bloc.add(OnSearchBarChange(value: value)),
    ),);
  }


}


