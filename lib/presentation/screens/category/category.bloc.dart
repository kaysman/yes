import 'package:bloc/bloc.dart';
import 'package:yes/data/models/category-new/category.model.dart';
import 'package:yes/data/service/category_service.dart';

enum CategoryListStatus { idle, success, error, loading }

class CategoryState {
  final CategoryListStatus listingStatus;
  final List<CategoryEntity>? categories;

  CategoryState({
    this.listingStatus = CategoryListStatus.idle,
    this.categories,
  });

  CategoryState copyWith({
    CategoryListStatus? listingStatus,
    List<CategoryEntity>? categories,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      listingStatus: listingStatus ?? this.listingStatus,
    );
  }
}

class CategoryBloc extends Cubit<CategoryState> {
  CategoryBloc() : super(CategoryState()) {
    getAllCategories();
  }

  getAllCategories() async {
    emit(state.copyWith(listingStatus: CategoryListStatus.loading));
    try {
      var res = await CategoryService.getCategories();
      emit(
        state.copyWith(
          categories: res,
          listingStatus: CategoryListStatus.success,
        ),
      );
    } catch (_) {
      print(_);
      emit(
        state.copyWith(
          listingStatus: CategoryListStatus.error,
        ),
      );
    }
  }
}
