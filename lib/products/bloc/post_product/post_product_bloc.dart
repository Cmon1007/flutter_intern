import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_product_event.dart';
part 'post_product_state.dart';

class PostProductBloc extends Bloc<PostProductEvent, PostProductState> {
  PostProductBloc() : super(PostProductInitial()) {
    on<PostProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
