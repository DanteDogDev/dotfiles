# Modernize

## [modernize-avoid-bind](https://clang.llvm.org/extra/clang-tidy/checks/modernize/avoid-bind.html)

Prefer using `lambda` expressions over `std::bind` or `boost::bind` for improved readability and performance (C++14 and later)

- `lambdas` are easier to read and understand than `std::bind`.
- They typically generate smaller object files due to simpler type information.

## [modernize-avoid-c-arrays](https://clang.llvm.org/extra/clang-tidy/checks/modernize/avoid-c-arrays.html)

Discourages the use of C-style arrays in favor of modern C++ containers like `std::array`, `std::vector`, or `std::span`.

- Prefer `std::array` or `std::vector` over raw C arrays for safety and clarity.
- For function parameters, use `std::span` or `gsl::span` instead of incomplete array types.

## [modernize-concat-nested-namespaces](https://clang.llvm.org/extra/clang-tidy/checks/modernize/concat-nested-namespaces.html)

Replaces nested `namespace` declarations with a single, concatenated namespace block (C++17 and later).

- Improves readability and reduces indentation.
- Makes namespace hierarchy cleaner and more concise.

## [modernize-deprecated-headers](https://clang.llvm.org/extra/clang-tidy/checks/modernize/deprecated-headers.html)

Replaces deprecated C-style headers with their C++ standard alternatives (C++14 and later)

- Replaces headers like `<stdio.h>` with `<cstdio>`, `<stdlib.h>` with `<cstdlib>`, etc.
- Encourages consistent use of modern, namespaced C++ headers.

## [modernize-deprecated-ios-base-aliases](https://clang.llvm.org/extra/clang-tidy/checks/modernize/deprecated-ios-base-aliases.html)

Replaces deprecated `std::ios_base` type aliases with their modern equivalents.

## [modernize-loop-convert](https://clang.llvm.org/extra/clang-tidy/checks/modernize/loop-convert.html)

Converts traditional `for` loops into range-based `for` loops.

- Simplifies loop syntax and improves readability.

## [modernize-macro-to-enum](https://clang.llvm.org/extra/clang-tidy/checks/modernize/macro-to-enum.html)

Replaces groups of constant-like `#define` macros with an unscoped anonymous `enum`.

## [modernize-make-shared](https://clang.llvm.org/extra/clang-tidy/checks/modernize/make-shared.html)

Replaces explicit construction of `std::shared_ptr` using `new` with `std::make_shared`.

## [modernize-make-unique](https://clang.llvm.org/extra/clang-tidy/checks/modernize/make-unique.html)

Replaces explicit construction of `std::unique_ptr` using `new` with `std::make_unique`.

## [modernize-min-max-use-initializer-list](https://clang.llvm.org/extra/clang-tidy/checks/modernize/min-max-use-initializer-list.html)

Replaces nested `std::min` and `std::max` calls with an initializer list for improved readability.

- Simplifies nested calls like `std::max(std::max(i, j), k)` to `std::max({i, j, k})`.

## [modernize-raw-string-literal](https://clang.llvm.org/extra/clang-tidy/checks/modernize/raw-string-literal.html)

Replaces string literals with escaped characters by raw string literals for better readability.

- Converts string literals with common escapes like `quotes`, `backslashes`, and `regex` characters into raw string literals using `R"()"`.
- Raw string literals improve code clarity by avoiding excessive escape sequences.

## [modernize-redundant-void-arg](https://clang.llvm.org/extra/clang-tidy/checks/modernize/redundant-void-arg.html)

Removes redundant `void` arguments from function declarations and definitions

## [modernize-replace-random-shuffle](https://clang.llvm.org/extra/clang-tidy/checks/modernize/replace-random-shuffle.html)

Replaces deprecated `std::random_shuffle` with `std::shuffle` (C++17 and later).

## [modernize-return-braced-init-list](https://clang.llvm.org/extra/clang-tidy/checks/modernize/return-braced-init-list.html)

Replaces explicit constructor calls in return statements with braced initializer lists

## [modernize-type-traits](https://clang.llvm.org/extra/clang-tidy/checks/modernize/type-traits.html)

Replaces the old syntax of standard library type traits with the more modern `traits_t<...>` and `traits_v<...>` forms (C++17 and later).

- Converts `traits<...>::value` into `traits_v<...>`, and `traits<...>::type` into `traits_t<...>`.

## [modernize-use-bool-literals](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-bool-literals.html)

Replaces integer literals that are explicitly cast to `bool` with the more readable `true` or `false` literals.

## [modernize-use-constraints](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-constraints.html)

Replaces `std::enable_if` with C++20 `requires` clauses, offering a cleaner syntax for type constraints.

## [modernize-use-equals-default](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-equals-default.html)

Replaces default function bodies in special member functions with `= default;` for better optimization.

## [modernize-use-equals-delete](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-equals-delete.html)

Identifies unimplemented private special member functions and suggests using `= delete`.

## [modernize-use-default-member-init](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-default-member-init.html)

Replaces constructor member initializers with C++11 default member initializers.

## [modernize-use-emplace](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-emplace.html)

Replaces `push_back`, `push`, or `push_front` with their `emplace` equivalents for better efficiency and less verbose code.

## [modernize-use-integer-sign-comparison](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-integer-sign-comparison.html)

Replaces signed/unsigned comparisons with `std::cmp_*` in C++20+.

## [modernize-use-nodiscard](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-nodiscard.html)

Adds `[[nodiscard]]` attribute to member functions to enforce return value checks (C++17 and later)

## [modernize-use-noexcept](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-noexcept.html)

Replaces deprecated dynamic exception specifications with `noexcept` (C++11).

## [modernize-use-nullptr](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-nullptr.html)

Converts null pointer constants (e.g., NULL, 0) to `nullptr`

## [modernize-use-override](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-override.html)

Adds `override` to overridden virtual functions and removes `virtual`.

## [modernize-use-ranges](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-ranges.html)

Detects calls to standard library iterator algorithms and replaces them with ranges versions (C++20).

## [modernize-use-std-format](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-std-format.html)

Converts calls to `absl::StrFormat` to `std::format`, modifying the format string and removing unnecessary `c_str()`/`data()` calls.

## [modernize-use-std-numbers](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-std-numbers.html)

Replaces math constants and functions with `std::numbers` constants (C++20)

## [modernize-use-std-print](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-std-print.html)

Replaces `printf`, `fprintf`, `absl::PrintF`, and `absl::FPrintf` with `std::print`/`std::println`.

## [modernize-use-uncaught-exceptions](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-uncaught-exceptions.html)

Replaces `std::uncaught_exception` (deprecated in C++17) with `std::uncaught_exceptions`.

## [modernize-use-using](https://clang.llvm.org/extra/clang-tidy/checks/modernize/use-using.html)

Replaces `typedef` with the modern `using` alias.
