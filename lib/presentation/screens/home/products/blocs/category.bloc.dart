// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yes/data/models/category-new/category.model.dart';
// import 'package:yes/data/models/product%20-new/pagination.model.dart';
// import 'package:yes/data/service/category_service.dart';

// class CategoryBloc extends Cubit<CategoryState> {
//   CategoryBloc() : super(CategoryState());

//   getAllCategories(
//       {PaginationDTO? filter,
//       bool subtle = false,
//       BuildContext? context}) async {
//     emit(state.copyWith(
//       listingStatus: subtle
//           ? CategoryListStatus.silentLoading
//           : CategoryListStatus.loading,
//     ));

//     if (filter == null) {
//       filter = PaginationDTO();
//     }
//     try {
//       var res =
//           await CategoryService.getCategories(queryParams: filter.toJson());
//       emit(state.copyWith(
//         categories: res,
//         listingStatus: CategoryListStatus.idle,
//       ));
//     } catch (_) {
//       print(_);
//       emit(state.copyWith(listingStatus: CategoryListStatus.error));
//     }
//   }
// }

// enum CategoryListStatus { idle, loading, error, silentLoading }

// class CategoryState {
//   final List<CategoryEntity>? categories;
//   final CategoryListStatus? listingStatus;

//   CategoryState({
//     this.categories,
//     this.listingStatus = CategoryListStatus.idle,
//   });

//   CategoryState copyWith({
//     List<CategoryEntity>? categories,
//     CategoryListStatus? listingStatus,
//   }) {
//     return CategoryState(
//       categories: categories ?? this.categories,
//       listingStatus: listingStatus ?? this.listingStatus,
//     );
//   }
// }
