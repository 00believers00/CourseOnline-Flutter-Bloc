part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;

  factory TodoSearchState.initial(){
    return const TodoSearchState(searchTerm: '');
  }

  const TodoSearchState({
    required this.searchTerm,
  });

  @override
  List<Object> get props => [searchTerm];

  @override
  String toString() {
    return 'TodoSearchState{searchTerm: $searchTerm}';
  }

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
