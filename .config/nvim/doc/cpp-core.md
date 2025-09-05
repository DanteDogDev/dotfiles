# Cppcoreguidelines

## [cppcoreguidelines-avoid-goto](https://clang.llvm.org/extra/clang-tidy/checks/cppcoreguidelines/avoid-goto.html)

Flags use of `goto` for control flow (except forward jumps in nested loops).

## [cppcoreguidelines-init-variables](https://clang.llvm.org/extra/clang-tidy/checks/cppcoreguidelines/init-variables.html)

Flags uninitialized local variables

## [cppcoreguidelines-no-malloc](https://clang.llvm.org/extra/clang-tidy/checks/cppcoreguidelines/no-malloc.html)

Warns on use of C-style memory management (`malloc`, `calloc`, `realloc`, `free`).

## [cppcoreguidelines-prefer-member-initializer](https://clang.llvm.org/extra/clang-tidy/checks/cppcoreguidelines/prefer-member-initializer.html)

Suggests moving member initialization from constructor body to initializer list.

## [cppcoreguidelines-pro-type-cstyle-cast](https://clang.llvm.org/extra/clang-tidy/checks/cppcoreguidelines/pro-type-cstyle-cast.html)

Flags unsafe C-style casts doing static_cast, const_cast, or reinterpret_cast.

## [cppcoreguidelines-pro-type-member-init](https://clang.llvm.org/extra/clang-tidy/checks/cppcoreguidelines/pro-type-member-init.html)

Flags constructors that don’t initialize all fields that would otherwise be undefined.

## [cppcoreguidelines-pro-type-static-cast-downcast](https://clang.llvm.org/extra/clang-tidy/checks/cppcoreguidelines/pro-type-static-cast-downcast.html)

Flags static_casts from base to derived classes; suggests dynamic_cast instead.
