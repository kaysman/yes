import 'package:bloc/bloc.dart';
import 'package:yes/data/models/category/category.model.dart';
import 'package:yes/data/service/category_service.dart';

enum HomeCategoryFetchingStatus { Idle, Loading, Error }

enum TabCategoryFetchingStatus { Idle, Loading, Error }

class CategoryState {
  final HomeCategoryFetchingStatus? homeStatus;
  final TabCategoryFetchingStatus? tabStatus;
  final List<Category>? homeCategories;
  final List<Category>? tabCategories;

  CategoryState({
    this.homeStatus,
    this.tabStatus,
    this.homeCategories,
    this.tabCategories,
  });

  CategoryState copyWith({
    List<Category>? homeCategories,
    List<Category>? tabCategories,
    HomeCategoryFetchingStatus? homeStatus,
    TabCategoryFetchingStatus? tabStatus,
  }) {
    return CategoryState(
        homeCategories: homeCategories ?? this.homeCategories,
        tabCategories: tabCategories ?? this.tabCategories,
        homeStatus: homeStatus ?? this.homeStatus,
        tabStatus: tabStatus ?? this.tabStatus);
  }
}

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState()) {
    fetchTabCategories();
  }

  Future<void> fetchTabCategories() async {
    emit(state.copyWith(tabStatus: TabCategoryFetchingStatus.Loading));
    final res = await CategoryService.fetchTabCategories();
    emit(state.copyWith(tabCategories: res, tabStatus: TabCategoryFetchingStatus.Idle));
  }

  Future<void> fetchHomeCategories() async {
    emit(state.copyWith(homeStatus: HomeCategoryFetchingStatus.Loading));
    final res = await CategoryService.fetchHomeCategories();
    emit(state.copyWith(
        homeCategories: res, homeStatus: HomeCategoryFetchingStatus.Idle));
  }
}
