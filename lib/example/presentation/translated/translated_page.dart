import 'package:base_app/architecture/pages/base_page.dart';
import 'package:base_app/components/gap.dart';
import 'package:base_app/example/presentation/translated/bloc/translated_bloc.dart';
import 'package:base_app/example/presentation/translated/bloc/translated_page_event.dart';
import 'package:base_app/example/presentation/translated/bloc/translated_state.dart';
import 'package:base_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TranslatedPage extends BasePage<TranslatedPageEvent, TranslatedState> {
  const TranslatedPage({super.key});

  @override
  State<StatefulWidget> createState() => _TranslatedPageState();
}

class _TranslatedPageState extends BasePageState<TranslatedPageEvent,TranslatedState,TranslatedBloc> {

  _TranslatedPageState() : super(TranslatedBloc());

  @override
  void blocListener(BuildContext context, TranslatedState state) {
    if(state.currentValue){
      MyApp.setLocale(context, Locale('en'));
    }else{
      MyApp.setLocale(context, Locale('es'));
    }
  }
  
  @override
  Widget buildContent(BuildContext context, TranslatedState state) {
    return Center(
     child: Column(
        children: [
          Text(AppLocalizations.of(context).title, style: const TextStyle(fontSize: 32),),
          const Gap(16),
          Text(AppLocalizations.of(context).subtitle, style: const TextStyle(fontSize: 16),),
          const Gap(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              state.currentValue ? const Text('🇬🇧') : const Text('🇪🇸'),
              Switch(
                value: state.currentValue, 
                onChanged: (newValue){
                  bloc.add(OnSwitchChange(newValue: newValue));
                }
              ) 
            ],
          )
        ],
      )
    );
  }
}
