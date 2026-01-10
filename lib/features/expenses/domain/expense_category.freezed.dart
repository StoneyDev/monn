// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpenseCategory {

 String get name; double get total; Color get color; List<ExpenseCategoryItem> get items;
/// Create a copy of ExpenseCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCategoryCopyWith<ExpenseCategory> get copyWith => _$ExpenseCategoryCopyWithImpl<ExpenseCategory>(this as ExpenseCategory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,name,total,color,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ExpenseCategory(name: $name, total: $total, color: $color, items: $items)';
}


}

/// @nodoc
abstract mixin class $ExpenseCategoryCopyWith<$Res>  {
  factory $ExpenseCategoryCopyWith(ExpenseCategory value, $Res Function(ExpenseCategory) _then) = _$ExpenseCategoryCopyWithImpl;
@useResult
$Res call({
 String name, double total, Color color, List<ExpenseCategoryItem> items
});




}
/// @nodoc
class _$ExpenseCategoryCopyWithImpl<$Res>
    implements $ExpenseCategoryCopyWith<$Res> {
  _$ExpenseCategoryCopyWithImpl(this._self, this._then);

  final ExpenseCategory _self;
  final $Res Function(ExpenseCategory) _then;

/// Create a copy of ExpenseCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? total = null,Object? color = null,Object? items = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseCategory].
extension ExpenseCategoryPatterns on ExpenseCategory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseCategory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseCategory value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseCategory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseCategory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double total,  Color color,  List<ExpenseCategoryItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseCategory() when $default != null:
return $default(_that.name,_that.total,_that.color,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double total,  Color color,  List<ExpenseCategoryItem> items)  $default,) {final _that = this;
switch (_that) {
case _ExpenseCategory():
return $default(_that.name,_that.total,_that.color,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double total,  Color color,  List<ExpenseCategoryItem> items)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseCategory() when $default != null:
return $default(_that.name,_that.total,_that.color,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _ExpenseCategory extends ExpenseCategory {
  const _ExpenseCategory({required this.name, required this.total, required this.color, required final  List<ExpenseCategoryItem> items}): _items = items,super._();
  

@override final  String name;
@override final  double total;
@override final  Color color;
 final  List<ExpenseCategoryItem> _items;
@override List<ExpenseCategoryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ExpenseCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseCategoryCopyWith<_ExpenseCategory> get copyWith => __$ExpenseCategoryCopyWithImpl<_ExpenseCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,name,total,color,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ExpenseCategory(name: $name, total: $total, color: $color, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ExpenseCategoryCopyWith<$Res> implements $ExpenseCategoryCopyWith<$Res> {
  factory _$ExpenseCategoryCopyWith(_ExpenseCategory value, $Res Function(_ExpenseCategory) _then) = __$ExpenseCategoryCopyWithImpl;
@override @useResult
$Res call({
 String name, double total, Color color, List<ExpenseCategoryItem> items
});




}
/// @nodoc
class __$ExpenseCategoryCopyWithImpl<$Res>
    implements _$ExpenseCategoryCopyWith<$Res> {
  __$ExpenseCategoryCopyWithImpl(this._self, this._then);

  final _ExpenseCategory _self;
  final $Res Function(_ExpenseCategory) _then;

/// Create a copy of ExpenseCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? total = null,Object? color = null,Object? items = null,}) {
  return _then(_ExpenseCategory(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ExpenseCategoryItem>,
  ));
}


}

/// @nodoc
mixin _$ExpenseCategoryItem {

 String get name; double get amount;
/// Create a copy of ExpenseCategoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCategoryItemCopyWith<ExpenseCategoryItem> get copyWith => _$ExpenseCategoryItemCopyWithImpl<ExpenseCategoryItem>(this as ExpenseCategoryItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseCategoryItem&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,name,amount);

@override
String toString() {
  return 'ExpenseCategoryItem(name: $name, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $ExpenseCategoryItemCopyWith<$Res>  {
  factory $ExpenseCategoryItemCopyWith(ExpenseCategoryItem value, $Res Function(ExpenseCategoryItem) _then) = _$ExpenseCategoryItemCopyWithImpl;
@useResult
$Res call({
 String name, double amount
});




}
/// @nodoc
class _$ExpenseCategoryItemCopyWithImpl<$Res>
    implements $ExpenseCategoryItemCopyWith<$Res> {
  _$ExpenseCategoryItemCopyWithImpl(this._self, this._then);

  final ExpenseCategoryItem _self;
  final $Res Function(ExpenseCategoryItem) _then;

/// Create a copy of ExpenseCategoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? amount = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseCategoryItem].
extension ExpenseCategoryItemPatterns on ExpenseCategoryItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseCategoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseCategoryItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseCategoryItem value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseCategoryItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseCategoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseCategoryItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseCategoryItem() when $default != null:
return $default(_that.name,_that.amount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double amount)  $default,) {final _that = this;
switch (_that) {
case _ExpenseCategoryItem():
return $default(_that.name,_that.amount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseCategoryItem() when $default != null:
return $default(_that.name,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _ExpenseCategoryItem implements ExpenseCategoryItem {
  const _ExpenseCategoryItem({required this.name, required this.amount});
  

@override final  String name;
@override final  double amount;

/// Create a copy of ExpenseCategoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseCategoryItemCopyWith<_ExpenseCategoryItem> get copyWith => __$ExpenseCategoryItemCopyWithImpl<_ExpenseCategoryItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseCategoryItem&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,name,amount);

@override
String toString() {
  return 'ExpenseCategoryItem(name: $name, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$ExpenseCategoryItemCopyWith<$Res> implements $ExpenseCategoryItemCopyWith<$Res> {
  factory _$ExpenseCategoryItemCopyWith(_ExpenseCategoryItem value, $Res Function(_ExpenseCategoryItem) _then) = __$ExpenseCategoryItemCopyWithImpl;
@override @useResult
$Res call({
 String name, double amount
});




}
/// @nodoc
class __$ExpenseCategoryItemCopyWithImpl<$Res>
    implements _$ExpenseCategoryItemCopyWith<$Res> {
  __$ExpenseCategoryItemCopyWithImpl(this._self, this._then);

  final _ExpenseCategoryItem _self;
  final $Res Function(_ExpenseCategoryItem) _then;

/// Create a copy of ExpenseCategoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? amount = null,}) {
  return _then(_ExpenseCategoryItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
