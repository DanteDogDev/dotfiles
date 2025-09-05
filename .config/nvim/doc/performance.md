# Performance

## [performance-avoid-endl](https://clang.llvm.org/extra/clang-tidy/checks/performance/avoid-endl.html)

Use `\n` instead of `std::endl` with `std::cout`.

- `\n` just adds a new line.
- `std::endl` adds a new line and flushes the output (which is slower).

## [performance-enum-size](https://clang.llvm.org/extra/clang-tidy/checks/performance/enum-size.html)

Make sure enums don’t use more memory than needed.

- By default, the underlying type of an enum can be bigger than necessary.
- This can waste memory, especially in large arrays or structures.

## [performance-faster-string-find](https://clang.llvm.org/extra/clang-tidy/checks/performance/faster-string-find.html)

Use `string::find(char)` instead of `string::find(string)` when searching for a single character.

- `string::find(char)` is faster because it avoids creating a temporary string.
- Both return the same result when searching for one character.

## [performance-for-range-copy](https://clang.llvm.org/extra/clang-tidy/checks/performance/for-range-copy.html)

Avoid copying elements in range-based `for` loops when not needed.

- Writing `for (auto x : container)` copies each element.
- Use `for (const auto& x : container)` to avoid the copy.

## [performance-implicit-conversion-in-loop](https://clang.llvm.org/extra/clang-tidy/checks/performance/implicit-conversion-in-loop.html)

Avoid implicit conversions in range-based `for` loops.

- Happens when the loop variable type doesn’t match the iterator’s value type.
- Can cause expensive copies, especially with complex types.

## [performance-inefficient-algorithm](https://clang.llvm.org/extra/clang-tidy/checks/performance/inefficient-algorithm.html)

Don’t use STL algorithms like `std::find` or `std::count` on associative containers.

- Associative containers (like `std::set` or `std::map`) have built-in methods that are faster.
- These methods take advantage of the container's internal ordering.

## [performance-inefficient-vector-operation](https://clang.llvm.org/extra/clang-tidy/checks/performance/inefficient-vector-operation.html)

Avoid inefficient `std::vector` operations that cause unnecessary memory reallocations.

- `push_back` and `emplace_back` inside loops can trigger multiple reallocations.
- Reserve memory beforehand to avoid this.

## [performance-move-const-arg](https://clang.llvm.org/extra/clang-tidy/checks/performance/move-const-arg.html)

Avoid using `std::move()` with const arguments, trivially-copyable types, or when passing as a const reference.

- **Const arguments**: `std::move()` has no effect on const objects.
- **Trivially-copyable types**: `std::move()` doesn’t optimize anything for these types.

## [performance-no-int-to-ptr](https://clang.llvm.org/extra/clang-tidy/checks/performance/no-int-to-ptr.html)

Avoid casting `integer`s to `pointers`.

- Casting an `integer` to a `pointer` can conceal information from the optimizer, especially if the `integer` was originally obtained from a pointer-to-`integer` cast.
- This may lead to unexpected behavior or inefficiency.

## [performance-trivially-destructible](https://clang.llvm.org/extra/clang-tidy/checks/performance/trivially-destructible.html)

Avoid declaring destructors that make types non-trivially destructible when unnecessary.

- Types with user-defined destructors are not trivially destructible.
- Remove out-of-line defaulted destructors to make the type trivially destructible.

## [performance-type-promotion-in-math-fn](https://clang.llvm.org/extra/clang-tidy/checks/performance/type-promotion-in-math-fn.html)

Avoid implicit float-to-double promotions in math library function calls.

- Functions like `sin` from `<math.h>` or `<cmath>` expect `double` parameters, so passing a `float` implicitly promotes it to `double`, which can affect performance.
- Use the correct version of the function to avoid the promotion.

## [performance-unnecessary-copy-initialization](https://clang.llvm.org/extra/clang-tidy/checks/performance/unnecessary-copy-initialization.html)

Avoid unnecessary copy initialization when a const reference would suffice.

- If a variable is only used as a const or passed as a const reference, there’s no need to create a copy.
- Using a const reference instead of copying can improve performance.

## [performance-unnecessary-value-param](https://clang.llvm.org/extra/clang-tidy/checks/performance/unnecessary-value-param.html)

Avoid passing expensive-to-copy types by value when they can be passed by `const reference`.

- Copying non-trivially copyable types can be expensive.
- If the parameter is only used as const or in const methods, pass it as a `const reference` instead.
