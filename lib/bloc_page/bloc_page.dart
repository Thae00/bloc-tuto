import 'package:bloctuto/bloc_page/bloc_event.dart';
import 'package:bloctuto/bloc_page/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class blocPage extends Bloc<blocEvent, BlocState> {
  blocPage() : super(InitialState()) {
    on<loginEvent>((event, emit) => emit(loginState()));
    on<registerEvent>((event, emit) => emit(registerState()));
    on<homeEvent>((event, emit) => emit(homeState()));

    on<newPostEvent>((event, emit) => emit(newPostState()));
    on<postListEvent>((event, emit) => emit(postListState()));
  }
}
