# Bugprone

## [bugprone-assert-side-effect](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/assert-side-effect.html)

The condition of `assert()` is evaluated only in debug builds so a condition with side effect can cause different behavior in debug / release builds.

## [bugprone-branch-clone](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/branch-clone.html)

Checks for repeated branches in `if/else` `switch` chains

## [bugprone-casting-through-void](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/casting-through-void.html)

Avoid two-step casts through `void*` use `reinterpret_cast instead` to ensure clarity and prevent undefined behavior.

## [bugprone-compare-pointer-to-member-virtual-function](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/compare-pointer-to-member-virtual-function.html)

Detects unspecified behavior about equality comparison between pointer to member virtual function and anything other than null-pointer-constant.

## [bugprone-copy-constructor-init](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/copy-constructor-init.html)

Finds copy constructors where the constructor doesn’t call the copy constructor of the base class.

## [bugprone-crtp-constructor-accessibility](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/crtp-constructor-accessibility.html)

Detects error-prone Curiously Recurring Template Pattern usage, when the CRTP can be constructed outside itself and the derived class.

## [bugprone-empty-catch](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/empty-catch.html)

Detects and suggests addressing issues with empty catch statements.

## [bugprone-exception-escape](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/exception-escape.html)

Finds functions which may throw an exception directly or indirectly, but they should not.

## [bugprone-forward-declaration-namespace](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/forward-declaration-namespace.html)

Checks if an unused forward declaration is in a wrong namespace.

## [bugprone-inaccurate-erase](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/inaccurate-erase.html)

Checks for inaccurate use of the `erase()` method.

## [bugprone-incorrect-roundings](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/incorrect-roundings.html)

Checks the usage of patterns known to produce incorrect rounding.

## [bugprone-infinite-loop](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/infinite-loop.html)

Finds obvious infinite loops

## [bugprone-integer-division](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/integer-division.html)

Finds cases where integer division in a floating point context is likely to cause unintended loss of precision.

## [bugprone-lambda-function-name](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/lambda-function-name.html)

Checks for attempts to get the name of a function from within a lambda expression. The name of a lambda is always something like operator(), which is almost never what was intended.

## [bugprone-macro-parentheses](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/parentheses.html)

Finds macros that can have unexpected behavior due to missing parentheses.

## [bugprone-move-forwarding-reference](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/move-forwarding-reference.html)

Warns if std::move is called on a forwarding reference.

## [bugprone-parent-virtual-call](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/parent-virtual-call.html)

Detects and fixes calls to grand-…parent virtual methods instead of calls to overridden parent’s virtual methods.

## [bugprone-redundant-branch-condition](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/redundant-branch-condition.html)

Finds condition variables in nested `if` statements that were also checked in the outer `if` statement and were not changed.

## [bugprone-standalone-empty](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/standalone-empty.html)

Warns when empty() is used on a range and the result is ignored. Suggests clear() if it is an existing member function.

## [bugprone-too-small-loop-variable](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/too-small-loop-variable.html)

Detects those for loops that have a loop variable with a “too small” type which means this type can’t represent all values which are part of the iteration range.

## [bugprone-unsafe-functions](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/unsafe-functions.html)

Checks for functions that have safer, more secure replacements available, or are considered deprecated due to design flaws.

## [bugprone-use-after-move](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/use-after-move.html)

Warns if an object is used after it has been moved.

## [bugprone-virtual-near-miss](https://clang.llvm.org/extra/clang-tidy/checks/bugprone/virtual-near-miss.html)

Warn if a function is a near miss (i.e. the name is very similar and the function signature is the same) to a virtual function from a base class.
